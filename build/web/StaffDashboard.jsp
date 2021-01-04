<%-- 
    Document   : StaffDashboard
    Created on : 24-Nov-2020, 18:16:07
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>
        <h1>Staff dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" name = "apButton" value="View requested prescriptions" formaction="StaffServlet">
            <input type="submit" value="Logout" >
        </form>

        <%
            //allow access only if session exists
            String user = (String) session.getAttribute("user");
            int type = (Integer) session.getAttribute("type");
            
        %>
        <h3>Hi <%=user%>, staff login successful. Your type is <%=type%>.</h3>
        <br>

    </body>
</html>
