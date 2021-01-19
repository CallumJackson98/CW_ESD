<%-- 
    Document   : ViewAllUsers
    Created on : 14-Dec-2020, 15:42:39
    Author     : Jake
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all users</title>
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
                <h1>View All Users</h1>
                <!--    Header of the page    -->
                <a href="AdminDashboard.jsp"><%=userName%></a>
            </header>
        <div class="flexbox3">
            <p>All users are listed here. Please type the name of a user in the box 
            to delete them.
            <br><br>
            To return to your dashboard simply click your username at the top of the screen.
            </p>
            
        </div>
        <div class="flexbox1">
            <!--    Display form for user deletion    -->
            <form action="DeleteUserServlet" method="post">
                <input type="text" id="uName" name="uName" placeholder="Username" required>
                <button type="submit" value="Delete">Delete</button>
            </form>
        </div>
        
        <!--    Get array list from servlet    -->
        <%
            ArrayList<String> allUsers = (ArrayList<String>)request.getAttribute("allUsers");
            ArrayList<String> allNhs = (ArrayList<String>)request.getAttribute("allNhs");
            ArrayList<String> allPrivate = (ArrayList<String>)request.getAttribute("allPrivate");  
        %> 
        <div>
            <!--    Create table of users and populate with data from array list    -->
            <table border ="1" width="500" align="center">
                <tr bgcolor="45a5bf" class="tr2"> 
                    <th colspan="3"><b>Users</b></th>
                </tr>
                <tr bgcolor="45a5bf" class="tr2">
                    <th>Username</th>
                    <th>User type</th>
                    <th>Index</th> 
                </tr>
                <%
                    int counter = 1;
                    ArrayList<String>items = new ArrayList<String>();
                    for(String s:allUsers){
                        s = s.replace("||", "");

                        items = new ArrayList<String>(Arrays.asList(s.split("  ")));
                        %>
                        <tr>
                            <td><%=items.get(0)%></td> 
                            <td><%=items.get(1)%></td>
                            <td><%=counter%></td> 
                        </tr>
                        <%counter++;}%>
            </table>
        </div>
        
        <div class="flexbox3">
            <p>Below are two tables. The first listing the NHS patients and the 
            second listing the private patients. </p>
        </div>
        
        <!--    Create table of NHS patients populate with data from array list    -->
        <div class="flexbox1">
            <table border ="1" width="500" align="center">
                <tr bgcolor="45a5bf"> 
                    <th colspan="5"><b>NHS Patients</b></th>
                </tr>
                <tr bgcolor="45a5bf">
                    <th>Username</th>
                    <th>Address</th>
                    <th>Client Type</th>
                    <th>Name</th>
                    <th>Index</th> 
                </tr>
                <%
                    int nhsCounter = 1;
                    ArrayList<String>nhsItems = new ArrayList<String>();
                    for(String n:allNhs){

                        n = n.replace("||", "");

                        nhsItems = new ArrayList<String>(Arrays.asList(n.split("  ")));
                        System.out.println(nhsItems);
                        %>
                        <tr>
                            <td><%=nhsItems.get(3)%></td>
                            <td><%=nhsItems.get(1)%></td>
                            <td><%=nhsItems.get(2)%></td>
                            <td><%=nhsItems.get(0)%></td> 
                            <td><%=nhsCounter%></td> 
                        </tr>
                        <%nhsCounter++;}%>
            </table>
        </div>
        
        <div>
            <!--    Create table of Private patients populate with data from array list    -->
            <table border ="1" width="500" align="center">
                <tr bgcolor="45a5bf"> 
                    <th colspan="5"><b>Private Patients</b></th>
                </tr>
                <tr bgcolor="45a5bf">
                    <th>Username</th>
                    <th>Address</th>
                    <th>Client Type</th>
                    <th>Name</th>
                    <th>Index</th> 
                </tr>
                <%
                    int privCounter = 1;
                    ArrayList<String>privItems = new ArrayList<String>();
                    for(String p:allPrivate){

                        p = p.replace("||", "");

                        privItems = new ArrayList<String>(Arrays.asList(p.split("  ")));
                        System.out.println(privItems);
                        %>
                        <tr>
                            <td><%=privItems.get(3)%></td>
                            <td><%=privItems.get(1)%></td>
                            <td><%=privItems.get(2)%></td>
                            <td><%=privItems.get(0)%></td> 
                            <td><%=privCounter%></td> 
                        </tr>
                        <%privCounter++;}%>
            </table>
        </div>
        
    </body>
</html>
