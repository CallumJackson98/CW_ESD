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
                <th colspan="3"><b>Users</b></th>
            </tr>
            <tr bgcolor="45a5bf">
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
                <th colspan="5"><b>Private Patients</b></th>
            </tr>
            <tr bgcolor="45a5bf">
                <th>Name</th>
                <th>Address</th>
                <th>Client Type</th>
                <th>Username</th>
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
                        <td><%=privItems.get(0)%></td> 
                        <td><%=privItems.get(1)%></td>
                        <td><%=privItems.get(2)%></td>
                        <td><%=privItems.get(3)%></td>
                        <td><%=privCounter%></td> 
                    </tr>
                    <%privCounter++;}%>
        </table>
        
    </body>
</html>
