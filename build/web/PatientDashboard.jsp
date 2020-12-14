<%-- 
    Document   : PatientDashboard
    Created on : 10-Dec-2020, 09:02:13
    Author     : Sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body {
            background: linear-gradient(to top left, #99ccff 0%, #666699 100%);
            background-repeat: no-repeat; 
            background-size: contain;
            height: 920px;
            width: 100%;
            margin: 10px;
            text-align: left;
        }
        h1{
            text-align: left;
            padding: 0px 25px;
            font-size: 40px;  
        }
        button{
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;  
        }
        .navbutton{
            background-color: #000080; /* Navy */
        }

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Dashboard</title>
    </head>
    <body>
        <h1>Patient Dashboard</h1>
        
        <!--The logout form that accesses Logout Servlet implemented as a button.-->
        <form action="LogoutServlet" method="post" id="logoutform"></form>
        
        <!--Patient Dashboard Navigation Bar-->
        <button type="button" onclick="">Book Appointment</button> 
        <button type="button" onclick="">Request Prescription</button>
        <button type="button" onclick="">View Invoices</button>
        <button type="submit" class="navbutton" form="logoutform" value="Submit">Logout</button>
        
        <%
            //allow access only if session exists
            String user = (String) session.getAttribute("user");
            int type = (Integer) session.getAttribute("type");
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }
        %>
        <h3>Hi <%=userName%>, login successful. </h3>
        <h3>You are logged in as a <%=type%>. (TO IMPLEMENT: Convert type number to type name.)</h3>
        <h3>Your session ID is <%=sessionID%>.</h3>

    </body>
</html>
