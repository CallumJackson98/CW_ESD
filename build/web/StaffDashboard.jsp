<%-- 
    Document   : StaffDashboard
    Created on : 24-Nov-2020, 18:16:07
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <h1>Staff dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" name = "vbButton" value="View bookings" formaction="StaffServlet">
            <input type="submit" name = "apButton" value="View requested prescriptions" formaction="StaffServlet">
            <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
            <input type="submit" value="Logout" >
        </form>

    </body>
</html>
