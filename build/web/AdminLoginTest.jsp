<%-- 
    Document   : AdminLoginTest
    Created on : 25-Nov-2020, 12:56:02
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEST PAGE</title>
        <meta http-equiv="cache-control" content="no-cache, must-revalidate, post-check=0, pre-check=0" />
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
    </head>
    <body>
        <a href="HomePage.html">Home page</a>
        <br><p>Admin login</p>
        <form action="LoginServlet" method="post">
            Username: <input type="text" name="user">
            <br>
            Password: <input type="password" name="pwd">
            <br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
