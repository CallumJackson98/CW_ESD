/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;

/**
 *
 * @author Sam Colwill
 */
@WebServlet("/ChangeConsultationCostServlet")
public class ChangeConsultationCostServlet {
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        
//        System.out.println("We got inside the servlet.");
//        
//        String viewer = "AdminDashboard.jsp";
//        
//        String doctorPrice = request.getParameter("doctorPrice");
//        String nursePrice = request.getParameter("nursePrice");
//        String operationPrice = request.getParameter("operationPrice");
//        
//        System.out.println(doctorPrice + " " + nursePrice + " " + operationPrice);
//            
//        // Get connection to database
//        DBBean db = new DBBean();
//        boolean bool = db.getConnection();
//        
//        if(!doctorPrice.equals("")){
//            System.out.println("hereresam");
//                if(bool) {
//                    db.setConsultationCosts("doctor", doctorPrice);
//            }
//        }
//        
//        if(!nursePrice.equals("")){
//                if(bool) {
//                    db.setConsultationCosts("nurse", nursePrice);
//            }
//        }
//        
//        if(!operationPrice.equals("")){
//                if(bool) {
//                    db.setConsultationCosts("operation", operationPrice);
//            }
//        }
//        
//        // Redirect to admin dashboard
//        RequestDispatcher view = request.getRequestDispatcher(viewer);
//        
//        view.forward(request, response);
        
        response.sendRedirect("AdminDashboard.jsp");
    }
    
}
