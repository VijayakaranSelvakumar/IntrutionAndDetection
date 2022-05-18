/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Stigmata
 */
public class Search extends HttpServlet {

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

            String ser = request.getParameter("se");

            try {
                PreparedStatement ps = null;
                ResultSet rs = null;
                String f = null;
                String ori = null;
                String spoof = null;
                String sub = null;
                int x = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dns", "root", "root");

                ps = con.prepareStatement("select * from dns_spoof");

                rs = ps.executeQuery();
                while (rs.next()) {
                    ori = rs.getString("oriurl");
                    spoof = rs.getString("spoofurl");
                    f = rs.getString("status");
                    sub = rs.getString("suburl");
                }
                if (f.equals("Blocked")) {

                    if (ser.equals(ori)) {

                        response.sendRedirect("http://localhost:8084/AttackesAndPrevention/UserLogn.jsp");

                    } else {
                        String msg = "Please Check your Domain";
                        request.setAttribute("m", msg);
                        request.getRequestDispatcher("SearchURL.jsp").forward(request, response);
                    }

                } else if (f.equals("spoofed")) {

                    ps = con.prepareStatement("select * from dns_spoof where oriurl=?");
                    ps.setString(1, ser);
                    

                    rs = ps.executeQuery();

                    while (rs.next()) {
                        x++;
                    }
                    if (x != 0) {

//                    request.getRequestDispatcher("xss.jsp").forward(request, response);
//                    response.sendRedirect("http://www.srmvalliammai.ac.in/");
                        response.sendRedirect("http://localhost:8084/AttackesAndPrevention/UserLogiin.jsp");

                    } else {
                        String msg = "Cannot Find Your Domain";
                        request.setAttribute("m", msg);
                        request.getRequestDispatcher("SearchURL.jsp").forward(request, response);

                    }
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
