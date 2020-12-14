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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DBBean;

/**
 *
 * @author Jake
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws 
            ServletException, IOException {
        
        // Get values from sign up form
        String fName = request.getParameter("fName");
        String sName = request.getParameter("sName");
        String pwd = request.getParameter("pwd");
        String address = request.getParameter("address");
        String sType = request.getParameter("serviceType");
        String sRole = request.getParameter("staffRole");
        
        // Get connection to database
        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        
        if(bool){
        
            int flag = 0;
            
            // Generate username
            int min = 0;  
            int max = 1000;  
            int uNameSeed = (int) (Math.random() * (max - min + 1) + min);  
            String userName = fName + sName + uNameSeed;

            // Staff sign up
            if(sType == null){

                // Create string of roles in correct format
                String role = "";
                if("Doctor".equals(sRole)){
                    role = "doctor";
                }else{
                    role = "nurse";
                }
                
                // Create new record in TEMPSTAFF
                db.addTempStaff("('"+fName+" "+sName+"',"+"'"+address+"',"+"'"+userName+"',"+"'"+pwd+"',"+"'"+role+"')");

            }else{// Patient sign up

                // Create new record in USERS
                db.addUser("('"+userName+"',"+"'"+pwd+"',"+"'"+"client"+"')");
                
                String fullName = fName + " " + sName;
                
                // Create new record in CLIENTS
                db.addClient("('"+fullName+"',"+"'"+address+"',"+"'"+sType+"',"+"'"+userName+"')");   

            }

            // Redirect to home page
            response.sendRedirect("HomePage.html");
        
        }else{
            System.out.println("Error connecting to databse.");
        }
                
    }

}


