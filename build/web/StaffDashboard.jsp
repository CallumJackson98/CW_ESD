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
                background: #ed3330;
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

            .buttonStyle1 {
                background: #6b944a
            }

            .buttonStyle2 {
                background: #23408e;
            }
        </style>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        
        
            
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <!-- Display username -->
                <a href="StaffDashboard.jsp"><%=userName%></a>
                <a href="#">Contact</a>
            </header>
                
            <div class="flexbox1">
                <form action="LogoutServlet" method="post">
                    <input class="buttonStyle1" type="submit" name = "vbButton" value="View bookings" formaction="StaffServlet">
                    <input class="buttonStyle1" type="submit" name = "apButton" value="View requested prescriptions" formaction="StaffServlet">
                    <input class="buttonStyle2" type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <input type="submit" value="Logout" >
                    
                </form>
            </div>
        </div>
    </body>
</html>
