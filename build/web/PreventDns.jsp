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
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
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


        <div id="contact">
            <div class="container">
                <div class="col-md-8">
                    <div class="row">
                        <div class="section-title">
                            <h2>Prevent DNS Attack</h2>
                            <!--<p>Please fill out the Login form below..</p>-->
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Scan Connected IP's</label>
                                    <input type="text" name="name" onclick="like()" value="192.168.1" id="drop" class="form-control" placeholder="IP Range" required="" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>

                        </div>

                        <!--<div id="success"></div>-->
                        <!--<input type="submit" onclick ="like()" id="drop" class="btn btn-custom btn-lg" value="SCAN">-->
                        <button type="submit" onclick ="like()"  class="btn btn-primary btn-lg " id="load1" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing To Find Attacked IP">Scan</button>
                       
                        <div id="search">

                        </div>

                        <!--<a href="DDosLog.jsp" style="color: white">Log MAP</a>-->


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
<!--            <div class="container text-center">
                <p>&copy; 2018. Design by <a href="http://www.stigmata.co.in/" rel="nofollow">Stigmata Techno Solutions</a></p>
            </div>-->
        </div>
        <script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
        <script type="text/javascript" src="js/bootstrap.js"></script> 
        <script type="text/javascript" src="js/SmoothScroll.js"></script> 
        <script type="text/javascript" src="js/nivo-lightbox.js"></script> 
        <script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
        <!--<script type="text/javascript" src="js/contact_me.js"></script>--> 
        <script type="text/javascript" src="js/main.js"></script>
        <script>
            
$('.btn').on('click', function() {
    var $this = $(this);
  $this.button('loading');
    setTimeout(function() {
       $this.button('reset');
   }, 8000);
});

        </script>
    </body>
</html>