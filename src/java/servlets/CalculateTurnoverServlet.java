

//Admin Delete Booking Servlet
//Callum Jackson and Sam Colwill
//16-01-2021

package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;


@WebServlet(name = "CalculateTurnoverServlet", urlPatterns = {"/CalculateTurnoverServlet"})
public class CalculateTurnoverServlet extends HttpServlet {

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
        
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        response.setContentType("text/html;charset=UTF-8");
        
        // Viewer
        String viewer = "CalculateTurnover.jsp";
        
        
        // Get values from form
        String startDate = request.getParameter("startDate");
        
        // Convert date to accepted format.
        String[] startDateParts = startDate.split("-");
        String formattedStartDate = "";
        
        for(int i = 2; i > -1; i--){
            
            if(i != 0){
                formattedStartDate += startDateParts[i] + "-";
            }else{
                formattedStartDate += startDateParts[i];
            }
        }
        
        String endDate = request.getParameter("endDate");
        
        // Convert date to accepted format.
        String[] endDateParts = endDate.split("-");
        String formattedEndDate = "";
        
        for(int i = 2; i > -1; i--){
            
            if(i != 0){
                formattedEndDate += endDateParts[i] + "-";
            }else{
                formattedEndDate += endDateParts[i];
            }
        }
        
        
        ArrayList<String> paidInvoices = new ArrayList<String>();
        paidInvoices = db.getPaidInvoices(formattedStartDate, formattedEndDate);
        
        double totalTurnover = 0;
        for (int i = 0 ; i < paidInvoices.size() ; i++){
            totalTurnover += Double.parseDouble(paidInvoices.get(i).split(" ")[0]) + Double.parseDouble(paidInvoices.get(i).split(" ")[1]);
        }
        
        String totalTurnoverString = Double.toString(totalTurnover);
        
        request.setAttribute("totalTurnover", totalTurnoverString);
        
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.include(request, response);
        
    }      

}
