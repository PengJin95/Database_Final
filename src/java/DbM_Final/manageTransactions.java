package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chracyc
 */
@WebServlet(name = "manageTransactions", urlPatterns = {"/manageTransactions"})
public class manageTransactions extends HttpServlet {
    private Connection conn;
    String connectionURL = "jdbc:mysql://localhost:8889/DbM_Final";
    String USERNAME = "admin";
    String PASSWORD = "admin";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, USERNAME, PASSWORD);
            if(request.getParameter("btype").equals("1")){
                Statement st1 = conn.createStatement();
                st1.executeUpdate(
                "UPDATE transactions " +
                "SET status= 'Completed' " +
                "WHERE tid='" + request.getParameter("tid") + "'");
                st1.close();
                conn.close();
            }else if(request.getParameter("btype").equals("0")){
                Statement st2 = conn.createStatement();
                st2.executeUpdate(
                "UPDATE transactions " +
                "SET status= 'Processing' " +
                "WHERE tid='" + request.getParameter("tid") +"'");
                st2.close();
                conn.close();
            }
            
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
