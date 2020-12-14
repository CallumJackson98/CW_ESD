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
//@WebServlet(name = "AdminServlet", urlPatterns = {"/ApprovalServlet"})
@WebServlet("/ApprovalServlet")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String viewer;
        String sr = request.getParameter("srButton");
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // If not null, do actions for signup reviews
        if(sr != null){
            
            // Set viewer
            viewer = "SignupApprovals.jsp";
            
            // Create String array list to store all users awaiting approval
            if(bool){
            
                ArrayList<String> approvalUsers = db.getApprovalUsers();
                request.setAttribute("appUsers", approvalUsers);
            
            }
           
        }else{
            // Else, action is view all records
            
            // Set viewer
            viewer = "ViewAllUsers.jsp";
            
            // Create String array list to store users 
            if(bool){
                
                // Array list of all users
                ArrayList<String> allUsers = db.getAllUsers();
                request.setAttribute("allUsers", allUsers);
                
                // Array list of all NHS patients
                ArrayList<String> allNhsPat = db.getAllPatientsOfType("NHS");
                request.setAttribute("allNhs", allNhsPat);
                
                // Array list of all private patients
                ArrayList<String> allPrivatePat = db.getAllPatientsOfType("Private");
                request.setAttribute("allPrivate", allPrivatePat);
                
            }
            
        }
        
        
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
                
    }

}

