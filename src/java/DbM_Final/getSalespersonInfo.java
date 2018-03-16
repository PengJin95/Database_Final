package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
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
@WebServlet(name = "getSalespersonInfo", urlPatterns = {"/getSalespersonInfo"})
public class getSalespersonInfo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = MySQLConn.getMySQLConnection();
            HttpSession session = request.getSession(true);

            if (session.getAttribute("alspb") == null) {
                session.setAttribute("alspb", new ArrayList<SalespersonBean>());
            }
            ArrayList<SalespersonBean> alspb = (ArrayList) session.getAttribute("alspb");
            int i;
            for (i = 0; i < alspb.size(); i++) {
                if (alspb.get(i).getISBN().equals(request.getParameter("ISBN")) && alspb.get(i).getSid().equals(request.getParameter("sid"))) {
                    break;
                }
            }
            if (i == alspb.size()) {
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery(
                        "SELECT w.eid "
                        + "FROM WorksIn w "
                        + "WHERE w.sid=" + request.getParameter("sid") + " "
                        + "ORDER BY rand() "
                        + "LIMIT 1");
                SalespersonBean spb = new SalespersonBean();
                session.setAttribute("spb", spb);
                if (rs1.next()) {
                    spb.setSpid(rs1.getString("eid"));
                    spb.setISBN(request.getParameter("ISBN"));
                    spb.setSid(request.getParameter("sid"));
                }
                alspb.add(spb);
                rs1.close();
                st1.close();
            }
                conn.close();
        } catch (SQLException e1) {
            e1.printStackTrace();
        } catch (ClassNotFoundException e2) {
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
