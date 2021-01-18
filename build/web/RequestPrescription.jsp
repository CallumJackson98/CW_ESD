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
<<<<<<< HEAD

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
=======
            
            .info {
                max-width: 900px;
                margin: auto;
                background-color: #2d3144;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 10px;
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
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
                font-size: 18px;
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
<<<<<<< HEAD

            .addressPrint {
                visibility: hidden;
            }
=======
            
            input, select, select option{background-color:#363636 !important}
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
        </style>
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <div class="content">
            <header>
<<<<<<< HEAD
                <a href="HomePage.html">SmartCare Surgery</a>
                <h1>Request Prescription</h1>
                <a href="PatientDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>
                    To request a prescription enter a description of your prescription below, 
                    A doctor or nurse will then review your request.<br>
                    All requested and active prescriptions can be seen from the view prescriptions page.
                    <br><br>
                    To return to your dashboard simply click your username at the top of the screen.
                </p>
=======
                <a href="PatientDashboard.jsp">Back to dashboard</a>
                <a href="#">Request Prescription</a>
                <a href="#"><%=userName%></a>
            </header>
            <div class="info">
                <a href="info">Please fill in the form below to request a prescription. A doctor or 
                    nurse will review it. All requested and active prescriptions can be 
                    seen from the view prescriptions page.</a>
>>>>>>> cd88e91c7e23857082eca7e74a710f05a1373949
            </div>
            <div class="flexbox1">
                <form action="RequestPrescriptionServlet" method="post">
                    <input type="text" name="drugName" required placeholder="Description">
                    <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <button type="submit" value="RequestPrescription">Request Prescription</button>
                </form>
            </div>
        </div>
    </body>
</html>
