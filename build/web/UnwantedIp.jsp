<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Attack Prevention</title>
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Favicons
            ================================================== -->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

        <!-- Bootstrap -->
        <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

        <!-- Stylesheet
            ================================================== -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
        <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <script src="js/hai.js" type="text/javascript"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

        <style>
          #table-wrapper {
  position:relative;
}
#table-scroll {
  height:450px;
  overflow:auto;  
  margin-top:20px;
}
#table-wrapper table {
  width:100%;

}
#table-wrapper table * {
  background:black;
  color:black;
}
#table-wrapper table thead th .text {
  position:absolute;   
  top:-20px;
  z-index:2;
  height:20px;
  width:35%;
  border:1px solid red;
}
        </style>

    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
                    <%
Thread.sleep(10000);
%>
        <!-- Navigation
            ==========================================-->
        <nav id="menu" class="navbar navbar-default navbar-fixed-top">
            <div class="container"> 
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Attacks And Preventions</a>
                    <div class="phone"><span>Call Today</span>320-123-4321</div>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <!--        <li><a href="#about" class="page-scroll">About</a></li>
                                <li><a href="#services" class="page-scroll">Services</a></li>
                                <li><a href="#portfolio" class="page-scroll">Projects</a></li>
                                <li><a href="#testimonials" class="page-scroll">Testimonials</a></li>
                                <li><a href="#contact" class="page-scroll">Contact</a></li>-->

                        <li><a href="index.html" class="page-scroll">Home</a></li>
                        <li><a href="UserLogin.jsp" class="page-scroll">User</a></li>
                        <li><a href="ManagerLogin.jsp" class="page-scroll">Security Manager</a></li>
                        <!--                        <li><a href="#testimonials" class="page-scroll">Testimonials</a></li>
                                                <li><a href="#contact" class="page-scroll">Contact</a></li>-->
                    </ul>
                </div>
                <!-- /.navbar-collapse --> 
            </div>
        </nav>
        <!-- Header -->


        <div id="contact">
            <div class="container">
                <div class="col-md-12">
                    <div class="row">
                        <div class="section-title">
                            <h2>Prevent DNS Attack</h2>
                            <!--<p>Please fill out the Login form below..</p>-->
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <h3 style="color: white"><u>Malicious IP List</u></h3>
                                    <div id="table-wrapper">

                                        <div id="table-scroll">

                                            <center> <table  style="width: 600px; height: 500px" class="table-sm">
                                                    <thead> <tr><th><h3 style="color: white"><b>Malicious IP's</b></h3></th></tr></thead>
                                                            <%
                                                                try {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");
                                                                    PreparedStatement ps = con.prepareStatement("select * from ipdet");
                                                                    ResultSet rs = ps.executeQuery();
                                                                    while (rs.next()) {

                                                                        String ips = rs.getString("dest");


                                                            %>

                                                    <tbody> <tr><td><h3 style="color: white"><%=ips%></h3></td></tr></tbody>



                                                    <%
                                                            }
                                                        } catch (Exception e) {

                                                            System.out.println(e);
                                                        }


                                                    %>

                                                    <center> <div>

                                                           

                                                        </div></center>

                                                </table>

                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" style="margin-top: 200px">
                                    <center> 
                                                                             <h3 > <button><a class="btn btn-warning" style="color: red" href="SpoofingIp.jsp" >Check Blocked IP</a></button></h3>

                                        <%                                                        String ips = null;
                                            Connection con = null;
                                            PreparedStatement ps = null;
                                            try {
                                                int i = 0;
                                                Class.forName("com.mysql.jdbc.Driver");
                                                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");
                                                ps = con.prepareStatement("select * from dns_spoof");
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {

                                                    ips = rs.getString("sourceip");
                                                    i++;
                                                }
                                                if (i != 0) {
                                                    ps = con.prepareStatement("update dns_spoof set status=? where sourceip=?");
                                                    ps.setString(1, "Blocked");
                                                    ps.setString(2, ips);
                                                    int x = ps.executeUpdate();

                                                }
                                            } catch (Exception e) {

                                                System.out.println(e);
                                            }
                                        %>


                                        <h3 style="color: white"><b style="color: red"><%=ips%></b> --> This IP is Malicious Source IP.. Its Blocked Automatically</h3>



                                    </center>
                                </div>
                            </div>

                        </div>

                        <!--<div id="success"></div>-->





                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row">
                        <div class="social">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Section -->
        <div id="footer">
            <div class="container text-center">
                <p>&copy; 2018. Design by <a href="http://www.stigmata.co.in/" rel="nofollow">Stigmata Techno Solutions</a></p>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
        <script type="text/javascript" src="js/bootstrap.js"></script> 
        <script type="text/javascript" src="js/SmoothScroll.js"></script> 
        <script type="text/javascript" src="js/nivo-lightbox.js"></script> 
        <script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
        <!--<script type="text/javascript" src="js/contact_me.js"></script>--> 
        <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>