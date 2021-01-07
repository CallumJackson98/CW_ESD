<%-- 
    Document   : AdminDashboard
    Created on : 24-Nov-2020, 18:14:27
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>Admin Dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" name = "srButton" value="View Signup Requests" formaction="ApprovalServlet">
            <input type="submit" name = "vaButton" value="View all users (and delete)" formaction="ApprovalServlet">
            <input type="submit" name = "viButton" value="View all invoices (and turnover)" formaction="ApprovalServlet">
            <input type="submit" value="Logout" >
        </form>
    </body>
</html>
