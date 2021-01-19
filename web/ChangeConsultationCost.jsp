<%-- 
    Document   : ChangeConsultationCost
    Created on : 07-Jan-2021, 16:49:32
    Author     : Sam Colwill
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Consultation Cost</title>
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
            
            h1 { /*Title light grey text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #a3a1a0;
                text-decoration: underline;
            }

            h2 { /*White text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                color: #ffffff;
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
            
            input[type=checkbox]{
                width: 20px;
                height: 20px;
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
        </style>
    </head>
    <body>
        <%
            ArrayList<String> prices = (ArrayList<String>)request.getAttribute("prices");
            String userName = (String) session.getAttribute("user");
        %>
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <h1>Consultation Costs</h1>
            <!--    Header of the page    -->
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
        
            <div>
                <p>To make alterations to consultation costs please enter
                    the new values and click submit.</p>

                <p><%=prices.get(0)%></p>
            </div>
            <div class="flexbox1">
                <form action="ChangeConsultationCostServlet2" method="post" id="changeConForm">
                    <input type="text" name="doctorPrice" placeholder="Doctor Consultation Price">
                </form>
            </div>
            
            <div class="flexbox1">
                <input type="text" name="nursePrice" placeholder="Nurse Consultation Price" form="changeConForm">
            </div>
            <div class="flexbox1">
                <input type="text" name="operationPrice" placeholder="Operation Price" form="changeConForm">
            </div>
            <div class="flexbox1">
                <button type="submit" value="ChangeCost" form="changeConForm">Change Cost</button>
            </div>
    </body>
</html>
