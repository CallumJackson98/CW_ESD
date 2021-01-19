/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;

/**
 *
 * @author Jake
 */
@WebServlet(name = "ConsultationServlet", urlPatterns = {"/ConsultationServlet"})
public class ConsultationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the variables from form
        String date = request.getParameter("date");
        String hour = request.getParameter("hour");
        String mins = request.getParameter("mins");
        String appID = request.getParameter("appID");
        String surgery = request.getParameter("surgery");
        String prescription = request.getParameter("prescription");
        String slotNum = request.getParameter("slotNum");
        boolean failed = false;
        String formattedDate = "";
        String viewer = "StaffDashboard.jsp";

        // Initialise variables of empty
        if(!date.equals("")){
            // Convert date to accepted format.
            String[] dateParts = date.split("-");

            // Handle if null vals (no operation)
            if(hour.equals(null)){ // MIGHT NEED TO CHANGE TO ""
                hour = "0";
            }
            if(mins.equals(null)){
                mins = "0";
            }

            for(int i = 2; i > -1; i--){

                if(i != 0){
                    formattedDate += dateParts[i] + "-";
                }else{
                    formattedDate += dateParts[i];
                }

            }
        }
        
        if(slotNum.equals("")){
            slotNum = "0";
        }
        
        try{
            int slotNumInt = Integer.parseInt(slotNum);
        }catch(Exception e){
            System.out.println("String as slot num.");
            failed = true;
        }
        
        // Connection to DB
        // Create db instance
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        if(bool && !failed){
            
            System.out.println("get ID from booking");
            // Get client ID from booking
            String cID = db.getClientIdFromBooking(appID);
            String eID = db.getEmployeeIdFromBooking(appID);
            
            System.out.println("calc charge");
            // Calculate charge of operation
            int slotsInt = (Integer) Integer.parseInt(slotNum);
            System.out.println("here");
            float opCostFloat = Float.parseFloat(db.getOperationSlotCost("Operation"));
            System.out.println("here1");
            int opCost = (int) opCostFloat;
            System.out.println("here2");
            String charge = Integer.toString(opCost*slotsInt);
            System.out.println("here3");
            
            // If surgery, create record in OPERATIONS
            if(surgery.equals("surYes")){
                
                
                System.out.println("inside surg");
                // Check if surgery already exists for client at this time
                if(!db.checkIfSurgeryExists(formattedDate, hour+":"+mins+":00", cID)){
                    
                    // Create operation record
                    db.addOperation(eID, cID, formattedDate, hour+":"+mins+":00", slotNum, charge);
                    
                }else{
                    failed = true;
                }

            }
            if(!failed){
                
                System.out.println("surge not failed do rest");
                // If prescription, create record in PRESCRIPTIONS
                if(!prescription.equals("")){
                    
                    String uName = db.getClientUnameFromID(cID);
                    
                    db.createPrescription(uName, prescription);
                    
                }
            
                // Set service type
                String paid;
                LocalDate localDate = LocalDate.now();
                String paidDate = localDate.toString();
                if(db.isNhsClient(cID)){
                    
                    paid = "true";
                    
                }else{
                    
                    paid = "false";
                    paidDate = "";
                    
                }
                
                System.out.println("con cost");
                // Get employee uName
                String empUname = db.getEmployeeUname(eID);
                System.out.println(empUname + " " + eID);
                
                // Get employee type
                String empType = db.getEmployeeType(empUname);
                
                System.out.println(empType);
                
                System.out.println("here");
                // Calculate consultation cost
                float conCostFloat = Float.parseFloat(db.getOperationSlotCost(empType));
                System.out.println("here1");
                int conCost = (int) conCostFloat;
                System.out.println("here2");
                String strConCost = Integer.toString(conCost);
                
                // Create invoice
                db.createInvoice(eID, cID, strConCost, charge, paid, paidDate);

                // Delete from BOOKING_SLOTS
                db.deleteAppointment(appID);
                
            }else{
                
                // Take no action, send back to homepage with error
                
            }
              
        } 
        
        // Return to dashboard - ADD ERROR MESSAGE HERE
        //response.sendRedirect("StaffDashboard.jsp");
        
        // Redirect to staff dashboard
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        if(failed){
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Consultation not complete due to double booking of operation.</font>");
        }
        view.include(request, response);
        
    }

}
