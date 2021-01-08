<%-- 
    Document   : ChangeConsultationCost
    Created on : 07-Jan-2021, 16:49:32
    Author     : Sam Colwill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Consultation Cost</title>
    </head>
    <body>
        <a href="AdminDashboard.jsp">Back to dashboard</a>
        <h1>Consultation Costs</h1>
        <p>To make alterations to consultation costs please enter
            the new values and click submit.</p>

        <form action="ChangeConsultationCostServlet" method="post">
            Doctor Consultation Price: <input type="text" name="doctorPrice">
            <br>
            Nurse Consultation Price: <input type="text" name="nursePrice">
            <br>
            Operation Price: <input type="text" name="operationPrice">
            <br>
            <input type="submit" value="ChangeCost">
        </form>
        
    </body>
</html>
