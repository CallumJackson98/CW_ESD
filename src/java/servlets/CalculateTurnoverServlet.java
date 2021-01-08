/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author callu
 */
@WebServlet(name = "CalculateTurnoverServlet", urlPatterns = {"/CalculateTurnoverServlet"})
public class CalculateTurnoverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        
        
        
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
        
    }

}
