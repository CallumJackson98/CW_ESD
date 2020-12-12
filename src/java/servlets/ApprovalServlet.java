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
//@WebServlet(name = "ApprovalServlet", urlPatterns = {"/ApprovalServlet"})
@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String viewer;
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // Create String array list to store all users awaiting approval
        if(bool){
            
            ArrayList<String> approvalUsers = db.getApprovalUsers();
            request.setAttribute("appUsers", approvalUsers);
            
        }
        
        viewer = "SignupApprovals.jsp";
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
                
    }

}

