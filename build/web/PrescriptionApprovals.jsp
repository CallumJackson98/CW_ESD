<%-- 
    Document   : PrescriptionApprovals
    Created on : 15-Dec-2020, 12:46:52
    Author     : Jake
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prescription Approvals</title>
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
                <h1>Prescription Approvals</h1>
                <a href="StaffDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>From this page you can accept or reject prescription approvals.</p>
            </div>


            <!--    Get array list from servlet    -->
            <%
                ArrayList<String> requestedPrescriptions = (ArrayList<String>)request.getAttribute("reqPrescriptions");
            %> 
            <div>
                <!--    Create table and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                    <tr bgcolor="45a5bf" class="tr2"> 
                        <th colspan="4"><b>Prescription</b></th>
                    </tr>
                    <tr bgcolor="45a5bf" class="tr2">
                        <th>ID</th>
                        <th>Username</th>
                        <th>drug</th>
                        <th>Index</th> 
                    </tr>
                    <%
                        int counter = 1;
                        ArrayList<String>items = new ArrayList<String>();
                        for(String s:requestedPrescriptions){
                            s = s.replace("||", "");
                            items = new ArrayList<String>(Arrays.asList(s.split(", ")));
                            %>
                            <tr>
                                <td><%=items.get(0)%></td>
                                <td><%=items.get(1)%></td>
                                <td><%=items.get(2)%></td>
                                <td><%=counter%></td> 
                            </tr>
                            <%counter++;}%>
                </table>
            </div>
            <div class="flexbox1">
                <!--    Create dynamic table that has correct amount of checkboxes    -->
                <form action="arPrescriptionServlet" method="post">
                    <%for(int i = 0; i < requestedPrescriptions.size(); i++){%>
                        <div class="flexbox3">
                            <input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                            <label for="<%=i%>">Approve <%=i+1%></label>
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
                    var checkedIDs = "";

                    <%for(int j = 0; j < requestedPrescriptions.size(); j++){%>

                        // Get the checkbox
                        var checkBox = document.getElementById("<%=j%>");

                        // Create string list of elements
                        <%
                            String[] splitChecked = requestedPrescriptions.get(j).split(", ");

                        %>

                        // Check if checked
                        if (checkBox.checked == true){
                            // Add id to tracker variable
                            checked = checked + "<%=j%> ";
                            checkedIDs = checkedIDs + "<%=splitChecked[0]%> ";
                        }

                    <%}%>

                    if(checked === ""){
                        document.getElementById("displayChecked").innerHTML = "(None checked)";
                        document.getElementById("checked_hidden").value = "";
                    }else{
                        document.getElementById("displayChecked").innerHTML = checkedIDs;
                        document.getElementById("checked_hidden").value = checkedIDs;
                    }

                  }
            </script>
        </div>
    </body>
</html>
