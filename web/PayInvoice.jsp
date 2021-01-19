<%-- 
    Document   : PayInvoice
    Created on : 12-Jan-2021, 11:55:45
    Author     : callu
--%>

<%@page import="java.util.Arrays"%>
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
            
            h1 { /*Title light grey text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #a3a1a0;
                text-decoration: underline;
            }

            h2 { /*White text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                color: #ffffff;
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
            
            input[type=checkbox]{
                width: 20px;
                height: 20px;
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

            .buttonBlueStyle {
                background: #23408e;
            }

            .makeHidden {
                visibility: hidden;
            }
        </style>
    </head>
    <body>
        <%
            String userName = (String) session.getAttribute("user");
        %>
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <h1>Pay Invoice</h1>
                <a href="PatientDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>
                    Listed below are all of your invoices that are awaiting payment.<br>
                    Please tick the invoices that you want to pay and then confirm.
                    <br><br>
                    To return to your dashboard simply click your username at the top of the screen.
                </p>
            </div>
            <!--    Get array list from servlet    -->
            <%
                ArrayList<String> unpaidInvoices = (ArrayList<String>)request.getAttribute("unpaidInvoices"); 
            %>
            <div>
                <!--    Create table and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                <tr bgcolor="45a5bf"> 
                    <th colspan="8"><b>Invoice</b></th>
                </tr>
                <tr bgcolor="45a5bf">
                    <th>IID</th>
                    <th>EID</th>
                    <th>CID</th>
                    <th>Consultation cost</th>
                    <th>Operation cost</th>
                    <th>Index</th> 
                </tr>
                    <%
                        int counter = 1;
                        ArrayList<String>items = new ArrayList<String>();
                        for(String s:unpaidInvoices){
                            s = s.replace("||", "");
                            items = new ArrayList<String>(Arrays.asList(s.split("  ")));
                            System.out.println(items);
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
            <div class="flexbox1">
                <!--    Create dynamic table that has correct amount of checkboxes    -->
                <form action="PayInvoiceServlet" method="post">
                    <%for(int i = 0; i < unpaidInvoices.size(); i++){%>
                        <div class="flexbox1">
                            <input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                            <label for="<%=i%>">Pay <%=i+1%></label>
                        </div>
                    <%}%>
                    <input type="radio" id="accept" name="arButton" value="Accept" checked>
                    <label for="acccept">Accept</label>
                    <input type="radio" id="reject" name="arButton" value="Reject">
                    <label for="reject">Reject</label>

                    <!--      Hidden element to pass references to rows      -->
                    <input type="hidden" id="checked_hidden" name="checked_hidden"  value="">

                    <button type="submit" value="Confirm">Confirm</button>
                </form>
            </div>
            <div class="makeHidden">
                <!--    Items to display which boxes are ticked    -->
                <p>Users to be added/removed (indexes):<br></p>
                <p id="displayChecked">(None checked)</p>
            </div>

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
    </body>
</html>
