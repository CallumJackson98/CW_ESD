<%-- 
    Document   : ViewBookings
    Created on : 05-Jan-2021, 13:58:26
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bookings</title>
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
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
                background: #f8f8ff;
                padding: 20px;
                border-radius: 5px;
                display: inline-block;
                border: none;
            }

            select {
                height: 40px;
                font-size: 16px
            }

            button {
                color: #fff !important;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
                background: #6b944a;
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

            p { 
                color: #f8f8f8;
                font-family: "Montserrat", sans-sarif; 
                font-size: 14px;
                font-weight: 500;
                line-height: 32px;
                padding: 0px 200px;
            }

            h1 { /*Title light grey text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #a3a1a0;
                text-decoration: underline;
            }

            label {
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                color: #f8f8f8;
            }

            input[type=radio] {
                border: 0px;
                width: 1.4em;
                height: 1.4em;
            }

            .flexbox1{
                display: flex;
                justify-content: center;
                padding: 30px 10%;
            }

            .buttonBlueStyle {
                background: #23408e;
            }

            .addressPrint {
                visibility: hidden;
            }
        </style>
    </head>
    <body>
        <!--    Get array list from servlet    -->
        <%
            ArrayList<String> allAppointments = (ArrayList<String>)request.getAttribute("allApps");
            String userName = (String) session.getAttribute("user");
        %>
        
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <h1>Book Appointment</h1>
                <a href="#"><%=userName%></a>
            </header>
            <div class="info">
                <a href="info">Here you can view all of your bookings and cancel them.</a>
            </div>
            <div>
                <!--    Create table of users and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                    <tr bgcolor="45a5bf"> 
                        <th><b>Appointments (App ID, sID, cID, Date, Time)</b></th> 
                        <th><b>Index</b></th> 
                    </tr>
                    <%
                        int counter = 1;
                        for(String s:allAppointments){%> 
                        <tr> 
                            <td><%=s%></td> 
                            <td><%=counter%></td> 
                        </tr> 
                    <%counter++;}%> 
                </table>
            </div>
            <div class="smallText">
                <a href="smallText">All appointments are listed here. Please type the ID of an appointment in the box 
                    to delete it.</a>
            </div>
             
            <div class="flexbox1">
                <form action="RequestPrescriptionServlet" method="post">
                    <!--    Display form for user deletion    -->
                    <form action="DeleteAppointmentServlet" method="post">
                        Appointment ID: <input type="text" id="appID" name="appID" required>
                        <input type="submit" value="Delete">
                    </form>
                </form>
            </div>
        </div>
    </body>
</html>
