<%-- 
    Document   : StaffDashboard
<<<<<<< HEAD
    Created on : 24-Nov-2020, 18:16:07
    Author     : Jake
=======
    Created on : 10-Dec-2020, 08:15:43
    Author     : Sam
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
=======
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
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>
<<<<<<< HEAD
        <h1>Staff dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout" >
        </form>

=======
        <h1>Staff Dashboard</h1>
        
        <!--The logout form that accesses Logout Servlet implemented as a button.-->
        <form action="LogoutServlet" method="post" id="logoutform"></form>
        
        <!--Doctor Dashboard Navigation Bar-->
        <button type="button" onclick="">Patient Time Tables</button> 
        <button type="button" onclick="">Consultation</button> 
        <button type="button" onclick="">Issue Prescription</button>
        <button type="button" onclick="">View Requested Prescriptions</button>
        <button type="submit" class="navbutton" form="logoutform" value="Submit">Logout</button>
        
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
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
<<<<<<< HEAD
        <h3>Hi <%=userName%>, staff login successful. Your Session ID=<%=sessionID%></h3>
        <h3>USER: <%=type%></h3>
        <br>
=======
        <h3>Hi <%=userName%>, login successful. </h3>
        <h3>You are logged in as a <%=type%>. (TO IMPLEMENT: Convert type number to type name.)</h3>
        <h3>Your session ID is <%=sessionID%>.</h3>
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58

    </body>
</html>
