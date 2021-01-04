<%-- 
    Document   : SignUp
    Created on : 07-Dec-2020, 11:33:24
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient sign up page</title>
    </head>
    <body>
        <%-- Invalidate session so access to other pages not allowed. --%>
        <%session.invalidate();%>
        <a href="HomePage.html">Home page</a>
        <h1>Sign up:</h1>
        <p>This is the sign up page. Please enter your details below. Once
        submitted, an administrator will approve or reject your application.</p>
        <br>
        
        <form action="SignUpServlet" method="post">
            First Name: <input type="text" name="fName" required>
            <br>
            Surname: <input type="text" name="sName" required>
            <br>
            Password: <input type="password" name="pwd" required>
            <br>
            Address: <input type= "address" name="address" id="address" size="50" required>
            <button type="button" onclick="userAction()">Lookup</button>
            <br>
            NHS <input type="radio" id="NHS" name="serviceType" value="NHS" checked>
            Private <input type="radio" id="private" name="serviceType" value="Private">
            <br>
            <input type="submit" value="SignUp">
        </form>
        
        <p id="json_out"></p>
        
        <script>
            
            // Function call to api on button press.
            const userAction = async () => {
                
                var address = document.getElementById('address').value
                
                // Get response from api and set to json object
                const response = await fetch('https://nominatim.openstreetmap.org/search?q='+address+'&polygon_geojson=1&format=geocodejson&countrycodes=gb');
                const myJson = await response.json(); //extract JSON from the http response
                
                // Output json
                var str = JSON.stringify(myJson, null, 2);
                document.getElementById("json_out").innerHTML = str;
                
                // Output full address
                document.getElementById("address").value = myJson.features[0].properties.geocoding['label'];
                
            }
            
        </script>
        
    </body>
</html>
