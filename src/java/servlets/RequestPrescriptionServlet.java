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
//@WebServlet(name = "RequestPrescriptionServlet", urlPatterns = {"/RequestPrescriptionServlet"})
@WebServlet("/RequestPrescriptionServlet")
public class RequestPrescriptionServlet extends HttpServlet {

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
            String uName = request.getParameter("uName_hidden");
            String drugName = request.getParameter("drugName");
            // Get connection to database
            DBBean db = new DBBean();
            boolean bool = db.getConnection();
            
            if(bool){
                
                // Do database action
                db.addRequestedPrescription(uName, drugName);
                
            }
            
            // Redirect to patient dashboard
            response.sendRedirect("PatientDashboard.jsp");
        
        }
}

