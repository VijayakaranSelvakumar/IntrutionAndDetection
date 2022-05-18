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
public class UserReg extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            String gen = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String mail = request.getParameter("mail");
            String contact = request.getParameter("con");

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
                
                ps = con.prepareStatement(DbQuery.Al_REG);

                ps.setString(1, name);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    j++;
                }
                if (j == 0) {
                    ps = con.prepareStatement(DbQuery.REG);
                    ps.setString(1, name);
                    ps.setString(2, pass);
                    ps.setString(3, gen);
                    ps.setString(4, dob);
                    ps.setString(5, mail);
                    ps.setString(6, contact);
                    ps.setString(7, ip);
                    ps.setString(8, m);
                    int x=ps.executeUpdate();
                       if(x!=0){
                    
                    String reg="Registration Successfully";
                    request.setAttribute("reg", reg);
                    request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
                    
                }else{
                    String reg="Registration Failed";
                    request.setAttribute("reg", reg);
                    request.getRequestDispatcher("userReg.jsp").forward(request, response);
                }
                }else{
                    String reg="This User Name Is Already Registered";
                    request.setAttribute("regg", reg);
                    request.getRequestDispatcher("userReg.jsp").forward(request, response);
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
