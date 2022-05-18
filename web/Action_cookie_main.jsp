<%-- 
    Document   : Action_cookie_main
    Created on : Oct 16, 2018, 5:32:05 PM
    Author     : stigmata
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
         
   Cookie username = new Cookie("name",
 			  request.getParameter("name"));
   Cookie pass = new Cookie("pass",
			  request.getParameter("pass"));
 
   
   username.setMaxAge(60*60*10); 
   pass.setMaxAge(60*60*10); 
 
   // Add both the cookies in the response header.
   response.addCookie( username );
   response.addCookie( pass );
%>
 
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guru Cookie JSP</title>
</head>
<body>
 
<b>Username:</b>
   <%= request.getParameter("name")%>
<b>Email:</b>
   <%= request.getParameter("pass")%>
 
   
   <%
       
        Cookie cookie = null;
         Cookie[] cookies = null;
   cookies = request.getCookies();
         
         if( cookies != null ) {
            out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               out.print("Name : " + cookie.getName( ) + ",  ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }%>
   
         
         <!--delete cookie-->
         
           <%
         Cookie cookie1 = null;
         Cookie[] cookies1 = null;
         
         // Get an array of Cookies associated with the this domain
         cookies1 = request.getCookies();
         
         if( cookies1 != null ) {
            out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies1.length; i++) {
               cookie = cookies1[i];
               
               if((cookie.getName( )).compareTo("first_name") == 0 ) {
                  cookie.setMaxAge(0);
                  response.addCookie(cookie1);
                  out.print("Deleted cookie: " + 
                  cookie.getName( ) + "<br/>");
               }
               out.print("Name : " + cookie1.getName( ) + ",  ");
               out.print("Value: " + cookie1.getValue( )+" <br/>");
            }
         } else {
            out.println(
            "<h2>No cookies founds</h2>");
         }
      %>
         
         
</body>
</html>
