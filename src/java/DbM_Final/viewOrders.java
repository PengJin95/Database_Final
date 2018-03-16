package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chracyc
 */
@WebServlet(name = "viewOrders", urlPatterns = {"/viewOrders"})
public class viewOrders extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection conn = MySQLConn.getMySQLConnection();
            HttpSession session = request.getSession(true);
            
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(
            "SELECT o.oid,o.time,count(t.tid) as productnum,o.totalprice " +
            "FROM Transactions t,Orders o " +
            "WHERE t.oid=o.oid AND o.cid=" + String.valueOf(session.getAttribute("cid")) + " " +
            "GROUP BY o.oid");
            if(rs1.next()){
                out.println("<orders>");
                while(rs1.next()){
                    out.println("<order>");
                    out.println("<oid>"+rs1.getString("oid")+"</oid>");
                    out.println("<time>"+rs1.getDate("time")+"</time>");
                    out.println("<productnum>"+rs1.getInt("productnum")+"</productnum>");
                    out.println("<totalprice>"+rs1.getFloat("totalprice")+"</totalprice>");
                    out.println("</order>");
                }
                out.println("</orders>");
            }else{
                out.println("<empty>empty</empty>");
            }
            rs1.close();
            st1.close();
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
