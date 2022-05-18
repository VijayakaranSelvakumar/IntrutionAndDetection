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
import javax.management.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author stigmata
 */
public class NodeCheck extends HttpServlet {

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
            String node = request.getParameter("node");

            GetConnection g = new GetConnection();
            for (int endofAddr = 1; endofAddr < 255; endofAddr++) {
                try {

                    int timeOut = 200;
                    String addr = node + "." + endofAddr;
                    if (InetAddress.getByName(addr).isReachable(timeOut)) {
                        System.out.println(addr + " found");

                        String url = g.getPropertyValue("jdbc.url");
                        String username = g.getPropertyValue("jdbc.username");
                        String password = g.getPropertyValue("jdbc.password");
                        String driver = g.getPropertyValue("jdbc.driver");
                        Class.forName(driver);
                        Connection con = (Connection) DriverManager.getConnection(url, username, password);
//                        PreparedStatement ps1 = con.prepareStatement(DbQuery.DELIP);
//                        int x1=ps1.executeUpdate();
                        
                        PreparedStatement ps = con.prepareStatement(DbQuery.IPCHECK);
                        ps.setString(1, addr);
                        int xx = ps.executeUpdate();
                        if (xx != 0) {
                            String msg = "Checking Successfully";
                            request.setAttribute("node", msg);
                            request.getRequestDispatcher("DnsAttack.jsp").forward(request, response);

                        } else {
                            String msg = "Checking Failed";
                            request.setAttribute("node", msg);
                            request.getRequestDispatcher("DnsAttack.jsp").forward(request, response);
                        }
                    } else {
                        String msg = "Checking Failed";
                        request.setAttribute("node", msg);
                        request.getRequestDispatcher("DnsAttack.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                    System.out.println(e);
                }
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
        
        Fuzzy f=new Fuzzy();
        
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
