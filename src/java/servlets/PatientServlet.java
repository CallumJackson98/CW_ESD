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
//@WebServlet(name = "PatientServlet", urlPatterns = {"/PatientServlet"})
@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {

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
        String viewer;
        String rp = request.getParameter("rpButton");
        String ba = request.getParameter("baButton");
        String uName = request.getParameter("uName_hidden");
        String userID = "";
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        if(bool){
            
            userID = db.getUserID(uName, "CLIENTS");
            
        }
        
        if(rp != null){
            viewer = "RequestPrescription.jsp";
        }else if(ba != null){
            viewer = "BookAppointment.jsp";
        }else{
            // Array list of all bookings for this user
            ArrayList<String> allAppointments = db.getAllAppointments(userID);
            
            System.out.println("HERE " + allAppointments.size() + " " + userID);
            
            request.setAttribute("allApps", allAppointments);
            viewer = "ViewBookings.jsp";
        }
        
        
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
        
    }
    
        
}
