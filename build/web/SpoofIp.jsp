<%-- 
    Document   : SpoofIp
    Created on : Jan 30, 2020, 9:28:14 PM
    Author     : Stigmata
--%>

<%@page import="java.net.MalformedURLException"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
    </head>
    <body>

        <%

            String id = request.getParameter("dit");

            String s = id;

            try {
                // Fetch IP address by getByName() 
                InetAddress ip = InetAddress.getByName(new URL(s)
                        .getHost());

                // Print the IP address 
                System.out.println("Public IP Address of: " + ip);

                String ipp[] = ip.toString().split("/");
                String ipp1 = ipp[0];
                String ipp2 = ipp[1];


        %>


        <label>URL IP</label>
        <input type="text" name="ip" class="form-control" value="<%=ipp2%>" readonly="">

        <label>Enter Spoof URL</label>
        <input type="text" name="spoofurl" class="form-control"  ><br>
        <input type="submit" value="Submit" class="btn btn-danger">


        <%

            } catch (MalformedURLException e) {
                // It means the URL is invalid 
                System.out.println("Invalid URL");
            }
        %>
    </body>
</html>
