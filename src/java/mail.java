/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stigmata
 */
 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;

/**
 *
 * @author ANAGAN
 */
public class mail {
    public void sendgroup(String maill,String uname, String pwd,String email)
     {
     String to=maill;//change accordingly  
      
      //Get the session object  
      Properties props = new Properties();  
      props.put("mail.smtp.host", "smtp.gmail.com");  
      props.put("mail.smtp.socketFactory.port", "465");  
      props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
      props.put("mail.smtp.auth", "true");  
      props.put("mail.smtp.port", "465");    
      Session session = Session.getDefaultInstance(props,  
       new javax.mail.Authenticator() {  
       protected PasswordAuthentication getPasswordAuthentication() {  
       return new PasswordAuthentication("demoproject143@gmail.com","haihello");//change accordingly  
       }  
      });  
      //compose message  
      try {  
       MimeMessage message = new MimeMessage(session);  
       message.setFrom(new InternetAddress("demoproject143@gmail.com"));//change accordingly  
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
       message.setSubject("Alert");  
       message.setText("user name = "+uname+ " "+ "Password = " +pwd +" "+ " "+ "E-mail"+" "+maill + " "+ "Encrypt E-mail"+" "+email );    
       
       //send message  
       Transport.send(message);  
       System.out.println("message sent successfully");   
      } catch (MessagingException e) {
          throw new RuntimeException(e);
          
          
      }  
}
}
