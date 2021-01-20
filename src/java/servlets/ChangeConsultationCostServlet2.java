

//Admin Delete Booking Servlet
//Callum Jackson and Sam Colwill
//16-01-2021

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;


@WebServlet(name = "ChangeConsultationCostServlet2", urlPatterns = {"/ChangeConsultationCostServlet2"})
public class ChangeConsultationCostServlet2 extends HttpServlet {

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
        
        String doctorPrice = request.getParameter("doctorPrice");
        String nursePrice = request.getParameter("nursePrice");
        String operationPrice = request.getParameter("operationPrice");
        
        String viewer = "AdminDashboard.jsp";
        
        System.out.println(doctorPrice + " " + nursePrice + " " + operationPrice);
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        if(!doctorPrice.equals("")){
            System.out.println("hereresam");
                if(bool) {
                    db.setConsultationCosts("doctor", doctorPrice);
            }
        }
        
        if(!nursePrice.equals("")){
                if(bool) {
                    db.setConsultationCosts("nurse", nursePrice);
            }
        }
        
        if(!operationPrice.equals("")){
                if(bool) {
                    db.setConsultationCosts("Operation", operationPrice);
            }
        }
        
        //RequestDispatcher view = request.getRequestDispatcher(viewer);
        //view.forward(request, response);
        
        response.sendRedirect("AdminDashboard.jsp");  
        
    }

}
