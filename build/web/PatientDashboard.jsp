<%-- 
    Document   : PatientDashboard
    Created on : 20-Nov-2020, 16:09:35
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <a href="HomePage.html">Home page</a>
        <title>Patient Dashboard</title>
    </head>
    <body>
        <h1>Welcome to your dashboard.</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout" >
        </form>
    </body>
</html>
