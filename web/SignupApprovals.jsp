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
    </head>
    
    <body>
                  
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>List of users awaiting approval:</h1>
        <p>Please tick the users that you want to accept and then confirm. Any 
            un-ticked users will be deleted from our records.</p>
       
        <%
            
            ArrayList<String> appUsers = (ArrayList<String>)request.getAttribute("appUsers"); 
            
        %> 
        
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th><b>Staff Member</b></th> 
                <th><b>Approve</b></th> 
            </tr>
            <%
                int counter = 1;
                for(String s:appUsers){%> 
                <tr> 
                    <td><%=s%></td> 
                    <td><%=counter%></td> 
                </tr> 
            <%counter++;}%> 
        </table>
        
        <form action="AdminDashboard.jsp" method="get">
          
            <%for(int i = 0; i < appUsers.size(); i++){%>
            
                Approve<%out.print(" " + (i+1));%><input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="myFunction()">
                <br>
                
            <%}%>
            
            <input type="submit" value="Confirm">
        </form>
        
        <p id="text" style="display:none">Checkbox is CHECKED!</p>
        
        <%int r = 1;%>
        
        <script type=text/javascript>
            function myFunction() {
                // Get the checkbox
                var checkBox = document.getElementById("<%=r%>");
                // Get the output text
                var text = document.getElementById("text");

                // If the checkbox is checked, display the output text
                if (checkBox.checked == true){
                  text.style.display = "block";
                } else {
                  text.style.display = "none";
                }
              }
        </script>
        
    </body>
</html>