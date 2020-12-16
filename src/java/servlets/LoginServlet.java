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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException {

        // Get values from form
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        String uCheck = request.getParameter("userCheck");

        System.out.println(uCheck + " check id");

        DBBean db = new DBBean();
        boolean bool = db.getConnection();
        int userType = 0;

        if(bool){

            userType = db.verifyUser(user, pwd);

        }

        if(userType != -1){

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("type", userType); // REMOVE
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(30*60);
            Cookie userName = new Cookie("user", user);
            userName.setMaxAge(30*60);
            response.addCookie(userName);
            
            switch (userType) {
                case 0:
                case 1:
                    response.sendRedirect("StaffDashboard.jsp");
                    break;
                case 2:
                    response.sendRedirect("PatientDashboard.jsp");
                    break;
                default:
                    response.sendRedirect("AdminDashboard.jsp");
                    break;
            }


        }else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Either user name or password is wrong or user does not exist.</font>");
            rd.include(request, response);
        }
                
    }

}
