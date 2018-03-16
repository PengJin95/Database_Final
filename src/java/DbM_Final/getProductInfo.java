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
@WebServlet(name = "getProductInfo", urlPatterns = {"/getProductInfo"})
public class getProductInfo extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            Connection conn = MySQLConn.getMySQLConnection();
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(
            "SELECT b.ISBN,b.name,f.price,f.discount,b.purl,b.publisher,b.publishdate,b.category,b.description,b.format,b.language,b.version,s.sid,s.name as sname,s.address,s.city,s.zipcode,s.state,r.name as rname,f.inventory " +
            "FROM Book b,Store s,ForSale f,Region r " +
            "WHERE b.ISBN=f.ISBN AND f.sid=s.sid AND r.rid=s.rid " +
            "AND s.sid=" + request.getParameter("sid") + " AND b.ISBN=" + request.getParameter("ISBN"));
            Statement st3 = conn.createStatement();
            ResultSet rs3 = st3.executeQuery(
            "SELECT a.name " +
            "FROM Author a,Writes w,Book b,ForSale f " +
            "WHERE b.ISBN=w.ISBN AND w.aid=a.aid AND f.ISBN=b.ISBN AND " +
            "b.ISBN=" + request.getParameter("ISBN") + " AND f.sid=" + request.getParameter("sid"));
            Statement st2 = conn.createStatement();
            ResultSet rs2 = st2.executeQuery(
            "SELECT s.sid,s.name,f.discount,f.price " +
            "FROM Store s,ForSale f,Book b " +
            "WHERE s.sid<>" + request.getParameter("sid") + " AND f.ISBN =" + request.getParameter("ISBN") + " AND f.sid=s.sid AND f.ISBN=b.ISBN " +
            "ORDER BY Rand() " +
            "LIMIT 10");
            
            out.println("<productinfo>");
            out.println("<bookinfo>");
            if(rs1.next()){
                out.println("<ISBN>"+rs1.getString("ISBN")+"</ISBN>");
                out.println("<name>"+rs1.getString("name")+"</name>");
                out.println("<price>"+rs1.getFloat("price")+"</price>");
                out.println("<dprice>"+rs1.getFloat("price")*rs1.getFloat("discount")+"</dprice>");
                out.println("<url>"+rs1.getString("purl")+"</url>");
                out.println("<publisher>"+rs1.getString("publisher")+"</publisher>");
                out.println("<publishdate>"+rs1.getString("publishdate")+"</publishdate>");
                out.println("<category>"+rs1.getString("category")+"</category>");
                out.println("<format>"+rs1.getString("format")+"</format>");
                out.println("<language>"+rs1.getString("language")+"</language>");
                out.println("<version>"+rs1.getString("version")+"</version>");
                out.println("<description>"+rs1.getString("description")+"</description>");
                out.println("<sid>"+rs1.getString("sid")+"</sid>");
                out.println("<sname>"+rs1.getString("sname")+"</sname>");
                out.println("<address>"+rs1.getString("address")+"</address>");
                out.println("<city>"+rs1.getString("city")+"</city>");
                out.println("<zipcode>"+rs1.getString("zipcode")+"</zipcode>");
                out.println("<state>"+rs1.getString("state")+"</state>");
                out.println("<rname>"+rs1.getString("rname")+"</rname>");
                out.println("<inventory>"+rs1.getInt("inventory")+"</inventory>");
            }
            out.println("<authors>");
            while(rs3.next()){
                out.println("<author>"+rs3.getString("name")+"</author>");
            }
            out.println("</authors>");
            out.println("</bookinfo>");
            rs3.close();
            st3.close();
            rs1.close();
            st1.close();
            out.println("<storelist>");
            while(rs2.next()){
                out.println("<storeinfo>");
                out.println("<sid>"+rs2.getString("sid")+"</sid>");
                out.println("<sname>"+rs2.getString("name")+"</sname>");
                out.println("<dprice>"+rs2.getFloat("price")*rs2.getFloat("discount")+"</dprice>");
                out.println("</storeinfo>");
            }
            out.println("</storelist>");
            out.println("</productinfo>");
            rs2.close();
            st2.close();
            conn.close();
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
