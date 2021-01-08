<%-- 
    Document   : BookAppointment
    Created on : 04-Jan-2021, 12:11:08
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
       
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
        %>
        
        <a href="PatientDashboard.jsp">Back to dashboard</a>
        <h1>Book Appointments</h1>
        
        <p>From this page you can book an appointment. Please select a date and a time. 
            Doctor's appointments can be made from Monday to Friday. The Nurse is only
        in from Tuesday to Thursday. If no slots are available, no appointment will be made.</p>
        
        <form action="BookAppointmentServlet" method="post">
            Date: <input type="text" id="datepicker" name="date">
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
            <select name="staff">
                <option>Doctor</option>
                <option>Nurse</option>
            </select>
            <br>
            <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
            <input type="hidden" id="day_hidden" name="day_hidden"  value="">
            <input type="submit" value="BookAppointment">
        </form>
        
    </body>
</html>
