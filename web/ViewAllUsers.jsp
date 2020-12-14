<%-- 
    Document   : ViewAllUsers
    Created on : 14-Dec-2020, 15:42:39
    Author     : Jake
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all users</title>
    </head>
    <body>
        <!--    Header of the page    -->
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>List of all users:</h1>
        <p>All users are listed here. Please type the name of a user in the box 
            to delete them.</p>
        
        <!--    Display form for user deletion    -->
        <form action="DeleteUserServlet" method="post">
            Username: <input type="text" id="uName" name="uName" required>
            <input type="submit" value="Delete">
        </form>
        <br>
        
        <!--    Get array list from servlet    -->
        <%
            
            ArrayList<String> allUsers = (ArrayList<String>)request.getAttribute("allUsers");
            ArrayList<String> allNhs = (ArrayList<String>)request.getAttribute("allNhs");
            ArrayList<String> allPrivate = (ArrayList<String>)request.getAttribute("allPrivate");
            
        %> 
        
        <!--    Create table of users and populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th><b>Users (Username, User type)</b></th> 
                <th><b>Index</b></th> 
            </tr>
            <%
                int counter = 1;
                for(String s:allUsers){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=counter%></td> 
                </tr> 
            <%counter++;}%> 
        </table>
        
        <br>
        <p>Below are two tables. The first listing the NHS patients and the 
            second listing the private patients. </p>
        <br>
        
        <!--    Create table of NHS patients populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th><b>NHS Patients (Name, Address, Client Type, Username)</b></th> 
                <th><b>Index</b></th> 
            </tr>
            <%
                int nhsCounter = 1;
                for(String s:allNhs){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=nhsCounter%></td> 
                </tr> 
            <%nhsCounter++;}%> 
        </table>
        
        <br>
        
        <!--    Create table of Private patients populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th><b>Private Patients (Name, Address, Client Type, Username)</b></th> 
                <th><b>Index</b></th> 
            </tr>
            <%
                int privCounter = 1;
                for(String s:allPrivate){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=privCounter%></td> 
                </tr> 
            <%privCounter++;}%> 
        </table>
        
    </body>
</html>
