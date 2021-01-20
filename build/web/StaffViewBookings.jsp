<%-- 
    Document   : StaffViewBookings
    Created on : 05-Jan-2021, 15:37:22
    Author     : Jake
--%>

<%@page import="java.util.Arrays"%>
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
                <h1>Your Bookings</h1>
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>
                    Here you can view all of your bookings and complete the appointment form.
                    Note: A slot consists of 15 minutes surgery time.
                    <br><br>
                    To return to your dashboard simply click your username at the top of the screen.
                </p>
            </div>

            <!--    Get array list from servlet    -->
            <%

                ArrayList<String> allAppointments = (ArrayList<String>)request.getAttribute("allApps");

            %>
            <div>
                <!--    Create table of users and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                    <tr bgcolor="45a5bf" class="tr2"> 
                        <th colspan="6"><b>Appointments</b></th>
                    </tr>
                    <tr bgcolor="45a5bf" class="tr2">
                        <th>App ID</th>
                        <th>sID</th>
                        <th>cID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Index</th> 
                    </tr> 
                    <%
                        int counter = 1;
                        ArrayList<String>items = new ArrayList<String>();
                        for(String s:allAppointments){
                            s = s.replace("||", "");
                            items = new ArrayList<String>(Arrays.asList(s.split("  ")));
                            %>
                            <tr>
                                <td><%=items.get(0)%></td> 
                                <td><%=items.get(1)%></td>
                                <td><%=items.get(2)%></td>
                                <td><%=items.get(3)%></td>
                                <td><%=items.get(4)%></td>
                                <td><%=counter%></td> 
                            </tr>
                            <%counter++;}%>
                </table>
            </div>

            <!--    Form to forward to hospital and for prescription    -->
            <div class="flexbox1">
                <form action="ConsultationServlet" method="post" id="consultform">
                    <input type="text" name="appID" required placeholder="Appointment ID">
                </form>
            </div>
            <div class="flexbox1">
                <label>Requires surgery?</label>
                <input type="radio" id="surYes" name="surgery" value="surYes" onclick="surCheck();" form="consultform">
                <label for="surYes">Yes</label><br>
                <input type="radio" id="surNo" name="surgery" value="surNo" checked onclick="surCheck();" form="consultform">
                <label for="surNo">No</label><br>
            </div>
            <div class="flexbox1" id="surgeryDisplay">
                <label id="surLab" style="display: none;">Date: </label>
                <input type="hidden" id="datepicker" name="date" form="consultform" placeholder="Date">
                <select name="hour" id="hourPick" style="display: none;" form="consultform">
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
                <select name="mins" id="minPick" style="display: none;" form="consultform">
                    <option>00</option>
                    <option>15</option>
                    <option>30</option>
                    <option>45</option>
                </select>
            </div>
            <div class="flexbox1">
                <label id="slotLab" style="display: none;">Number of slots (15 mins each): </label>
                <input type="hidden" name="slotNum" required id="slotPick" form="consultform" placeholder="Number of Slots">
            </div>
            <div class="flexbox1">
                <input type="text" name="prescription" placeholder="Prescription" form="consultform">
                <button type="submit" value="Process" form="consultform">Process</button>
            </div> 
            <script type=text/javascript>
                function surCheck(){
                    if(document.getElementById("surYes").checked){
                        document.getElementById("datepicker").type = 'text';
                        document.getElementById("slotPick").type = 'text';
                        document.getElementById("surLab").type = 'text';
                        document.getElementById("hourPick").style.display = 'inline';
                        document.getElementById("minPick").style.display = 'inline';
                    }else{
                        document.getElementById("datepicker").type = 'hidden';
                        document.getElementById("slotPick").type = 'hidden';
                        document.getElementById("hourPick").style.display = 'none';
                        document.getElementById("minPick").style.display = 'none';
                    }
                }
            </script>
        </div>
    </body>
</html>
