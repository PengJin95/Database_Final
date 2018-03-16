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
@WebServlet(name = "updateShoppingcart", urlPatterns = {"/updateShoppingcart"})
public class updateShoppingcart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        HttpSession session = request.getSession(true);
        ArrayList<shoplistBean> alslb = (ArrayList) session.getAttribute("alslb");
        try (PrintWriter out = response.getWriter()) {
            String update = request.getParameter("update");
            String[] upsl = update.split("_");
            int i,j;
            out.println("<shoplist>");
            for(i=0; i<upsl.length; i++){
                alslb.get(i).setQuantity(Integer.parseInt(upsl[i]));
                out.println("<productinfo>");
                out.println("<ISBN>"+alslb.get(i).getISBN()+"</ISBN>");
                out.println("<name>"+alslb.get(i).getName()+"</name>");
                out.println("<url>"+alslb.get(i).getPicture()+"</url>");
                out.println("<quantity>"+alslb.get(i).getQuantity()+"</quantity>");
                out.println("<dprice>"+alslb.get(i).getDprice()+"</dprice>");
                out.println("<tprice>"+alslb.get(i).getTprice()+"</tprice>");
                out.println("<sid>"+alslb.get(i).getSid()+"</sid>");
                out.println("<inventory>"+alslb.get(i).getInventory()+"</inventory>");
                out.println("</productinfo>");
            }
            out.println("</shoplist>");
            float fprice = 0;
            for(j=0; j<upsl.length; j++){
                fprice = fprice + alslb.get(j).getTprice();
            }
            session.setAttribute("fprice", fprice);
            System.out.println(session.getAttribute("fprice")+"");
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
