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
@WebServlet(name = "viewOrderdetail", urlPatterns = {"/viewOrderdetail"})
public class viewOrderdetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection conn = MySQLConn.getMySQLConnection();
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(
            "SELECT t.ISBN,b.name,t.amount,t.price,t.status " +
            "FROM Book b,Transactions t " +
            "WHERE t.ISBN=b.ISBN AND t.oid=" + request.getParameter("oid"));
            
            Statement st2 = conn.createStatement();
            ResultSet rs2 = st2.executeQuery(
            "SELECT oi.firstname,oi.lastname,oi.address,oi.city,oi.zipcode,oi.state,oi.phone " +
            "FROM OrderInfo oi,Orders o " +
            "WHERE o.billid = oi.infoid AND o.oid=" + request.getParameter("oid"));
            
            Statement st3 = conn.createStatement();
            ResultSet rs3 = st3.executeQuery(
            "SELECT oi.firstname,oi.lastname,oi.address,oi.city,oi.zipcode,oi.state,oi.phone " +
            "FROM OrderInfo oi,Orders o " +
            "WHERE o.shipid = oi.infoid AND o.oid=" + request.getParameter("oid"));
            
            out.println("<transactions>");
            while(rs1.next()){
                out.println("<transaction>");
                out.println("<name>"+rs1.getString("name")+"</name>");
                out.println("<ISBN>"+rs1.getString("ISBN")+"</ISBN>");
                out.println("<quantity>"+rs1.getInt("amount")+"</quantity>");
                out.println("<price>"+rs1.getFloat("price")+"</price>");
                out.println("<tprice>"+rs1.getFloat("price")*rs1.getInt("amount")+"</tprice>");
                out.println("<status>"+rs1.getString("status")+"</status>");
                out.println("</transaction>");
            }
            out.println("<customerinfo>");
            if(rs2.next()){
                out.println("<billinginfo>");
                out.println("<bfname>"+rs2.getString("firstname")+"</bfname>");
                out.println("<blname>"+rs2.getString("lastname")+"</blname>");
                out.println("<baddress>"+rs2.getString("address")+"</baddress>");
                out.println("<bcity>"+rs2.getString("city")+"</bcity>");
                out.println("<bzipcode>"+rs2.getString("zipcode")+"</bzipcode>");
                out.println("<bstate>"+rs2.getString("state")+"</bstate>");
                out.println("<bphone>"+rs2.getString("phone")+"</bphone>");
                out.println("</billinginfo>");
            }
            if(rs3.next()){
                out.println("<shippinginfo>");
                out.println("<sfname>"+rs3.getString("firstname")+"</sfname>");
                out.println("<slname>"+rs3.getString("lastname")+"</slname>");
                out.println("<saddress>"+rs3.getString("address")+"</saddress>");
                out.println("<scity>"+rs3.getString("city")+"</scity>");
                out.println("<szipcode>"+rs3.getString("zipcode")+"</szipcode>");
                out.println("<sstate>"+rs3.getString("state")+"</sstate>");
                out.println("<sphone>"+rs3.getString("phone")+"</sphone>");
                out.println("</shippinginfo>");
            }
            out.println("</customerinfo>");
            out.println("</transactions>");
            rs1.close();
            st1.close();
            rs2.close();
            st2.close();
            rs3.close();
            st3.close();
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
