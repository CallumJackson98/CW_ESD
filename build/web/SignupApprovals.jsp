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
            
        <!--    Header of the page    -->
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>List of users awaiting approval:</h1>
        <p>Please tick the users that you want to accept and then confirm. Any 
            un-ticked users will be deleted from our records.</p>
       
        <!--    Get array list from servlet    -->
        <%
            
            ArrayList<String> appUsers = (ArrayList<String>)request.getAttribute("appUsers"); 
            
        %> 
        
        <!--    Create table and populate with data from array list    -->
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
        
        <!--    Create dynamic table that has correct amount of checkboxes    -->
        <form action="AdminDashboard.jsp" method="get">
          
            <%for(int i = 0; i < appUsers.size(); i++){%>
            
                Approve<%out.print(" " + (i+1));%><input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                <br>
                
            <%}%>
            
            <input type="submit" value="Confirm">
        </form>
        
        <!--    Items to display which boxes are ticked    -->
        <p>Users to be added to system:<br></p>
        <p id="displayChecked">(None checked)</p>
        
        <!--    Function to check which boxes are ticked and update on page    -->
        <script type=text/javascript>
            function getChecked() {
                
                // Var to hold checked boxes
                var checked = "";
                
                <%for(int j = 0; j < appUsers.size(); j++){%>
            
                    // Get the checkbox
                    var checkBox = document.getElementById("<%=j%>");
                    
                    // Check if checked
                    if (checkBox.checked == true){
                        // Add id to tracker variable
                        checked = checked + "<%=j%> ";
                    }
                
                <%}%>
                
                if(checked === ""){
                    document.getElementById("displayChecked").innerHTML = "(None checked)";
                }else{
                    document.getElementById("displayChecked").innerHTML = checked;
                }
                
              }
        </script>
        
    </body>
</html>