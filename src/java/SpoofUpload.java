/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DB.DbQuery;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Stigmata
 */
public class SpoofUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String url = request.getParameter("url");
            String ip = request.getParameter("ip");
            String surl = request.getParameter("spoofurl");

            InetAddress ipAddr = InetAddress.getLocalHost();
            String ipp = ipAddr.getHostAddress();

            PreparedStatement ps = null;
            Connection con = null;

            try {
                int i = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "@Root123");
                ps = con.prepareStatement("select * from dns_spoof where oriurl=?");
                ps.setString(1, url);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    i++;
                }
                if (i == 0) {

                    ps = con.prepareStatement("insert into dns_spoof(sourceip,dnsip,oriurl,spoofurl,status) values (?,?,?,?,?)");
                    ps.setString(1, ipp);
                    ps.setString(2, ip);
                    ps.setString(3, url);
                    ps.setString(4, surl);
                    ps.setString(5, "spoofed");

                    int x = ps.executeUpdate();
                    if (x != 0) {
                        request.getRequestDispatcher("index.html").forward(request, response);
                    } else {
                        request.getRequestDispatcher("SpoofIp.jsp").forward(request, response);
                    }
                } else {

                    request.getRequestDispatcher("AttackerSpoofingDNS.html").forward(request, response);

                   
                  

                }
            } catch (Exception e) {
                System.out.println(e);
                JOptionPane.showMessageDialog(null, e);
            }
             
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
