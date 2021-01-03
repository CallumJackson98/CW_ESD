<%-- 
    Document   : PatientDashboard
    Created on : 10-Dec-2020, 09:02:13
    Author     : Sam
--%>


<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="servlets.appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlets.AppointmentServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <style>
        body {
            background: linear-gradient(to top left, #99ccff 0%, #666699 100%);
            background-repeat: no-repeat; 
            background-size: contain;
            height: 920px;
            width: 100%;
            margin: 10px;
            text-align: left;
        }
        h1{
            text-align: left;
            padding: 0px 25px;
            font-size: 40px;  
        }
        button{
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;  
        }
        .navbutton{
            background-color: #000080; /* Navy */
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Appointment</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script>
            
            document.open();
            $(function getAppointments(){

                ArrayList<appointment> dateList = new ArrayList<appointment>();
                dateList = (ArrayList<appointment>)request.getAttribute("AppointmentList");
                document.write("aaaa");
                for (let a = 0; a < 3 ; a++) {
                    //document.write("Integer.toString(1)");
                    document.write(dateList.get(0).getAppointment_Value());
                    
                }
            });
            
            $(function showDatePicker(){
                $( "#datepicker-13" ).datepicker();
                $( "#datepicker-13" ).datepicker("show");
                
            });
            
            
            var text = 'aaaaaaa';
            
            document.write(text);
            document.close();
        </script>
    </head>
    
    
    
    
    <body onload = "getAppointments(); ">
        <h1>Book Appointment</h1>
        
        
        
        
      
        
        
        
        
    </body>
</html>
