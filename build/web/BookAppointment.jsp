<%-- 
    Document   : BookAppointment
    Created on : 04-Jan-2021, 12:11:08
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
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
            
            select {
                height: 40px;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
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
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        
        <script>
        $( function() {
          $( "#datepicker" ).datepicker({
              dateFormat: "dd-mm-yy",
              minDate: 1,
              maxDate: "+2w",
              onSelect: function() {
                var date = $(this).datepicker('getDate');
                $('#day_hidden').val($.datepicker.formatDate('DD', date));
              }
          });
        } );
        </script>
        
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
            ArrayList<String> allUsers = (ArrayList<String>)request.getAttribute("allStaff");
            
        %>
           
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <h1>Book Appointment</h1>
                <a href="PatientDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>
                    From this page you can book an appointment. Please select a date and a time. 
                    Doctor's appointments can be made from Monday to Friday. The Nurse is only
                    in from Tuesday to Thursday. If no slots are available, no appointment will be made.
                    <br><br>
                    To return to your dashboard simply click your username at the top of the screen.
                </p>
            </div>
            <div class="flexbox1">
                <form action="BookAppointmentServlet" method="post">
                    <input type="text" id="datepicker" name="date" required placeholder="Date">
                    <select name="hour">
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                        <option>15</option>
                        <option>16</option>
                        <option>17</option>
                    </select>
                    <select name="mins">
                        <option>00</option>
                        <option>15</option>
                        <option>30</option>
                        <option>45</option>
                    </select>
                    <select name="staff" id="staffSelect">
                        <%
                        for(String s:allUsers){%> 
                        <option><%=s%></option>
                        <%}%>
                    </select>
                    <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <input type="hidden" id="day_hidden" name="day_hidden"  value="">
                    <button type="submit" value="BookAppointment">Book Appointment</button>
                </form>
                    
            </div>
            
        </div>
        
    </body>
</html>
