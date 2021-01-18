<%-- 
    Document   : StaffSignUp
    Created on : 11-Dec-2020, 16:36:26
    Author     : Jake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Sign Up Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

            html, body {
                margin: 0;
                border: 0;
            }

            body {
                background-color: #F5F5F5;
                height: 100vh;
            }

            * {
                box-sizing: border-box;
            }

            a {
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #edf0f1;
                text-decoration: none;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 30px 10%;
            }

            .content {
                max-width: 1180px;
                margin: auto;
                background-color: #2d3144;
                height: 100%;
            }

            input {
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
                background: #f8f8ff;
                padding: 20px;
                border-radius: 5px;
                display: inline-block;
                border: none;
            }

            button {
                color: #fff !important;
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 16px;
                text-decoration: none;
                background: #6b944a;
                padding: 20px;
                border-radius: 5px;
                display: inline-block;
                border: none;
                transition: all 0.4s ease 0s;
            }

            button:hover {
                background: #434343;
                letter-spacing: 1px;
                -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.60);
                -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.60);
                box-shadow: 5px 40px -10px rgba(0,0,0,0.60);
                transition: all 0.4s ease 0s;
            }

            p { 
                color: #f8f8f8;
                font-family: "Montserrat", sans-sarif; 
                font-size: 14px;
                font-weight: 500;
                line-height: 32px;
                padding: 0px 200px;
            }

            h1 { /*Title light grey text*/
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 24px;
                color: #a3a1a0;
                text-decoration: underline;
            }

            label {
                font-family: "Montserrat", sans-sarif;
                font-weight: 500;
                font-size: 18px;
                color: #f8f8f8;
            }

            input[type=radio] {
                border: 0px;
                width: 1.4em;
                height: 1.4em;
            }

            .flexbox1{
                display: flex;
                justify-content: center;
                padding: 30px 10%;
            }

            .buttonBlueStyle {
                background: #23408e;
            }
            
            .makeHidden {
                visibility: hidden;
            }
        </style>    
    </head>
    <body>
        <%-- Invalidate session so access to other pages not allowed. --%>
        <%session.invalidate();%>
        
        <div class="content">
            <header>
                <a href="HomePage.html">SmartCare Surgery</a>
                <a href="#">Staff Signup</a>
            </header>
            <div>
                <p>
                    This is the sign up page. Please enter your details below. <br>
                    Once submitted, an administrator will approve or reject your application.
                </p>
            </div>
            <div class="flexbox1">
                <form action="SignUpServlet" method="post" id="signupform">
                    <input type="text" name="fName" required placeholder="First Name">
                    <input type="text" name="sName" required placeholder="Last Name">
                </form>
            </div>
            <div class="flexbox1">
                <input type="password" name="pwd" required placeholder="Password" form="signupform">
            </div>
            <div class="flexbox1">
                <input type= "address" name="address" id="address" size="50" required placeholder="Address" form="signupform">
                <button class= "buttonStyleBlue" type="button" onclick="userAction()" form="signupform">Lookup</button>
            </div>
            <div class="flexbox1">
                <input type="radio" id="doctor" name="staffRole" value="Doctor" checked form="signupform">
                <label for="doctor">Doctor</label><br>
                <input type="radio" id="nurse" name="staffRole" value="Nurse" form="signupform">
                <label for="nurse">Nurse</label><br>
            </div>
            <div class="flexbox1">
                <input type="radio" id="ft" name="shift" value="FT" checked form="signupform">
                <label for="ft">Full Time</label><br>
                <input type="radio" id="pt" name="shift" value="PT" form="signupform">
                <label for="pt">Part Time</label><br>
            </div>
            <div class="flexbox1">
                <button class="buttonBlueStyle" type="submit" value="StaffSignUp" form="signupform">Signup</button>
            </div>
            
            <div class="makeHidden">
                <p id="json_out"></p>
            </div>
            
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
        </div>
    </body>
</html>
