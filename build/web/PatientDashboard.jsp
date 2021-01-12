<%-- 
    Document   : PatientDashboard
    Created on : 24-Nov-2020, 18:15:17
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Dashboard</title>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <h1>Patient dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" name = "rpButton" value="Request prescription" formaction="PatientServlet">
            <input type="submit" name = "baButton" value="Book appointment" formaction="PatientServlet">
            <input type="submit" name = "vbButton" value="View bookings" formaction="PatientServlet">
            <input type="submit" name = "piButton" value="Pay invoice" formaction="PatientServlet">
            <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
            <input type="submit" value="Logout" >
        </form>
            
    </body>
</html>
