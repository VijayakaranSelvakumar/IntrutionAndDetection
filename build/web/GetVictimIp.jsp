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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->


    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

        <!-- Navigation
            ==========================================-->
        <nav id="menu" class="navbar navbar-default navbar-fixed-top">
            <div class="container"> 
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Attacks And Preventions</a>
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

                        <li><a href="index.html" class="page-scroll">Home</a></li>
                        <li><a href="UserLogin.jsp" class="page-scroll">User</a></li>
                         <li><a href="DnsAttack.jsp" class="page-scroll">DNS Attack</a></li>
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
                <div class="col-md-8">
                    <div class="row">
                        <div class="section-title">
                            <h2>DNS Attack</h2>
                            
                        </div>
                        <h4 style="color: green">${reg}</h4>
                        <h4 style="color: red">${block}</h4>
                        <h4 style="color: red">${msg}</h4>
                        
                        <form action="DNSAttack" method="post" id="contactForm" novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Put The Victim IP Address</label>
                                        <input type="text" name="ip" id="name" class="form-control" placeholder="Name" required="">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                
                            </div>

                            <!--<div id="success"></div>-->
                            <button type="submit" class="btn btn-custom btn-lg">Attack</button><br>


                        </form>
                        
                        

                        
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