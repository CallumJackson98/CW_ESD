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
        <h1>Patient dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" name = "rpButton" value="Request prescription" formaction="PatientServlet">
            <input type="submit" value="Logout" >
        </form>
    </body>
</html>
