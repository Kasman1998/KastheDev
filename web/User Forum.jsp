<%-- 
    Document   : User Forum
    Created on : Dec 14, 2019, 7:29:46 PM
    Author     : beadb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Thanks for Joining Email List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body class="w3-yellow">
        <%-- The Purpose this webpage to capture confirm the client information and sent them a email welcoming them to my website--%>
        <h1 class="w3-text-white w3-black w3-center w3-opacity w3-padding-64" style="margin:-5px; ">Thanks for Joining the Email List</h1>
        <form action="User Forum"   method="post">
        
            <p class="w3-center w3-yellow w3-padding-64" style="padding-top:40px;">Thanks ${user.firstName} ${user.lastName} for submit your information.
                A message will be
                sent to ${user.email}  Redirecting to Home page after <span id="countdown">10</span> seconds   </p>


            <script type="text/javascript">
                // Total seconds to wait 
                var seconds = 10;

                function countdown() {
                    seconds = seconds - 1;
                    if (seconds < 0) {
                        // Chnage your redirection link here 
                        window.location = "index.html";
                    } else {
                        // Update remaining seconds 
                        document.getElementById("countdown").innerHTML = seconds;
                        // Count down using javascript 
                        window.setTimeout("countdown()", 1000);
                    }
                }
                countdown();
    
            </script>
           

        </form>   
            <footer class="w3-container w3-padding-64 w3-black w3-center w3-opacity w3-xlarge" style="margin:-100px;  margin-top: 800px;">
            <i class="fa fa-facebook-official w3-hover-opacity"></i>
            <i class="fa fa-instagram w3-hover-opacity"></i>
            <i class="fa fa-snapchat w3-hover-opacity"></i>
            <i class="fa fa-pinterest-p w3-hover-opacity"></i>
            <i class="fa fa-twitter w3-hover-opacity"></i>
            <i class="fa fa-linkedin w3-hover-opacity"></i>
            <p class="w3-medium">Developer by  <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" >Kwentin Shelton</a></p>
            <!-- End footer -->
        </footer>
    </body>
</html>