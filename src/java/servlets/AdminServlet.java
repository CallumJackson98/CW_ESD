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
 * @author Jake and callu
 */
//@WebServlet(name = "AdminServlet", urlPatterns = {"/ApprovalServlet"})
@WebServlet("/ApprovalServlet")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String viewer= "";
        String sr = request.getParameter("srButton");
        String va = request.getParameter("vaButton");
        String vi = request.getParameter("viButton");
        String avb = request.getParameter("avbButton");
        String ccc = request.getParameter("cccButton");
        
        System.out.println(sr + " " + va + " " + vi);
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        // If not null, do actions for signup reviews
        if(sr != null){
            
            System.out.println("here");
            
            // Set viewer
            viewer = "SignupApprovals.jsp";
            
            // Create String array list to store all users awaiting approval
            if(bool){
            
                System.out.println("in bool here");
                ArrayList<String> approvalUsers = db.getApprovalUsers();
                request.setAttribute("appUsers", approvalUsers);
            
            }
           
        }else if(va != null){
            
            System.out.println("here1");
            
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
            
        }else if(vi != null){
        
            System.out.println("here2");
            
            // Set viewer
            viewer = "ViewInvoices.jsp";
            
            // Forward list of invoices
            if(bool){
                
                // Array list of all invoices
                ArrayList<String> allInvoices = db.getAllInvoices();
                request.setAttribute("allInvoices", allInvoices);
            
            }
        
        }else if(ccc != null){
            
            String prices = db.getPrices();
            ArrayList pricesList = new ArrayList<String>();
            pricesList.add(prices);
            request.setAttribute("prices", pricesList);
            //Set viewer
            viewer = "ChangeConsultationCost.jsp";
            
        }else if(avb != null){
            
            ArrayList<String> allAppointments = db.getAllAppointments();
            request.setAttribute("allAppointments", allAppointments);
            //Set viewer
            viewer = "AdminViewBookings.jsp";
            
        }else{
            //Set viewer
            viewer = "CalculateTurnover.jsp";
            
        }
        
        RequestDispatcher view = request.getRequestDispatcher(viewer);
        view.forward(request, response);
                
        
    }

}

