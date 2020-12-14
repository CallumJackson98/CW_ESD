<%-- 
    Document   : SignUp
    Created on : 07-Dec-2020, 11:33:24
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient sign up page</title>
    </head>
    <body>
        <%-- Invalidate session so access to other pages not allowed. --%>
        <%session.invalidate();%>
        <a href="HomePage.html">Home page</a>
        <h1>Sign up:</h1>
        <p>This is the sign up page. Please enter your details below. Once
        submitted, an administrator will approve or reject your application.</p>
        <br>
        
<<<<<<< HEAD
=======
        <form action="SignUpServlet" method="post">
            First Name: <input type="text" name="fName" required>
            <br>
            Surname: <input type="text" name="sName" required>
            <br>
            Password: <input type="password" name="pwd" required>
            <br>
            Address: <input type= "address" name="address" required>
            <br>
            NHS <input type="radio" id="NHS" name="serviceType" value="NHS" checked>
            Private <input type="radio" id="private" name="serviceType" value="Private">
            <br>
            <input type="submit" value="SignUp">
        </form>
>>>>>>> 74fad0fb031eb0afcae285bebb0352d728bb8d58
    </body>
</html>
