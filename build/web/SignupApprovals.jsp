<%-- 
    Document   : SignupApprovals
    Created on : 11-Dec-2020, 17:09:27
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Approvals</title>
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
                <h1>Signup Approvals</h1>
            <!--    Header of the page    -->
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
            <div>
                <p>Below is a list of users awaiting approval:
                Please tick the users that you want to accept and then confirm. Any 
                un-ticked users will be deleted from our records.
                <br><br>
                To return to your dashboard simply click your username at the top of the screen.
                </p>
            </div>
            <!--    Get array list from servlet    -->
            <%
                ArrayList<String> appUsers = (ArrayList<String>)request.getAttribute("appUsers");   
            %> 
            <div>
                <!--    Create table and populate with data from array list    -->
                <table border ="1" width="500" align="center">
                    <tr bgcolor="45a5bf" class="tr2"> 
                        <th colspan="5"><b>Staff Member</b></th>
                    </tr>
                    <tr bgcolor="45a5bf" class="tr2">
                        <th>Name</th>
                        <th>Address</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Index</th> 
                    </tr>
                    <%
                        int counter = 1;
                        ArrayList<String>items = new ArrayList<String>();
                        for(String s:appUsers){
<<<<<<< HEAD
                            items = new ArrayList<String>(Arrays.asList(s.split("; ")));
=======
                            items = new ArrayList<String>(Arrays.asList(s.split(";")));
>>>>>>> CSS
                            %>
                            <tr>
                                <td><%=items.get(0)%></td>
                                <td><%=items.get(1)%></td>
                                <td><%=items.get(2)%></td>
                                <td><%=items.get(3)%></td>
                                <td><%=counter%></td> 

                            </tr>
                            <%counter++;}%>
                </table>
            </div>
            <!--    Create dynamic table that has correct amount of checkboxes    -->
            <div class="flexbox1">
                <form action="AcceptRejectServlet" method="post">
                    <%for(int i = 0; i < appUsers.size(); i++){%>
                        <div class="flexbox3">
                            <input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                            <label for="<%=i%>">Approve <%=i+1%></label>
                        </div>
                    <%}%>

                    <input type="radio" id="accept" name="arButton" value="Accept" checked>
                    <label for="accept">Accept</label>
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

                    <%for(int j = 0; j < appUsers.size(); j++){%>

                        // Get the checkbox
                        var checkBox = document.getElementById("<%=j%>");

                        // Create string list of elements
                        <%
                            String[] splitChecked = appUsers.get(j).split("; ");
                            System.out.println(splitChecked);
                        %>

                        // Check if checked
                        if (checkBox.checked == true){
                            // Add id to tracker variable
                            checked = checked + "<%=j%> ";
                            checkedNames = checkedNames + "<%=splitChecked[2]%> ";
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