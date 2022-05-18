<%-- 
    Document   : ScanIp
    Created on : Oct 14, 2018, 5:46:34 PM
    Author     : stigmata
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        
        <%
        
        String id=request.getParameter("dit");
        %>
        
    <center> <table class="table-striped table-responsive table-bordered">
            <tr><th>Connected IP's</th></tr>
            <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/dns","root","root");
                PreparedStatement ps=con.prepareStatement("select * from dns_spoof");
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    
                    String ips=rs.getString("dnsip");
            
            
            %>
            
            <%
Thread.sleep(7000);
%>
            <tr><td><h3 style="color: white"><%=ips%></h3></td></tr>
            
           
            
            <%
                }}catch(Exception e){

System.out.println(e);
}
            
            
            
            %>
            <!--<tr><td><a class="btn btn-md btn-danger" href="UnwantedIp.jsp"><button  class="btn btn-primary btn-lg" id="load2" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing To Check Malicious Ip & Automatic Blocking">Scan malicious IP's Fuzzy</button></a></td></tr>-->
            <tr><td><a class="btn btn-md btn-danger" href="UnwantedIp.jsp"><button  class="btn btn-primary btn-lg" id="load2" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing To Check Malicious Ip & Automatic Blocking">Scan malicious IP's Fuzzy</button></a></td></tr>
            
        </table></center>
        
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
