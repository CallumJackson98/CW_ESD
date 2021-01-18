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
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
<<<<<<< HEAD

=======
            
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
            html, body {
                margin: 0;
                border: 0;
            }

            body {
                background-color: #F5F5F5;
                height: 100vh;
            }

            * {
                box-sizing: border-box;
            }

            a {
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #edf0f1;
                text-decoration: none;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 30px 10%;
            }

            .content {
                max-width: 1180px;
                margin: auto;
                background-color: #2d3144;
                height: 100%;
            }

            input {
                color: #fff !important;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
<<<<<<< HEAD
                background: #6b944a;
                padding: 20px;
                border-radius: 5px;
                display: inline-block;
                border: none;
            }

            button {
                color: #fff !important;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
                background: #6b944a;
=======
                background: #ed3330;
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
                padding: 20px;
                border-radius: 5px;
                display: inline-block;
                border: none;
                transition: all 0.4s ease 0s;
            }

            button:hover {
                background: #434343;
                letter-spacing: 1px;
                -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.60);
                -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.60);
                box-shadow: 5px 40px -10px rgba(0,0,0,0.60);
                transition: all 0.4s ease 0s;
            }

            .flexbox1{
                display: flex;
                justify-content: center;
                padding: 30px 10%;
            }

<<<<<<< HEAD
            .buttonBlueStyle {
=======
            .buttonStyle1 {
                background: #6b944a
            }

            .buttonStyle2 {
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
                background: #23408e;
            }
        </style>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
<<<<<<< HEAD
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <a href="StaffDashboard.jsp"><%=userName%></a>
=======
        
        
            
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <!-- Display username -->
                <a href="StaffDashboard.jsp"><%=userName%></a>
                <a href="#">Contact</a>
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
            </header>
                
            <div class="flexbox1">
                <form action="LogoutServlet" method="post">
<<<<<<< HEAD
                    <button type="submit" name = "vbButton" value="View bookings" formaction="StaffServlet">View Bookings</button>
                    <button type="submit" name = "apButton" value="View requested prescriptions" formaction="StaffServlet">View Requested Prescriptions</button>
                    <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <button class="buttonBlueStyle" type="submit" value="Logout">Logout</button>
=======
                    <input class="buttonStyle1" type="submit" name = "vbButton" value="View bookings" formaction="StaffServlet">
                    <input class="buttonStyle1" type="submit" name = "apButton" value="View requested prescriptions" formaction="StaffServlet">
                    <input class="buttonStyle2" type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <input type="submit" value="Logout" >
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
                    
                </form>
            </div>
        </div>
    </body>
</html>
