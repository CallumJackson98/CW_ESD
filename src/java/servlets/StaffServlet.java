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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DBBean;

/**
 *
 * @author Jake
 */
//@WebServlet(name = "StaffServlet", urlPatterns = {"/StaffServlet"})
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {

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
        
        // Get button from form
        String sr = request.getParameter("apButton");
        String viewer;
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // Set viewer
        viewer = "PrescriptionApprovals.jsp";

        // Create String array list to store all users awaiting approval
        if(bool){

            ArrayList<String> requestedPrescriptions = db.getRequestedPrescriptions();
            request.setAttribute("reqPrescriptions", requestedPrescriptions);

        }
        
        // Forward to page
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
        
    }
}
