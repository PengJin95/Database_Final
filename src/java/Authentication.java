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
@WebServlet(urlPatterns = {"/Authentication"})
public class Authentication extends HttpServlet {

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
                String query = "SELECT cid FROM CustomerAccount WHERE Username = '"
                        + username + "' AND Password = '" + password + "'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                if (!rs.next()) {
                    out.println("<result>0</result>");
                } else {
                    out.println("<root>");
                    out.println("<result>1</result>");

                    if (session.getAttribute("last_ISBN") != null) {
                        out.println("<lastISBN>" + session.getAttribute("last_ISBN") + "</lastISBN>");
                        out.println("<lastsid>" + session.getAttribute("last_sid") + "</lastsid>");
                    }

                    out.println("</root>");
                    int cid = rs.getInt(1);
                    session.setAttribute("cid", cid);
                    if (request.getParameter("isBusiness") != null && request.getParameter("isBusiness").equals("true")) {
                        query = "SELECT companyname FROM BusinessCustomer WHERE cid=" + cid;
                        Statement st1 = conn.createStatement();
                        rs = st1.executeQuery(query);
                        st1.close();
                        rs.next();
                        session.setAttribute("cname", rs.getString(1));
                    } else {
                        query = "SELECT firstname, lastname FROM HomeCustomer WHERE cid=" + cid;
                        Statement st1 = conn.createStatement();
                        rs = st1.executeQuery(query);
                        rs.next();
                        session.setAttribute("cname", rs.getString(1) + " " + rs.getString(2));
                        st1.close();
                    }
                }
                st.close();
            } else if (request.getParameter("register") != null && request.getParameter("register").equals("true")) {
                System.out.println("get register Param");
                Statement st = conn.createStatement();
                String username = request.getParameter("username");
                String query = "SELECT * FROM CustomerAccount WHERE username = '"
                        + username + "'";
                ResultSet rs = st.executeQuery(query);
                if (rs.next()) {
                    out.println("<result>0</result>");
                } else {
                    PreparedStatement st1 = conn.prepareStatement(
                            "INSERT INTO Customer (email,address,city,zipcode,state) VALUES (?,?,?,?,?)");
                    st1.setString(1, request.getParameter("email"));
                    st1.setString(2, request.getParameter("address"));
                    st1.setString(3, request.getParameter("city"));
                    st1.setString(4, request.getParameter("zip"));
                    st1.setString(5, request.getParameter("state"));
                    st1.executeUpdate();
                    st1.close();
                    query = "SELECT COUNT(*) FROM Customer";
                    Statement st4 = conn.createStatement();
                    rs = st4.executeQuery(query);
                    rs.next();
                    int cid = rs.getInt(1);
                    PreparedStatement st2 = conn.prepareStatement(
                            "INSERT INTO CustomerAccount (cid,username,password,expired) VALUES (?,?,?,?)");
                    st2.setInt(1, cid);
                    st2.setString(2, request.getParameter("username"));
                    st2.setString(3, request.getParameter("password"));
                    st2.setString(4, "0");
                    System.out.println(st2.executeUpdate());
                    st2.close();
                    if (request.getParameter("type").equals("Home")) {
                        PreparedStatement st3 = conn.prepareStatement(
                                "INSERT INTO HomeCustomer (cid,firstname,lastname,gender,marriage,age,income) VALUES (?,?,?,?,?,?,?)");
                        st3.setInt(1, cid);
                        st3.setString(2, request.getParameter("fname"));
                        st3.setString(3, request.getParameter("lname"));
                        st3.setString(4, request.getParameter("gender"));
                        st3.setString(5, request.getParameter("marriage"));
                        st3.setInt(6, Integer.valueOf(request.getParameter("age")));
                        st3.setInt(7, Integer.valueOf(request.getParameter("income")));
                        st3.executeUpdate();
                        st3.close();
                        session.setAttribute("cname", request.getParameter("fname") + " " + request.getParameter("lname"));
                    } else {
                        PreparedStatement st3 = conn.prepareStatement(
                                "INSERT INTO BusinessCustomer (cid,companyname,income,category) VALUES (?,?,?,?)");
                        st3.setInt(1, cid);
                        st3.setString(2, request.getParameter("cname"));
                        st3.setInt(3, Integer.valueOf(request.getParameter("income")));
                        st3.setString(4, request.getParameter("category"));
                        st3.executeUpdate();
                        st3.close();
                        session.setAttribute("cname", request.getParameter("cname"));
                    }
                    session.setAttribute("cid", cid);
                    out.println("<result>1</result>");
                }
            } else if (request.getParameter("logout") != null) {
                session.removeAttribute("cid");
                session.removeAttribute("cname");
                conn.close();
                response.sendRedirect("login.jsp");
            }
            conn.close();
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
