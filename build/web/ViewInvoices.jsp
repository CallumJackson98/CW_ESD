<%-- 
    Document   : ViewInvoices
    Created on : 07-Jan-2021, 15:00:39
    Author     : Jake
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Invoices</title>
    </head>
    <body>
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>Invoices</h1>        
        <p>From this page you can view all of the invoices and calculate the 
            turnover for a defined period.</p>
        
        <!--    Get array list from servlet    -->
        <%
            
            ArrayList<String> allInvoices = (ArrayList<String>)request.getAttribute("allInvoices");
            
        %> 
        
        <!--    Create table of users and populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th colspan="7"><b>Invoices</b></th>
            </tr>
            <tr bgcolor="45a5bf">
                <th>IID</th>
                <th>EID</th>
                <th>CID</th>
                <th>ConCost</th>
                <th>OpCost</th>
                <th>Paid</th>
                <th>Index</th> 
            </tr>
            
            <%
                int counter = 1;
                ArrayList<String>items = new ArrayList<String>();
                for(String s:allInvoices){
                    s = s.replace("||", "");
                    items = new ArrayList<String>(Arrays.asList(s.split("  ")));
                    %>
                    <tr>
                        <td><%=items.get(0)%></td> 
                        <td><%=items.get(1)%></td>
                        <td><%=items.get(2)%></td>
                        <td><%=items.get(3)%></td>
                        <td><%=items.get(4)%></td>
                        <td><%=items.get(5)%></td>
                        <td><%=counter%></td> 
                    </tr>
                    <%counter++;}%>
        </table>
        
    </body>
</html>
