/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jake
 */
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

	private ServletContext context;
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		this.context.log("Requested Resource::"+uri);
		
		HttpSession session = req.getSession(false);
		
                // Redirect if accessing page when not logged in
<<<<<<< HEAD
		if(session == null && !(uri.endsWith("html") || uri.endsWith("LoginServlet") || uri.endsWith("SignUp.jsp"))){
=======
		if(session == null && !(uri.endsWith("html") || uri.endsWith("LoginServlet") || uri.endsWith("SignUpServlet") || uri.endsWith("SignUp.jsp") || uri.endsWith("StaffSignUp.jsp"))){
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
			this.context.log("Unauthorised access request");
			res.sendRedirect("HomePage.html");
                // If not logged in and access page that is allowed, do.
		}else if(session == null){
                    
                    chain.doFilter(request, response);
                    this.context.log("Correct action, no session.");
                // Filter for logged in users. 
                }else{
                    
                    try{
                        int userType = (Integer) session.getAttribute("type");
<<<<<<< HEAD
                        this.context.log("USER HERE HERE HERE HERE ---->" + userType + uri);
                        System.out.println("USER HERE HERE HERE HERE ---->" + userType + uri);
                        
                        if(session != null && (uri.endsWith("login.html") || uri.endsWith("PatientLogin.html") 
                                || uri.endsWith("PatientDashboard.jsp") || uri.endsWith("AdminDashboard.jsp") 
                                ) && (userType == 0 || userType == 1)){
=======
                        //this.context.log("USER HERE HERE HERE HERE ---->" + userType + uri);
                        System.out.println("USER HERE HERE HERE HERE ---->" + userType + uri);
                        
                        // Redirected if they go to the pages in the loop based on userType
                        if(session != null && (uri.endsWith("login.html") || uri.endsWith("PatientLogin.html") 
                                || uri.endsWith("PatientDashboard.jsp") || uri.endsWith("AdminDashboard.jsp") 
                                || uri.endsWith("SignupApprovals.jsp") || uri.endsWith("ApprovalServlet") || uri.endsWith("AcceptRejectServlet")) && (userType == 0 || userType == 1)){
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
                            res.sendRedirect("StaffDashboard.jsp");
                            this.context.log("Redirected staff");
                        }
                        
                        if(session != null && (uri.endsWith("login.html") || uri.endsWith("PatientLogin.html") 
                                || uri.endsWith("StaffDashboard.jsp") || uri.endsWith("AdminDashboard.jsp") 
<<<<<<< HEAD
                                ) && userType == 2){
=======
                                || uri.endsWith("SignupApprovals.jsp") || uri.endsWith("ApprovalServlet") || uri.endsWith("AcceptRejectServlet")) && userType == 2){
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
                            res.sendRedirect("PatientDashboard.jsp");
                            this.context.log("Redirected patient");
                        }
                        
                        if(session != null && (uri.endsWith("login.html") || uri.endsWith("PatientLogin.html") 
<<<<<<< HEAD
                                || uri.endsWith("StaffDashboard.jsp") || uri.endsWith("PatientDashboard.jsp") 
=======
                                || uri.endsWith("StaffDashboard.jsp") || uri.endsWith("PatientDashboard.jsp")
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
                                ) && userType == 3){
                            res.sendRedirect("AdminDashboard.jsp");
                            this.context.log("Redirected admin");
                        }
                        
<<<<<<< HEAD
=======
                        // If user goes to page and is correct type
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
                        chain.doFilter(request, response);
                        this.context.log("No redirect");
                        
                    }catch(Exception e){
                        res.sendRedirect("HomePage.html");
                        this.context.log("Error for type filter. Session initialised incorrectly.");
                        this.context.log(e + "");
                    }
                    //chain.doFilter(request, response);
		}
		
		
	}

	

	public void destroy() {
		//close any resources here
	}

}
