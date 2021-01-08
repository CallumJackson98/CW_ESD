<%-- 
    Document   : CalculateTurnover
    Created on : 08-Jan-2021, 17:18:30
    Author     : callu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculate Turnover</title>
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        
        <script>
        $( function() {
          $( "#startdatepicker" ).datepicker({
              dateFormat: "dd-mm-yy",
              //minDate: 1,
              //maxDate: "+2w",
              onSelect: function() {
                var date = $(this).datepicker('getDate');
                $('#day_hidden').val($.datepicker.formatDate('DD', date));
              }
          });
        } );
        
        
        $( function() {
          $( "#enddatepicker" ).datepicker({
              dateFormat: "dd-mm-yy",
              //minDate: 1,
              //maxDate: "+2w",
              onSelect: function() {
                var date = $(this).datepicker('getDate');
                $('#day_hidden').val($.datepicker.formatDate('DD', date));
              }
          });
        } );
        </script
        </script>
    </head>
    
    <body>
        
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>Book Appointments</h1>
        
        <p>From this page you can calculate turnover within a given date range. 
            Please select a start date and an end date and click submit </p>
        
        <form action="CalculateTurnoverServlet" method="post">
            Start Date: <input type="text" id="startdatepicker" name="startDate">
            End Date: <input type="text" id="enddatepicker" name="endDate">
            <input type="submit" value="CalculateTurnover">
        </form>
        
        
        
    </body>
</html>
