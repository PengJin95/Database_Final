package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chracyc
 */
@WebServlet(name = "viewTransactions", urlPatterns = {"/viewTransactions"})
public class viewTransactions extends HttpServlet {
    private Connection conn;
    String connectionURL = "jdbc:mysql://localhost:8889/DbM_Final";
    String USERNAME = "admin";
    String PASSWORD = "admin";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, USERNAME, PASSWORD);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
            "SELECT t.tid,t.amount,t.price,t.time,t.ISBN,t.cid,t.status,b.name " +
            "FROM Transactions t,book b " +
            "WHERE t.ISBN=b.ISBN AND t.spid=" + request.getParameter("eid"));
            
            out.println("<transactions>");
            while(rs.next()){
                out.println("<transaction>");
                out.println("<tid>"+rs.getString("tid")+"</tid>");
                out.println("<cid>"+rs.getString("cid")+"</cid>");
                out.println("<name>"+rs.getString("name")+"</name>");
                out.println("<amount>"+rs.getInt("amount")+"</amount>");
                out.println("<price>"+rs.getFloat("price")+"</price>");
                out.println("<tprice>"+rs.getFloat("price")*rs.getInt("amount")+"</tprice>");
                out.println("<time>"+rs.getDate("time")+"</time>");
                out.println("<ISBN>"+rs.getString("ISBN")+"</ISBN>");
                out.println("<status>"+rs.getString("status")+"</status>");
                out.println("</transaction>");
            }
            out.println("</transactions>");
        }catch (SQLException e1){
            e1.printStackTrace();
        }catch (ClassNotFoundException e2){
            e2.printStackTrace();
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
