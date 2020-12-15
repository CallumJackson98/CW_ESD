<%-- 
    Document   : RequestPrescription
    Created on : 15-Dec-2020, 11:36:09
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Prescription</title>
    </head>
    <body>
        
        <%
            String userName = (String) session.getAttribute("user");
        %>
        
        <a href="PatientDashboard.jsp">Back to dashboard</a>
        <h1>Request Prescription</h1>
        <p>Please fill in the form below to request a prescription. A doctor or 
            nurse will review it. All requested and active prescriptions can be 
            seen from the view prescriptions page. <%=userName%></p>
        
        <form action="RequestPrescriptionServlet" method="post">
            Name of drug: <input type="text" name="drugName" required>
            <br>
            <input type="hidden" id="uName_hidden" name="uName_hidden"  value="<%=userName%>">
            <input type="submit" value="RequestPrescription">
        </form>
        
    </body>
</html>
