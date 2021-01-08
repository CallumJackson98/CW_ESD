<%-- 
    Document   : ViewInvoices
    Created on : 07-Jan-2021, 15:00:39
    Author     : Jake
--%>

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
                <th><b>Invoices (IID, EID, CID, ConCost, OpCost, Paid)</b></th> 
                <th><b>Index</b></th> 
            </tr>
            <%
                int counter = 1;
                for(String s:allInvoices){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=counter%></td> 
                </tr> 
            <%counter++;}%> 
        </table>
        
    </body>
</html>
