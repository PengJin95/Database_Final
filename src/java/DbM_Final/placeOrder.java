package DbM_Final;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 *
 * @author chracyc
 */
@WebServlet(name = "placeOrder", urlPatterns = {"/placeOrder"})
public class placeOrder extends HttpServlet {
    Connection conn = null;
    
    private String getOrderInfoID(String firstname, String lastname, String email, String address, String zipcode, String city, String state, String phone) {
        String id = "";
        try {
            PreparedStatement st1 = conn.prepareStatement(
                    "SELECT infoid FROM OrderInfo WHERE firstname=? AND lastname=? AND email=? AND address=? AND zipcode=? AND city=? AND state=? AND phone=?");
            st1.setString(1, firstname);
            st1.setString(2, lastname);
            st1.setString(3, email);
            st1.setString(4, address);
            st1.setString(5, zipcode);
            st1.setString(6, city);
            st1.setString(7, state);
            st1.setString(8, phone);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                id = rs1.getString(1);
            } else {
                PreparedStatement st2 = conn.prepareStatement(
                        "INSERT INTO OrderInfo (firstname,lastname,email,address,zipcode,city,state,phone) VALUES (?,?,?,?,?,?,?,?)");
                st2.setString(1, firstname);
                st2.setString(2, lastname);
                st2.setString(3, email);
                st2.setString(4, address);
                st2.setString(5, zipcode);
                st2.setString(6, city);
                st2.setString(7, state);
                st2.setString(8, phone);
                st2.executeUpdate();
                st2.close();
                PreparedStatement st3 = conn.prepareStatement(
                        "SELECT infoid FROM OrderInfo WHERE firstname=? AND lastname=? AND email=? AND address=? AND zipcode=? AND city=? AND state=? AND phone=?");
                st3.setString(1, firstname);
                st3.setString(2, lastname);
                st3.setString(3, email);
                st3.setString(4, address);
                st3.setString(5, zipcode);
                st3.setString(6, city);
                st3.setString(7, state);
                st3.setString(8, phone);
                ResultSet rs3 = st3.executeQuery();
                if(rs3.next()){
                    id = rs3.getString(1);
                }
                rs3.close();
                st3.close();
            }
            rs1.close();
            st1.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            conn = MySQLConn.getMySQLConnection();
            HttpSession session = request.getSession(true);
            
            String payid = "";
            PreparedStatement st4 = conn.prepareStatement(
                    "INSERT INTO PaymentInfo (name,type,number,expiremonth,expireyear,cvv2) VALUES (?,?,?,?,?,?)");
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String number = request.getParameter("number");
            String expiremonth = request.getParameter("expiremonth");
            String expireyear = request.getParameter("expireyear");
            String cvv2 = request.getParameter("cvv2");
            st4.setString(1, name);
            st4.setString(2, type);
            st4.setString(3, number);
            st4.setString(4, expiremonth);
            st4.setString(5, expireyear);
            st4.setString(6, cvv2);
            st4.executeUpdate();
            st4.close();
            PreparedStatement st5 = conn.prepareStatement(
                    "SELECT payid FROM PaymentInfo WHERE name=? AND type=? AND number=? AND expiremonth=? AND expireyear=? AND cvv2=?");
            st5.setString(1, name);
            st5.setString(2, type);
            st5.setString(3, number);
            st5.setString(4, expiremonth);
            st5.setString(5, expireyear);
            st5.setString(6, cvv2);
            ResultSet rs5 = st5.executeQuery();
            if(rs5.next()){
                payid = rs5.getString(1);
            }
            rs5.close();
            st5.close();

            String oid = "";
            PreparedStatement st6 = conn.prepareStatement(
                    "INSERT INTO Orders (billid,shipid,payid,cid,time,totalprice) VALUES (?,?,?,?,?,?)");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String zipcode = request.getParameter("zipcode");
            String state = request.getParameter("state");
            String phone = request.getParameter("phone");
            String firstname_b = request.getParameter("firstname_b");
            String lastname_b = request.getParameter("lastname_b");
            String email_b = request.getParameter("email_b");
            String address_b = request.getParameter("address_b");
            String city_b = request.getParameter("city_b");
            String zipcode_b = request.getParameter("zipcode_b");
            String state_b = request.getParameter("state_b");
            String phone_b = request.getParameter("phone_b");
            String billid = getOrderInfoID(firstname_b,lastname_b,email_b,address_b,zipcode_b,city_b,state_b,phone_b);
            String shipid = getOrderInfoID(firstname,lastname,email,address,zipcode,city,state,phone);
            String cid = String.valueOf(session.getAttribute("cid"));
            Date otime = new Date();
            java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
            String totalprice = String.valueOf(session.getAttribute("fprice"));
            st6.setString(1, billid);
            st6.setString(2, shipid);
            st6.setString(3, payid);
            st6.setString(4, cid);
            st6.setString(5, df.format(otime));
            st6.setString(6, totalprice);
            st6.executeUpdate();
            st6.close();
            PreparedStatement st7 = conn.prepareStatement(
                    "SELECT oid FROM Orders WHERE billid=? AND shipid=? AND payid=? AND cid=? AND time=?");
            st7.setString(1, billid);
            st7.setString(2, shipid);
            st7.setString(3, payid);
            st7.setString(4, cid);
            st7.setString(5, df.format(otime));
            ResultSet rs7 = st7.executeQuery();
            if(rs7.next()){
                oid = rs7.getString(1);
            }
            rs7.close();
            st7.close();
            
            PreparedStatement st8 = conn.prepareStatement(
                    "INSERT INTO Transactions (amount,price,time,ISBN,cid,eid,sid,status,oid) VALUES (?,?,?,?,?,?,?,?,?)");
            ArrayList<shoplistBean> alslb = (ArrayList) session.getAttribute("alslb");
            ArrayList<SalespersonBean> alspb = (ArrayList) session.getAttribute("alspb");
            System.out.println(alspb.get(0).getSpid());
            int i, j;
            for (i = 0; i < alslb.size(); i++) {
                int amount = alslb.get(i).getQuantity();
                float price = alslb.get(i).getDprice();
                String ISBN = alslb.get(i).getISBN();
                String sid = alslb.get(i).getSid();
                String spid = "";
                for (j = 0; j < alspb.size(); j++) {
                    if (ISBN.equals(alspb.get(j).getISBN()) && sid.equals(alspb.get(j).getSid())) {
                        spid = alspb.get(j).getSpid();
                    }
                }
                Date ttime = new Date();
                st8.setInt(1, amount);
                st8.setFloat(2, price);
                st8.setString(3, df.format(ttime));
                st8.setString(4, ISBN);
                st8.setString(5, cid);
                st8.setString(6, spid);
                st8.setString(7, sid);
                st8.setString(8, "Processing");
                st8.setString(9, oid);
                st8.executeUpdate();
                st8.close();
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
