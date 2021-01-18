<%-- 
    Document   : RequestPrescription
    Created on : 15-Dec-2020, 11:36:09
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Prescription</title>
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
            
            .info {
                max-width: 900px;
                margin: auto;
                background-color: #2d3144;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 10px;
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
            
            input, select, select option{background-color:#363636 !important}
        </style>
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <div class="content">
            <header>
                <a href="PatientDashboard.jsp">Back to dashboard</a>
                <a href="#">Request Prescription</a>
                <a href="#"><%=userName%></a>
            </header>
            <div class="info">
                <a href="info">Please fill in the form below to request a prescription. A doctor or 
                    nurse will review it. All requested and active prescriptions can be 
                    seen from the view prescriptions page.</a>
            </div>
            <div class="flexbox1">
                <form action="RequestPrescriptionServlet" method="post">
                    Name of drug: <input type="text" name="drugName" required>
                    <br>
                    <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <input type="submit" value="RequestPrescription">
                </form>
            </div>
        </div>
        
        
        
        
        
        
        
    </body>
</html>
