/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
//import javax.swing.JOptionPane;

/**
 *
 * @author stigmata
 */
public class Attacker {

    public static void main(String[] args) throws Exception {
        for (int i = 0; i < 1000; i++) {
            DnsThread thread = new DnsThread();
            thread.start();
        }
    }

    public static class DnsThread extends Thread {

        private AtomicBoolean running = new AtomicBoolean(true);
        private final String request = "http://localhost:8084/AttackesAndPrevention/GetVictimIp.jsp";
        private final URL url;

        String param = null;

        public DnsThread() throws Exception {
            url = new URL(request);
            String ul = url.toString();
            param = "param1=" + URLEncoder.encode("87845", "UTF-8");
        }

        @Override
        public void run() {
            while (running.get()) {
                try {
                    attack();
                } catch (Exception e) {

                }

            }
        }

        public void attack() throws Exception {
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//            String ul=url.toString();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("charset", "utf-8");
            connection.setRequestProperty("Host", "localhost");
            connection.setRequestProperty("User-Agent", "Google Chrome/ 60.0.3112.113 (Windows 7; WOW64; rv:8.0) Gecko/20100101 Google Chrome/ 60.0.3112.113");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", param);
//            System.out.println(this + " " + connection.getResponseCode());
            String ip = InetAddress.getLocalHost().getHostAddress() + connection.getResponseCode();
//           System.out.println(this + " " + ip);
            System.out.println(ip);

            InetAddress ipp = InetAddress.getLocalHost();
//           System.out.println(this + " " + ip);
            String ii = ipp.toString();
            System.out.println(ii);
            String sub=ii.replaceAll("stigmata-PC/", "");

            connection.getInputStream();
            RandamIp i = new RandamIp();
            String d = i.a();
//            GetUrl u=new GetUrl();
//           String uu= u.url(ul);

            try {
                URL myUrl = new URL(url.toString());
                String pro = ("Protocol: " + myUrl.getProtocol());
                String host = ("Host: " + myUrl.getHost());
                String port = ("Port: " + myUrl.getPort());
                String ur = ("Athority of the URL: " + myUrl.getAuthority());
                String qu = ("Query: " + myUrl.getQuery());
                String re = ("Reference: " + myUrl.getRef());

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");
//                PreparedStatement ps=con.prepareStatement("update ip set ipadd='"+ip+"',dest='"+d+"' where id1='1'");
                PreparedStatement ps = con.prepareStatement("insert into ipdet (sourc,dest,proto,host,pos,url,status) values(?,?,?,?,?,?,?)");
                ps.setString(1, sub);
                ps.setString(2, d);

                ps.setString(3, pro);
                ps.setString(4, host);

                ps.setString(5, port);
                ps.setString(6, ur);

                ps.setString(7, "Attack");

                int x = ps.executeUpdate();

                if (x != 0) {
                    System.out.println("Success");

                } else {
                    System.out.println("failed");
                }

            } catch (Exception e) {
                System.out.println(e);

            }
        }

    }

}
