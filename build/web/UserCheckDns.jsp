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
        <script src="js/hello.js" type="text/javascript"></script>
        <!-- Stylesheet
            ================================================== -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/nivo-lightbox.css">
        <link rel="stylesheet" type="text/css" href="css/nivo-lightbox/default.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        <script src="ajax/white.js" type="text/javascript"></script>
        <script src="ajax/black.js" type="text/javascript"></script>
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
        <!-- Navigation
            ==========================================-->
        <nav id="menu" class="navbar navbar-default navbar-fixed-top">
            <%
                String name1 = (String) session.getAttribute("admin");
            %>
            <div class="container"> 
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Welcome : <%=name1%></a>
                    <!--<div class="phone"><span>Call Today</span>320-123-4321</div>-->
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <!--        <li><a href="#about" class="page-scroll">About</a></li>
                                <li><a href="#services" class="page-scroll">Services</a></li>
                                <li><a href="#portfolio" class="page-scroll">Projects</a></li>
                                <li><a href="#testimonials" class="page-scroll">Testimonials</a></li>
                                <li><a href="#contact" class="page-scroll">Contact</a></li>-->

                        <li><a href="ManagerHome.jsp" class="page-scroll">Home</a></li>
                        <li><a href="ManagerDet.jsp" class="page-scroll">Details</a></li>
                        <li><a href="PreventDns.jsp" class="page-scroll">Prevent DNS</a></li>
                        <li><a href="UserCheckDns.jsp" class="page-scroll">Check Your DNS</a></li>
                        <!--                        <li><a href="DNS.jsp" class="page-scroll">DNS Attack</a></li>
                                                <li><a href="Cookie.jsp" class="page-scroll">Cookie Poisoning</a></li>-->
                        <li><a href="ManagerLogin.jsp" class="page-scroll">Logout</a></li>
                        <!--                        <li><a href="#testimonials" class="page-scroll">Testimonials</a></li>
                                                <li><a href="#contact" class="page-scroll">Contact</a></li>-->
                    </ul>
                </div>
                <!-- /.navbar-collapse --> 
            </div>
        </nav>
        <!-- Header -->
        <!--        <header id="header">
                    <div class="intro">
                        <div class="overlay">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 intro-text">
                                        <h1>Attacks <br>
                                            & Preventions</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed dapibus leo nec ornare diam. Sed commodo nibh ante facilisis bibendum dolor feugiat at.</p>
                                        <a href="#about" class="btn btn-custom btn-lg page-scroll">Learn More</a> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>-->
        <!-- Get Touch Section -->
        <!--        <div id="get-touch">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-md-offset-1">
                                <h3>Cost for your home renovation project</h3>
                                <p>Get started today and complete our form to request your free estimate</p>
                            </div>
                            <div class="col-xs-12 col-md-4 text-center"><a href="#contact" class="btn btn-custom btn-lg page-scroll">Free Estimate</a></div>
                        </div>
                    </div>
                </div>-->
        <!-- About Section -->

        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-12"> 
                    <!--<img src="img/pro.png" class="img-responsive" alt=""> </div>-->


                    <div  style="margin-top: 200px;margin-right: 300px">



                        <center><h4 style="color: black"><b>Blocked DNS Spoofed IP Using Link Guard</b></h4> </center>


                        <center>
                            <div class="row">
                                <div class="col col-xs-12">
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <input type="text" name="b" value="black" hidden="" onclick="like9()" id="drop">
                                            <button class="btn btn-sm btn-danger" onclick="like9()" id="drop">Black List</button>
                                        </div>
                                        <div class="col col-md-6">
                                            <input type="text" name="w" value="white" hidden="" onclick="like8()" id="drop1">

                                            <button class="btn btn-sm btn-success" onclick="like8()" id="drop1">White List</button>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </center><br><br>
                        <div id="search">

                        </div>
                        <div id="search1">

                        </div>

                    </div>






                </div>
            </div>
        </div>


        <script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
        <script type="text/javascript" src="js/bootstrap.js"></script> 
        <script type="text/javascript" src="js/SmoothScroll.js"></script> 
        <script type="text/javascript" src="js/nivo-lightbox.js"></script> 
        <script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
        <script type="text/javascript" src="js/contact_me.js"></script> 
        <script type="text/javascript" src="js/main.js"></script>

    </body>
</html>