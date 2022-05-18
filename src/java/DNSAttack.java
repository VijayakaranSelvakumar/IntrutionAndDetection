/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.DbQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author stigmata
 */
public class DNSAttack extends HttpServlet {

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

            String url = request.getParameter("ip");
            String ip = request.getParameter("ip");
//            String por=request.getParameter("port");
            String hostname = "Unknown";
//            GetConnection g = new GetConnection();

            try {
                int i = 0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");
                PreparedStatement ps = con.prepareStatement("select * from ipdet where sno='1' and status='Block'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                    i++;

                }
                if (i == 0) {

                    String[] arguments = new String[]{url};
                    Attacker.main(arguments);

                    RequestDispatcher rd = request.getRequestDispatcher("GetVictimIp.jsp");
                    rd.forward(request, response);
                } else {
                    String msg="Your Ip is Already Blocked";
                    request.setAttribute("msg", msg);
                    RequestDispatcher rd = request.getRequestDispatcher("GetVictimIp.jsp");
                    rd.forward(request, response);
                }

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
                RequestDispatcher rd = request.getRequestDispatcher("GetVictimIp.jsp");
                rd.forward(request, response);
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
