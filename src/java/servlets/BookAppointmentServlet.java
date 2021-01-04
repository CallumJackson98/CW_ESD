/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BookAppointmentServlet", urlPatterns = {"/BookAppointmentServlet"})
public class BookAppointmentServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        // Get values from form
        String date = request.getParameter("date");
        String hour = request.getParameter("hour");
        String mins = request.getParameter("mins");
        String uName = request.getParameter("uName_hidden");
        String day = request.getParameter("day_hidden");
        String staff = request.getParameter("staff");
        
        System.out.println(date + " " + hour + " " + mins + " " + day + " " + uName);
        
        // Create db instance
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // If there is a connection
        if(bool){
            
            // Check if appointment is a duplicate for staff mem
            if(staff.equals("Doctor")){
                
                // Get ID of FT doc
                String ftDocID = db.getStaffID("doctor", "FT");
                
                // Check full time doctor (MON-FRI)
                if(!db.checkIfAppExists(date, hour+":"+mins, ftDocID)){
                    
                    // If available, create booking
                    System.out.println("CREATE BOOKING FOR FT DOC");
                   
                }else{
                    
                    // Else: Check pt doctor if day is correct (TUE-THUR)
                    if(!"Monday".equals(day) || !"Friday".equals(day)){
                        
                        // Get ID of PT doc
                        String ptDocID = db.getStaffID("doctor", "PT");
                        
                        // If available create booking
                        if(!db.checkIfAppExists(date, hour+":"+mins, ptDocID)){
                            
                            // Create booking
                            System.out.println("CREATE BOOKING FOR PT DOC");
                            
                        }
                        
                    }
   
                }
            }else{
                
                // Check nurse if day is correct (MON/FRI)
                if(!"Monday".equals(day) || !"Friday".equals(day)){
                    
                    // Get ID of PT nurse
                    String ptNurseID = db.getStaffID("nurse", "PT");
                
                    // Create booking if available
                    if(!db.checkIfAppExists(date, hour+":"+mins, ptNurseID)){
                        
                        // Create booking
                        System.out.println("CREATE BOOKING FOR PT NURSE");
                        
                    }
                    
                }
                
                
                
                
            }
            
        }
        
        
        // Redirect to patient dashboard
        response.sendRedirect("PatientDashboard.jsp");
        
    }

}
