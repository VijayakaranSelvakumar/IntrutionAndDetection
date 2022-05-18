<%-- 
    Document   : DecryptDetails
    Created on : Oct 15, 2018, 1:03:05 PM
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
    </head>
    <body>
        <%

            String id = request.getParameter("dit1");
        %>

    <center><table class="table table-striped table-hover table-responsive table-bordered">
            <tr><th>User Name</th><th>Gender</th><th>Date Of Birth</th><th>E-mail</th><th>Contact</th></tr>

            <%
                String name = (String) session.getAttribute("admin");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");
                    PreparedStatement ps = con.prepareStatement("select * from managerreg where name=?");
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
//                                                    String namee = rs.getString("name");
                        String nam = rs.getString("name");
                        String gen = rs.getString("gen");
                        String dob = rs.getString("dob");
                        String mail = rs.getString("mail");
                        String conn = rs.getString("contact");


            %>


           <%
Thread.sleep(7000);
%>

            <tr><td><%=nam%></td><td><%=gen%></td><td><%=dob%></td><td><%=mail%></td><td><%=conn%></td></tr>




            <%                             }
                } catch (Exception e) {
                    System.out.println(e);

                }


            %>
        </table></center>
    </body>
</html>
