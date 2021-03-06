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
@WebServlet(name = "getCategory", urlPatterns = {"/getCategory"})
public class getCategory extends HttpServlet {
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()){
            Connection conn = MySQLConn.getMySQLConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT category from Book GROUP BY category");
            
            out.println("<categories>");
            while(rs.next()){
                out.println("<category>"+rs.getString("category")+"</category>");
            }
            out.println("</categories>");
            
            rs.close();
            st.close();
            conn.close();
        }catch (SQLException e1){
            e1.printStackTrace();
        }catch (ClassNotFoundException e2) {
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
