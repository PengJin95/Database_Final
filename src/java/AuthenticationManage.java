/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Think
 */
@WebServlet(urlPatterns = {"/AuthenticationManage"})
public class AuthenticationManage extends HttpServlet {

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
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://209.222.10.150:3306/DBM_Final";
            Connection conn = DriverManager.getConnection(connectionURL, "DBM_Final", "123");
            if (request.getParameter("login") != null && request.getParameter("login").equals("true")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String query = "SELECT eid FROM EmployeeAccount WHERE username = '"
                        + username + "' AND password = '" + password + "'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                if (!rs.next()) {
                    out.println("<result>0</result>");
                } else {
                    out.println("<root>");
                    out.println("<result>1</result>");

                    out.println("</root>");
                    int eid = rs.getInt(1);
                    session.setAttribute("eid", eid);

                    query = "SELECT firstname, lastname FROM Employee WHERE eid=" + eid;
                    Statement st1 = conn.createStatement();
                    rs = st1.executeQuery(query);
                    rs.next();
                    session.setAttribute("ename", rs.getString(1) + " " + rs.getString(2));
                    st1.close();
                }
                st.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
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
