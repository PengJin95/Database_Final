package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "writeMessage", urlPatterns = {"/writeMessage"})
public class writeMessage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            Connection conn = MySQLConn.getMySQLConnection();
            HttpSession session = request.getSession(true);
            SalespersonBean spb = (SalespersonBean) session.getAttribute("spb");
            PreparedStatement st = conn.prepareStatement("INSERT INTO message (cid,eid,ISBN,content,time) VALUES (?,?,?,?,?)");
            String cid = String.valueOf(session.getAttribute("cid"));
            String spid = spb.getSpid();
            String ISBN = request.getParameter("ISBN");
            String content = request.getParameter("content");
            Date mtime = new Date();
            java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
            st.setString(1, cid);
            st.setString(2, spid);
            st.setString(3, ISBN);
            st.setString(4, content);
            st.setString(5, df.format(mtime));
            int result = 0;
            result = st.executeUpdate();
            out.println("<result>"+result+"</result>");
            st.close();
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
