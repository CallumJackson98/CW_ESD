<%-- 
    Document   : StaffViewBookings
    Created on : 05-Jan-2021, 15:37:22
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bookings</title>
    </head>
    <body>
        <a href="PatientDashboard.jsp">Back to dashboard</a>
        <h1>Your bookings</h1>
        
        <p>Here you can view all of your bookings and complete the appointment form.</p>
        
        <!--    Get array list from servlet    -->
        <%
            
            ArrayList<String> allAppointments = (ArrayList<String>)request.getAttribute("allApps");

        %> 
        
        <!--    Create table of users and populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th><b>Appointments (App ID, sID, cID, Date, Time)</b></th> 
                <th><b>Index</b></th> 
            </tr>
            <%
                int counter = 1;
                for(String s:allAppointments){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=counter%></td> 
                </tr> 
            <%counter++;}%> 
        </table>
        
    </body>
</html>
