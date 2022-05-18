/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.DbQuery;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author stigmata
 */
public class ManagerLogin extends HttpServlet {

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
            String mail = request.getParameter("mail");
            

            //session
            HttpSession s = request.getSession();
            s.setAttribute("admin", name);

            //DB
            GetConnection g = new GetConnection();

            try {
                int x = 0;
                String url = g.getPropertyValue("jdbc.url");
                String username = g.getPropertyValue("jdbc.username");
                String password = g.getPropertyValue("jdbc.password");
                String driver = g.getPropertyValue("jdbc.driver");
                PreparedStatement ps = null;
                Class.forName(driver);
                Connection con = (Connection) DriverManager.getConnection(url, username, password);
                ps = con.prepareStatement(DbQuery.MLOGIN);
                ps.setString(1, name);
                ps.setString(2, pass);
                ps.setString(3, mail);
                
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    x++;
                }
                if (x != 0) {
                    String mlog = "Attacked by XSS";
                    request.setAttribute("log", mlog);
                    request.getRequestDispatcher("ManagerHome.jsp").forward(request, response);

//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Attacked by XSS.. To prevent from xss again Login');");
//                    out.println("location='XSS.jsp'");
//                    out.println("</script>");

                } else {
                    String mlog = "Login Failed";
                    request.setAttribute("log", mlog);
                    request.getRequestDispatcher("ManagerLogin.jsp").forward(request, response);

//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Login Success');");
//                    out.println("location='sadminhome.jsp'");
//                    out.println("</script>");
                }

            } catch (Exception e) {

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
