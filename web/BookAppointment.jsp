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
            
            select {
                color: #fff !important;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
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
                <a href="PatientDashboard.jsp">Back to dashboard</a>
                <a href="#">Book Appointments</a>
                <a href="#"><%=userName%></a>
                
            </header>
            <div class="info">
                <a href="info">From this page you can book an appointment. Please select a date and a time. 
                    Doctor's appointments can be made from Monday to Friday. The Nurse is only
                    in from Tuesday to Thursday. If no slots are available, no appointment will be made.</a>
            </div>
            <div class="flexbox1">
                <form action="BookAppointmentServlet" method="post">
                    Date: <input type="text" id="datepicker" name="date" required>
                    <br>
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
                    <br>
                    <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
                    <input type="hidden" id="day_hidden" name="day_hidden"  value="">
                    <input type="submit" value="BookAppointment">
                </form>
                    
            </div>
            
        </div>
        
    </body>
</html>
