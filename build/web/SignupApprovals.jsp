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
                <th><b>Index</b></th> 
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
        <form action="AcceptRejectServlet" method="post">
          
            <%for(int i = 0; i < appUsers.size(); i++){%>
            
                Approve<%out.print(" " + (i+1));%><input type="checkbox" name="<%=i%>" id="<%=i%>" value="user" onclick="getChecked()">
                <br>
                
            <%}%>
            
            Accept <input type="radio" id="accept" name="arButton" value="Accept" checked>
            Reject <input type="radio" id="reject" name="arButton" value="Reject">
            <br>
            
            <!--      Hidden element to pass references to rows      -->
            <input type="hidden" id="checked_hidden" name="checked_hidden"  value="">
            
            <input type="submit" value="Confirm">
        </form>
        
        <!--    Items to display which boxes are ticked    -->
        <p>Users to be added/removed (indexes):<br></p>
        <p id="displayChecked">(None checked)</p>
        
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
        
    </body>
</html>