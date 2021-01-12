/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;

/**
 *
 * @author callu
 */
@WebServlet(name = "PayInvoiceServlet", urlPatterns = {"/PayInvoiceServlet"})
public class PayInvoiceServlet extends HttpServlet {

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
       
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // Get items from previos page
        String arType = request.getParameter("arButton");
        String checked = request.getParameter("checked_hidden");
        
        System.out.println(arType + " checked: " + checked);
        
        LocalDate localDate = LocalDate.now();//For reference
        System.out.println(localDate);
        
        String date = localDate.toString();
        
        System.out.println(date);
        
        if(!"".equals(checked)){
            
            // Split checked string into individual nums
            String[] splitChecked = checked.split(" ");
            
            if(bool){
                // For each row selected, perform action
                for(int i = 0; i < splitChecked.length; i++){
                    System.out.println("here55");
                    // Call acceptRejectStaff function from DBBEAN
                    db.setInvoicePaid(splitChecked[0], date);
                    
                }
            }
        }
        
        response.sendRedirect("PatientDashboard.jsp");
        
    }

}
