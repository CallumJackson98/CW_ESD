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
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        
        <script>
        $( function() {
          $( "#datepicker" ).datepicker({
              dateFormat: "dd-mm-yy",
              minDate: 1,
              onSelect: function() {
                var date = $(this).datepicker('getDate');
                $('#day_hidden').val($.datepicker.formatDate('DD', date));
              }
          });
        } );
        </script>
        
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
        
        <br>
        
        <!--    Form to forward to hospital and for prescription    -->
        <form action="ConsultationServlet" method="post">
            Appointment ID: <input type="text" name="appID" required>
            <br>
            <label>Requires surgery?</label>
            Yes <input type="radio" id="surYes" name="surgery" value="surYes" onclick="surCheck();">
            No <input type="radio" id="surNo" name="surgery" value="surNo" checked onclick="surCheck();">
            <br>
            <label id="surLab" style="display: none;">Date: </label>
            <input type="hidden" id="datepicker" name="date">
            <select name="hour" id="hourPick" style="display: none;">
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
            <select name="mins" id="minPick" style="display: none;">
                <option>00</option>
                <option>15</option>
                <option>30</option>
                <option>45</option>
            </select>
            <br>
            <label id="slotLab" style="display: none;">Number of slots (15 mins each): </label>
            <input type="hidden" name="slotNum" required id="slotPick">
            <br>
            Prescription (leave blank if none): <input type="text" name="prescription">
            <br>
            <input type="submit" value="Process" >
        </form>
        
        <script type=text/javascript>
            function surCheck(){
                if(document.getElementById("surYes").checked){
                    //document.getElementById("datepicker").style.visibility = 'visible';
                    //document.getElementById("surLab").style.visibility = 'visible';
                    document.getElementById("datepicker").type = 'text';
                    document.getElementById("slotPick").type = 'text';
                    document.getElementById("surLab").style.display = 'inline';
                    document.getElementById("slotLab").style.display = 'inline';
                    document.getElementById("hourPick").style.display = 'inline';
                    document.getElementById("minPick").style.display = 'inline';
                }else{
                    //document.getElementById("datepicker").style.visibility = 'hidden';
                    //document.getElementById("surLab").style.visibility = 'hidden';
                    document.getElementById("datepicker").type = 'hidden';
                    document.getElementById("slotPick").type = 'hidden';
                    document.getElementById("surLab").style.display = 'none';
                    document.getElementById("slotLab").style.display = 'none';
                    document.getElementById("hourPick").style.display = 'none';
                    document.getElementById("minPick").style.display = 'none';
                }
            }
        </script>
        
    </body>
</html>
