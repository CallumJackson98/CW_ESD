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
    </head>
    <body>
        <a href="StaffDashboard.jsp">Back to dashboard</a>
        <h1>Prescription Approvals</h1>
        <p>From this page you can accept or reject prescription approvals.</p>
        
        <!--    Get array list from servlet    -->
        <%
            
            ArrayList<String> requestedPrescriptions = (ArrayList<String>)request.getAttribute("reqPrescriptions"); 
            
        %> 
        
        <!--    Create table and populate with data from array list    -->
        <table border ="1" width="500" align="center">
            <tr bgcolor="45a5bf"> 
                <th colspan="4"><b>Prescription</b></th>
            </tr>
            <tr bgcolor="45a5bf">
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
        
        <!--    Create dynamic table that has correct amount of checkboxes    -->
        <form action="arPrescriptionServlet" method="post">
          
            <%for(int i = 0; i < requestedPrescriptions.size(); i++){%>
            
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
        
    </body>
</html>
