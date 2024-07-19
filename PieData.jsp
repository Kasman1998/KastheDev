<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    <meta charset="UTF-8">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">   
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%
    String id = request.getParameter("USERRESULT");
    String driverName = "oracle.jdbc.OracleDriver";
    String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String userId = "System";
    String password = "oracle";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<h2 align="center" class="w3-opacity w3-black w3-padding-64" style="margin:-10px;"><font><strong>Date GUI Data Analysis</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" style="margin-bottom:90px;">
        <!-- Hidden Sidebar (reveals when clicked on menu icon)-->
        <nav class="w3-sidebar w3-green w3-animate-right w3-xxlarge" style="display:inherit;right:0;z-index:2" id="mySidebar">
            <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-green w3-xxxlarge w3-display-topright" style="padding:0 12px;">
                <i class="fa fa-remove"></i>
            </a>
            <div class="w3-bar-block w3-center">
                <a href="index.html" class="w3-bar-item w3-button w3-text-black w3-dark-green" onclick="closeNav()">Home</a>
                <a href=" index.html#portfolio" class="w3-bar-item w3-button w3-text-black w3-hover-black" onclick="closeNav()">Projects</a>
                <a href="index.html#about" class="w3-bar-item w3-button w3-text-black w3-hover-black" onclick="closeNav()">About</a>
                <a href="index.html#contact" class="w3-bar-item w3-button w3-text-black w3-hover-black" onclick="closeNav()">Contact</a>
            </div>
        </nav>

    <span class="w3-button w3-top w3-yellow w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;" onclick="openNav()"><i class="fa fa-bars"></i></span>
    
    <tr>

    </tr>
    <tr bgcolor="green">
        <td><b>Animals</b></td>
        <td><b>Count</b></td>
    </tr>
    <script language="Javascript">
        function refreshpage() {
            document.forms.form1.submit();
        }
    </script>
</head>
<body class="w3-yellow">
    <h1 class="w3-center">Pie Chart</h1>
    <%response.setIntHeader("Refresh", 30);%>
<center> <form id="form1">

        <img  class="w3-hover-opacity w3-container w3-padding-32 w3-center " src="<%=request.getContextPath()%>/PieData?type=PNG&width=600&height=400&quality=.9"></img>
        <!--  <input type="button" onclick="refreshpage()" value="Refresh"/>-->
    </form></center>
</body>
</html>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl, userId, password);
        statement = connection.createStatement();
        String sql = "select userresult,count(*) from KwentinData group by userresult having count(*) >=1";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<tr bgcolor="gray" >

    <td><%=resultSet.getString("USERRESULT")%></td>
    <td><%= resultSet.getString("count(*)")%>  </td>
</tr>


<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>
   <footer class="w3-container w3-padding-32 w3-black w3-center w3-opacity w3-xlarge" style="margin:-24px; margin-bottom: -12px;">
            <i class="fa fa-facebook-official w3-hover-opacity"></i>
            <i class="fa fa-instagram w3-hover-opacity"></i>
            <i class="fa fa-snapchat w3-hover-opacity"></i>
            <i class="fa fa-pinterest-p w3-hover-opacity"></i>
            <i class="fa fa-twitter w3-hover-opacity"></i>
            <i class="fa fa-linkedin w3-hover-opacity"></i>
            <p class="w3-medium">Developer by  <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" >Kwentin Shelton</a></p>
            <!-- End footer -->
        </footer></body>
        
        
         <script>
        // Open and close sidebar
        function openNav() {
            document.getElementById("mySidebar").style.width = "100%";
            document.getElementById("mySidebar").style.display = "block";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.display = "none";
        }
    </script>