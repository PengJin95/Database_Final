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
@WebServlet(name = "getTop", urlPatterns = {"/getTop"})
public class getTop extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            Connection conn = MySQLConn.getMySQLConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
            "SELECT Temp1.sid,Temp1.ISBN,b.name,Temp2.sales,b.purl,Temp1.price,Temp1.discount " +
            "FROM (SELECT f1.sid, f1.ISBN, f1.price, f1.discount FROM ForSale f1 LEFT JOIN  ForSale f2 on (f1.price*f1.discount)>(f2.price*f2.discount) AND f1.ISBN = f2.ISBN WHERE f2.price is null) AS Temp1,(SELECT t.ISBN, sum(amount) as sales FROM Transactions t GROUP BY t.ISBN ORDER BY sales DESC LIMIT 12) AS Temp2,Book b " +
            "WHERE Temp1.ISBN = b.ISBN AND Temp1.ISBN = Temp2.ISBN");
            
            out.println("<tops>");
            while(rs.next()){
                out.println("<top>");
                out.println("<sid>"+rs.getString("sid")+"</sid>");
                out.println("<ISBN>"+rs.getString("ISBN")+"</ISBN>");
                out.println("<name>"+rs.getString("name")+"</name>");
                out.println("<price>"+rs.getFloat("price")+"</price>");
                out.println("<dprice>"+rs.getFloat("price")*rs.getFloat("discount")+"</dprice>");
                out.println("<url>"+rs.getString("purl")+"</url>");
                out.println("</top>");
            }
            out.println("</tops>");
            rs.close();
            st.close();
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
