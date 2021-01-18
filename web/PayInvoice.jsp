<%-- 
    Document   : PayInvoice
    Created on : 12-Jan-2021, 11:55:45
    Author     : callu
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay invoice</title>
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
    </head>
    <body>
        
        <!--    Get array list from servlet    -->
        <%
            ArrayList<String> unpaidInvoices = (ArrayList<String>)request.getAttribute("unpaidInvoices"); 
            String userName = (String) session.getAttribute("user");
        %> 
        

        <div class="content">
            <header>
                <!--    Header of the page    -->
                <a href="PatientDashboard.jsp">Back to dashboard</a>
                <a href="#">Pay Invoices</a>
                <a href="#"><%=userName%></a>
            </header>
            
            <div class="info">
                <a href="info">List of invoices awaiting payment:
                Please tick the invoices that you want to pay and then confirm.</a>
            </div>
            <div class="flexbox1">
                <!--    Create table and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                    <tr bgcolor="45a5bf"> 
                        <th><b>Invoice</b></th> 
                        <th><b>Index</b></th> 
                    </tr>
                    <%
                        int counter = 1;
                        for(String s:unpaidInvoices){%> 
                        <tr> 
                            <td><%=s%></td> 
                            <td><%=counter%></td> 
                        </tr> 
                    <%counter++;}%> 
                </table>
            </div>
            <div class="flexbox1">
                <!--    Create dynamic table that has correct amount of checkboxes    -->
                <form action="PayInvoiceServlet" method="post">

                    <%for(int i = 0; i < unpaidInvoices.size(); i++){%>

                        Pay<%out.print(" " + (i+1));%><input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                        <br>

                    <%}%>

                    Accept <input type="radio" id="accept" name="arButton" value="Accept" checked>
                    Reject <input type="radio" id="reject" name="arButton" value="Reject">
                    <br>

                    <!--      Hidden element to pass references to rows      -->
                    <input type="hidden" id="checked_hidden" name="checked_hidden"  value="">

                    <input type="submit" value="Confirm">
                </form>
            </div>
            <div class="flexbox1">
                <!--    Items to display which boxes are ticked    -->
                <p>Users to be added/removed (indexes):<br></p>
                <p id="displayChecked">(None checked)</p>
                <!--    Function to check which boxes are ticked and update on page    -->
                <script type=text/javascript>
                    function getChecked() {

                        // Var to hold checked boxes
                        var checked = "";
                        var checkedNames = "";

                        <%for(int j = 0; j < unpaidInvoices.size(); j++){%>

                            // Get the checkbox
                            var checkBox = document.getElementById("<%=j%>");

                            // Create string list of elements
                            <%
                                String[] splitChecked = unpaidInvoices.get(j).split("||");

                                System.out.println(splitChecked[0]);

                            %>
                            // Check if checked
                            if (checkBox.checked == true){
                                // Add id to tracker variable
                                checked = checked + "<%=j%> ";
                                checkedNames = checkedNames + "<%=splitChecked[0]%> ";
                            }

                        <%}%>

                        if(checked === ""){
                            document.getElementById("displayChecked").innerHTML = "(None checked)";
                            document.getElementById("checked_hidden").value = "";
                        }else{
                            document.getElementById("displayChecked").innerHTML = checked;
                            document.getElementById("checked_hidden").value = checkedNames;
                        }

                      }
                </script>
            </div>
        </div>
    </body>
</html>
