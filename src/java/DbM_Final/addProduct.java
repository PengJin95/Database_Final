package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        if(session.getAttribute("alslb") == null){
            session.setAttribute("alslb",new ArrayList<shoplistBean>());
        }
        ArrayList<shoplistBean> alslb = (ArrayList) session.getAttribute("alslb");
        int i;
        for (i = 0; i < alslb.size(); i++) {
            if (alslb.get(i).getISBN().equals(request.getParameter("ISBN")) && alslb.get(i).getSid().equals(request.getParameter("sid"))) {
                alslb.get(i).setQuantity(alslb.get(i).getQuantity()+Integer.parseInt(request.getParameter("quantity")));
                break;
            }
        }
        if (i == alslb.size()) {
            shoplistBean slb = new shoplistBean();
            slb.setISBN(request.getParameter("ISBN"));
            slb.setName(request.getParameter("name"));
            slb.setPicture(request.getParameter("purl"));
            slb.setDprice(Float.parseFloat(request.getParameter("dprice")));
            slb.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            slb.setTprice(slb.getDprice()*slb.getQuantity());
            slb.setSid(request.getParameter("sid"));
            slb.setInventory(Integer.parseInt(request.getParameter("inventory")));
            alslb.add(slb);
            out.println("<success>1</success>");
            System.out.println(slb.getTprice());
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
