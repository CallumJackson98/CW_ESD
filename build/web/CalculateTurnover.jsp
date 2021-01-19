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
        </script>
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
                <h1>Calculate Turnover</h1>
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
            
            <div>
                <p>From this page you can calculate turnover within a given date range. 
                    Please select a start date and an end date and click submit.
                    <br><br>
                    To return to your dashboard simply click your username at the top of the screen.
                </p>
            </div>
            <div class="flexbox1">
                <form action="CalculateTurnoverServlet" method="post">
                    <input type="text" id="startdatepicker" name="startDate" placeholder="Start Date">
                    <input type="text" id="enddatepicker" name="endDate" placeholder="End Date">
                    <button type="submit" value="CalculateTurnover">Calculate Turnover</button>
                </form>
            

                <%
                    String totalTurnover = (String) "";
                %>

                <%
                    totalTurnover = (String) request.getAttribute("totalTurnover");
                %>

                
            </div>
            <div class="flexbox1">
                <input name="totalTurnover" value="£<%=totalTurnover%>"></input>
            </div>
        </div>

    </body>
</html>
