<%-- 
    Document   : AdminDashboard
    Created on : 24-Nov-2020, 18:14:27
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

            html, body {
                margin: 0;
                border: 0;
            }

            body {
                background-color: #818287;
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
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
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

            .flexbox2{
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 30px 10%;
            }

            .flexbox3{
                display: flex;
                justify-content: center;
                padding: 8px 10%
            }

            .buttonBlueStyle {
                background: #23408e;
            }

            .makeHidden {
                visibility: hidden;
            }


            tr{
                color:white;
            }

            .tr2
            {
              color:#131313;
            }
        </style>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <div class="content">
            <header>
                <a>SmartCare Surgery</a>
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
            <div class="flexbox1">
                <form action="LogoutServlet" method="post">
                    <button type="submit" name = "srButton" value="View Signup Requests" formaction="ApprovalServlet">View Signup Requests</button>
                    <button type="submit" name = "vaButton" value="View all users (and delete)" formaction="ApprovalServlet">View all users (and delete)</button>
                    <button type="submit" name = "viButton" value="View all invoices (and turnover)" formaction="ApprovalServlet">View all invoices (and turnover)</button>
                </form>
            </div>
            <div class="flexbox1">
                <form action="LogoutServlet" method="post">
                    <button type="submit" name = "avbButton" value="Admin View Bookings" formaction="ApprovalServlet">Admin View Bookings</button>
                    <button type="submit" name = "cccButton" value="Change Consultation Cost" formaction="ApprovalServlet">Change Consultation Cost</button>
                    <button type="submit" name = "ctButton" value="Calculate Turnover" formaction="ApprovalServlet">Calculate Turnover</button>
                    <button class="buttonBlueStyle" type="submit" value="Logout">Logout</button>
                </form>
            </div>
        </div>
    </body>
</html>
