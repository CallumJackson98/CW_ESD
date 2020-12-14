<%-- 
    Document   : StaffSignUp
    Created on : 11-Dec-2020, 16:36:26
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Sign Up Page</title>
    </head>
    <body>
        <%-- Invalidate session so access to other pages not allowed. --%>
        <%session.invalidate();%>
        <a href="HomePage.html">Home page</a>
        <h1>Sign up:</h1>
        <p>This is the sign up page. Please enter your details below. Once
        submitted, an administrator will approve or reject your application.</p>
        <br>
        
        <form action="SignUpServlet" method="post">
            First Name: <input type="text" name="fName" required>
            <br>
            Surname: <input type="text" name="sName" required>
            <br>
            Password: <input type="password" name="pwd" required>
            <br>
            Address: <input type= "address" name="address" required>
            <br>
            Doctor <input type="radio" id="doctor" name="staffRole" value="Doctor" checked>
            Nurse <input type="radio" id="nurse" name="staffRole" value="Nurse">
            <br>
            <input type="submit" value="StaffSignUp">
        </form>
    </body>
</html>
