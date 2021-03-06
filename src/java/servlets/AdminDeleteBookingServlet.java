
//Admin Delete Booking Servlet
//Callum Jackson and Sam Colwill
//16-01-2021

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;


//@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/DeleteUserServlet"})
@WebServlet("/AdminDeleteBookingServlet")
public class AdminDeleteBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // Get items from previos page
        String appID = request.getParameter("appID");
        
        if(!"".equals(appID)){
            
            if(bool){
                
                db.deleteAppointment(appID);
                
            }
            
        }
        
        // Return to dashboard
        response.sendRedirect("AdminDashboard.jsp");
        
    }

}
