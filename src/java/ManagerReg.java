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

/**
 *
 * @author stigmata
 */
public class ManagerReg extends HttpServlet {

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
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            String gen = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String mail = request.getParameter("mail");
            String contact = request.getParameter("con");

            String n = CryptWithMD5.cryptWithMD5(name);
            String p = CryptWithMD5.cryptWithMD51(pass);
            String gg = CryptWithMD5.cryptWithMD52(gen);
            String dobb = CryptWithMD5.cryptWithMD53(dob);
            String ma = CryptWithMD5.cryptWithMD54(mail);
            String conn = CryptWithMD5.cryptWithMD55(contact);

            GetConnection g = new GetConnection();

            try {
                int j = 0;

                InetAddress ipAddr = InetAddress.getLocalHost();
                String ip = ipAddr.getHostAddress();
                RandamIp i = new RandamIp();

                String d = i.a();

                String m = MacAdd.getMAC();
                String url = g.getPropertyValue("jdbc.url");
                String username = g.getPropertyValue("jdbc.username");
                String password = g.getPropertyValue("jdbc.password");
                String driver = g.getPropertyValue("jdbc.driver");
                PreparedStatement ps = null;
                Class.forName(driver);
                Connection con = (Connection) DriverManager.getConnection(url, username, password);

                ps = con.prepareStatement(DbQuery.MAl_REG);

                ps.setString(1, name);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    j++;
                }
                if (j == 0) {
                    ps = con.prepareStatement(DbQuery.MREG);
                    ps.setString(1, name);
                    ps.setString(2, pass);
                    ps.setString(3, gen);
                    ps.setString(4, dob);
                    ps.setString(5, mail);
                    ps.setString(6, contact);
                    ps.setString(7, ip);
                    ps.setString(8, m);

                    //encrypt
                    ps.setString(9, n);
                    ps.setString(10, p);
                    ps.setString(11, gg);
                    ps.setString(12, dobb);
                    ps.setString(13, ma);
                    ps.setString(14, conn);

                    mail mmm = new mail();
                    mmm.sendgroup(mail, n, p, ma);

                    int x = ps.executeUpdate();
                    if (x != 0) {

                        String mreg = "Registration Successfully";
                        request.setAttribute("mreg", mreg);
                        request.getRequestDispatcher("ManagerLogin.jsp").forward(request, response);

                    } else {
                        String mreg = "Registration Failed";
                        request.setAttribute("mreg", mreg);
                        request.getRequestDispatcher("ManagerReg.jsp").forward(request, response);
                    }
                } else {
                    String mreg = "This User Name Is Already Registered";
                    request.setAttribute("mregg", mreg);
                    request.getRequestDispatcher("ManagerReg.jsp").forward(request, response);
                }

            } catch (Exception e) {
                System.out.println(e);
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
