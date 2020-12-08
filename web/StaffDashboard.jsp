<%-- 
    Document   : StaffDashboard
    Created on : 24-Nov-2020, 18:16:07
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
    </head>
    <body>
        <h1>Staff dashboard</h1>
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout" >
        </form>

        <%
            //allow access only if session exists
            String user = (String) session.getAttribute("user");
            int type = (Integer) session.getAttribute("type");
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }
        %>
        <h3>Hi <%=userName%>, staff login successful. Your Session ID=<%=sessionID%></h3>
        <h3>USER: <%=type%></h3>
        <br>

    </body>
</html>
