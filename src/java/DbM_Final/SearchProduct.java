/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbM_Final;

import DbM_Final.MySQLConn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.book;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Yale Chu
 */

@WebServlet(urlPatterns = { "/SearchProduct" })
public class SearchProduct  extends HttpServlet {
    public SearchProduct() {
        super();
    } 
    
    protected void processGetBookofCate(HttpServletRequest request, HttpServletResponse response, String cate) throws ServletException, IOException {
        int page = Integer.parseInt((String) request.getParameter("page"));
        Connection conn = null;
        List<book> booklist = new ArrayList<>();
        try {
            conn = MySQLConn.getMySQLConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT b.name, p.price, b.ISBN, b.purl, b.shortdescription, p.discount, p.sid "
                        + "FROM Book b,(SELECT p1.* FROM ForSale p1 LEFT JOIN ForSale p2 ON p1.ISBN = p2.ISBN AND p1.discount < p2.discount LEFT JOIN ForSale p3 ON p1.ISBN = p3.ISBN AND p1.sid < p3.sid WHERE p3.ISBN is null) p " 
                        + "WHERE b.ISBN = p.ISBN AND b.category = '" + cate + "'";
        String order = (String) request.getParameter("order");
        if(order != null) sql += "' ORDER BY p.discount*p.price "+ order;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            while (rs.next()) {
                book books = new book();
                books.setISBN(rs.getString("ISBN"));
                books.setsid(rs.getString("sid"));
                books.setname(rs.getString("name"));
                books.setprice(rs.getFloat("price"));
                books.setdiscount(rs.getFloat("discount"));
                books.setpurl(rs.getString("purl"));
                books.setshortdescription(rs.getString("shortdescription"));
                booklist.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        response.setContentType("text/xml;charset=UTF-8"); 
        out.println("<books>");
        DecimalFormat df = new DecimalFormat("0.00");
        double price1= booklist.get(booklist.size()-1).getprice()*booklist.get(booklist.size()-1).getdiscount();
        double price2= booklist.get(0).getprice()*booklist.get(0).getdiscount();
        if(price1>price2) price2=price1;
        out.println("<hprice>"+df.format(price2)+"</hprice>");  
        float lowprice = -1;
        lowprice =Float.parseFloat((String) request.getParameter("lowprice"));
        float highprice = -1;
        highprice = Float.parseFloat((String) request.getParameter("highprice"));
        for(int i=page*10-10;i<booklist.size()&&i<page*10;i++){ 
            if(lowprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() < lowprice) continue;
            }
            if(highprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() > highprice) continue;
            } 
            out.println("<book>");
            out.println("<ISBN>" + booklist.get(i).getISBN() + "</ISBN>");
            out.println("<sid>" + booklist.get(i).getsid() + "</sid>");
            out.println("<name>" + booklist.get(i).getname() + "</name>");
            out.println("<price>" + df.format(booklist.get(i).getprice()) + "</price>");
            out.println("<dprice>" + df.format(booklist.get(i).getprice()*booklist.get(i).getdiscount()) + "</dprice>");
            out.println("<url>" + booklist.get(i).getpurl() + "</url>");
            out.println("<description>" + booklist.get(i).getshortdescription() + "</description>");
            out.println("</book>");
        }
        int tpage=booklist.size()/10+ (booklist.size() % 10 != 0?1:0);
        out.println("<page>" + page + "</page>");        
        out.println("<tpage>" + tpage + "</tpage>"); 
    }
    
    protected void processGetBookofName(HttpServletRequest request, HttpServletResponse response, String name) throws ServletException, IOException {
        int page = Integer.parseInt((String) request.getParameter("page"));
        Connection conn = null;
        List<book> booklist = new ArrayList<>();
        try {
            conn = MySQLConn.getMySQLConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT b.name, p.price, b.ISBN, b.purl, b.shortdescription, p.discount, p.sid "
                        + "FROM Book b,(SELECT p1.* FROM ForSale p1 LEFT JOIN ForSale p2 ON p1.ISBN = p2.ISBN AND p1.discount < p2.discount LEFT JOIN ForSale p3 ON p1.ISBN = p3.ISBN AND p1.sid < p3.sid WHERE p3.ISBN is null) p " 
                        + "WHERE b.ISBN = p.ISBN AND b.name LIKE '%" + name + "%'";
        String order = (String) request.getParameter("order");
        if(order != null) sql += " ORDER BY p.discount*p.price "+ order;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            while (rs.next()) {
                book books = new book();
                books.setISBN(rs.getString("ISBN"));
                books.setsid(rs.getString("sid"));
                books.setname(rs.getString("name"));
                books.setprice(rs.getFloat("price"));
                books.setdiscount(rs.getFloat("discount"));
                books.setpurl(rs.getString("purl"));
                books.setshortdescription(rs.getString("shortdescription"));
                booklist.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            if(conn == null) System.out.println("conn null!");
        }
        String[] namepart = name.trim().split("\\s+");
        if(namepart.length>1){
            String sqlpart = "(";
            for(int i=0;i<namepart.length;i++){
                if(i>0) sqlpart+=" OR ";
                sqlpart += "b.name REGEXP '[[:<:]]" + namepart[i] + "[[:>:]]'";
            }
            sqlpart += ")";
            sql = "SELECT b.name, p.price, b.ISBN, b.purl, b.shortdescription, p.discount, p.sid "
                            + "FROM Book b,(SELECT p1.* FROM ForSale p1 LEFT JOIN ForSale p2 ON p1.ISBN = p2.ISBN AND p1.discount < p2.discount LEFT JOIN ForSale p3 ON p1.ISBN = p3.ISBN AND p1.sid < p3.sid WHERE p3.ISBN is null) p " 
                            + "WHERE b.ISBN = p.ISBN AND b.name NOT LIKE '%" + name + "%' AND " + sqlpart;
            if(order != null) sql += " ORDER BY p.discount*p.price "+ order;
            try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql); 
                while (rs.next()) {
                    book books = new book();
                    books.setISBN(rs.getString("ISBN"));
                    books.setsid(rs.getString("sid"));
                    books.setname(rs.getString("name"));
                    books.setprice(rs.getFloat("price"));
                    books.setdiscount(rs.getFloat("discount"));
                    books.setpurl(rs.getString("purl"));
                    books.setshortdescription(rs.getString("shortdescription"));
                    booklist.add(books);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                if(conn == null) System.out.println("conn null!");
            }
        }
        PrintWriter out = response.getWriter();
        response.setContentType("text/xml;charset=UTF-8");
        out.println("<books>");
        DecimalFormat df = new DecimalFormat("0.00");
        double price1= booklist.get(booklist.size()-1).getprice()*booklist.get(booklist.size()-1).getdiscount();
        double price2= booklist.get(0).getprice()*booklist.get(0).getdiscount();
        if(price1>price2) price2=price1;
        out.println("<hprice>"+df.format(price2)+"</hprice>");   
        float lowprice = -1;
        lowprice =Float.parseFloat((String) request.getParameter("lowprice"));
        float highprice = -1;
        highprice = Float.parseFloat((String) request.getParameter("highprice"));
        for(int i=page*10-10;i<booklist.size()&&i<page*10;i++){ 
            if(lowprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() < lowprice) continue;
            }
            if(highprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() > highprice) continue;
            }
            out.println("<book>");
            out.println("<ISBN>" + booklist.get(i).getISBN() + "</ISBN>");
            out.println("<sid>" + booklist.get(i).getsid() + "</sid>");
            out.println("<name>" + booklist.get(i).getname() + "</name>");
            out.println("<price>" + df.format(booklist.get(i).getprice()) + "</price>");
            out.println("<dprice>" + df.format(booklist.get(i).getprice()*booklist.get(i).getdiscount()) + "</dprice>");
            out.println("<url>" + booklist.get(i).getpurl() + "</url>");
            out.println("<description>" + booklist.get(i).getshortdescription() + "</description>");
            out.println("</book>");
        }
        int tpage=booklist.size()/10+ (booklist.size() % 10 != 0?1:0);
        out.println("<page>" + page + "</page>");        
        out.println("<tpage>" + tpage + "</tpage>"); 
    }
    
    protected void processGetBookofCateandName(HttpServletRequest request, HttpServletResponse response, String cate, String name) throws ServletException, IOException {        
        int page = Integer.parseInt((String) request.getParameter("page"));
        Connection conn = null;
        List<book> booklist = new ArrayList<>();
        try {
            conn = MySQLConn.getMySQLConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        PrintWriter out = response.getWriter();
        response.setContentType("text/xml;charset=UTF-8");   
        String sql = "SELECT b.name, p.price, b.ISBN, b.purl, b.shortdescription, p.discount, p.sid "
                        + "FROM Book b,(SELECT p1.* FROM ForSale p1 LEFT JOIN ForSale p2 ON p1.ISBN = p2.ISBN AND p1.discount < p2.discount LEFT JOIN ForSale p3 ON p1.ISBN = p3.ISBN AND p1.sid < p3.sid WHERE p3.ISBN is null) p " 
                        + "WHERE b.ISBN = p.ISBN AND b.category = '" + cate + "' AND b.name LIKE '%" + name + "%'";
        String order = (String) request.getParameter("order");
        if(order != null) sql += " ORDER BY p.discount*p.price "+ order;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            while (rs.next()) {
                book books = new book();
                books.setISBN(rs.getString("ISBN"));
                books.setsid(rs.getString("sid"));
                books.setname(rs.getString("name"));
                books.setprice(rs.getFloat("price"));
                books.setdiscount(rs.getFloat("discount"));
                books.setpurl(rs.getString("purl"));
                books.setshortdescription(rs.getString("shortdescription"));
                booklist.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }     
        String[] namepart = name.trim().split("\\s+");
        if(namepart.length>1){
            String sqlpart = "(";
            for(int i=0;i<namepart.length;i++){
                if(i>0) sqlpart+=" OR ";
                sqlpart += "b.name REGEXP '[[:<:]]" + namepart[i] + "[[:>:]]'";
            }
            sqlpart += ")";
            sql = "SELECT b.name, p.price, b.ISBN, b.purl, b.shortdescription, p.discount, p.sid "
                    + "FROM Book b,(SELECT p1.* FROM ForSale p1 LEFT JOIN ForSale p2 ON p1.ISBN = p2.ISBN AND p1.discount < p2.discount LEFT JOIN ForSale p3 ON p1.ISBN = p3.ISBN AND p1.sid < p3.sid WHERE p3.ISBN is null) p " 
                    + "WHERE b.ISBN = p.ISBN AND b.category = '" + cate + "' AND b.name NOT LIKE '%" + name + "%' AND " + sqlpart;
            if(order != null) sql += " ORDER BY p.discount*p.price "+ order;
            try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql); 
                while (rs.next()) {
                    book books = new book();
                    books.setISBN(rs.getString("ISBN"));
                    books.setsid(rs.getString("sid"));
                    books.setname(rs.getString("name"));
                    books.setprice(rs.getFloat("price"));
                    books.setdiscount(rs.getFloat("discount"));
                    books.setpurl(rs.getString("purl"));
                    books.setshortdescription(rs.getString("shortdescription"));
                    booklist.add(books);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        out.println("<books>");
        DecimalFormat df = new DecimalFormat("0.00");
        double price1= booklist.get(booklist.size()-1).getprice()*booklist.get(booklist.size()-1).getdiscount();
        double price2= booklist.get(0).getprice()*booklist.get(0).getdiscount();
        if(price1>price2) price2=price1;
        out.println("<hprice>"+df.format(price2)+"</hprice>");  
        float lowprice = -1;
        lowprice =Float.parseFloat((String) request.getParameter("lowprice"));
        float highprice = -1;
        highprice = Float.parseFloat((String) request.getParameter("highprice"));
        for(int i=page*10-10;i<booklist.size()&&i<page*10;i++){ 
            if(lowprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() < lowprice) continue;
            }
            if(highprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() > highprice) continue;
            }
            out.println("<book>");
            out.println("<ISBN>" + booklist.get(i).getISBN() + "</ISBN>");
            out.println("<sid>" + booklist.get(i).getsid() + "</sid>");
            out.println("<name>" + booklist.get(i).getname() + "</name>");
            out.println("<price>" + df.format(booklist.get(i).getprice()) + "</price>");
            out.println("<dprice>" + df.format(booklist.get(i).getprice()*booklist.get(i).getdiscount()) + "</dprice>");
            out.println("<url>" + booklist.get(i).getpurl() + "</url>");
            out.println("<description>" + booklist.get(i).getshortdescription() + "</description>");
            out.println("</book>");
        }
        int tpage=booklist.size()/10+ (booklist.size() % 10 != 0?1:0);
        out.println("<page>" + page + "</page>");        
        out.println("<tpage>" + tpage + "</tpage>"); 
    }
    
    protected void processGetBookofISBN(HttpServletRequest request, HttpServletResponse response, String isbn) throws ServletException, IOException {
        Connection conn = null;
        List<book> booklist = new ArrayList<>();
        try {
            conn = MySQLConn.getMySQLConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT * FROM Book b,ForSale p WHERE b.ISBN = p.ISBN AND b.ISBN = " + isbn +" ORDER BY p.price*p.discount LIMIT 1";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            if (rs.next()) {
                book books = new book();
                books.setISBN(isbn);
                String sid = rs.getString("sid");
                books.setsid(sid);
                books.setprice(rs.getFloat("price"));
                books.setname(rs.getString("name"));
                books.setdiscount(rs.getFloat("discount"));
                ResultSet rst=st.executeQuery("SELECT name FROM Store WHERE sid = '" + sid +"'");
                rst.next();
                books.setstorename(rst.getString("name"));
                booklist.add(books);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        response.setContentType("text/xml;charset=UTF-8");
        out.println("<books>");
        DecimalFormat df = new DecimalFormat("0.00");
        double price1= booklist.get(booklist.size()-1).getprice()*booklist.get(booklist.size()-1).getdiscount();
        double price2= booklist.get(0).getprice()*booklist.get(0).getdiscount();
        if(price1>price2) price2=price1;
        out.println("<hprice>"+df.format(price2)+"</hprice>");  
        float lowprice = -1;
        lowprice =Float.parseFloat((String) request.getParameter("lowprice"));
        float highprice = -1;
        highprice = Float.parseFloat((String) request.getParameter("highprice"));
        for(int i=0;i<booklist.size();i++){ 
            if(lowprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() < lowprice) continue;
            }
            if(highprice > 0){
                if(booklist.get(i).getprice()*booklist.get(i).getdiscount() > highprice) continue;
            }
            out.println("<book>");
            out.println("<ISBN>" + booklist.get(i).getISBN() + "</ISBN>");
            out.println("<sid>" + booklist.get(i).getsid() + "</sid>");
            out.println("<name>" + booklist.get(i).getname() + "</name>");
            out.println("<price>" + df.format(booklist.get(i).getprice()) + "</price>");
            out.println("<dprice>" + df.format(booklist.get(i).getprice()*booklist.get(i).getdiscount()) + "</dprice>");
            out.println("<storename>" + booklist.get(i).getstorename() + "</storename>");
            out.println("</book>");
        } 
    }
    
    protected void processGetCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        List<String> catelist = new ArrayList<>();
        try {
            conn = MySQLConn.getMySQLConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "SELECT DISTINCT category FROM Book";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql); 
            while (rs.next()) {
                String cate = rs.getString("category");
                catelist.add(cate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = response.getWriter();
        response.setContentType("text/xml;charset=UTF-8");
        out.println("<categories>");
        for(int i=0;i<catelist.size();i++){
            out.println("<category>"+ catelist.get(i) +"</category>");
        }
        out.println("</categories>");
        out.println("</books>");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        int ki = 0;
        String cate = (String) request.getParameter("category");
        String name = (String) request.getParameter("name");
        String isbn = (String) request.getParameter("ISBN");
        if(cate != null && cate.length() != 0) ki+=1;
        if(name != null && name.length() != 0) ki+=2;
        if(isbn != null && isbn.length() != 0) ki+=4;
        if(ki == 1) processGetBookofCate(request,response,cate);
        if(ki == 2) processGetBookofName(request,response,name);
        if(ki == 3) processGetBookofCateandName(request,response,cate,name);
        if(ki == 4) processGetBookofISBN(request,response,isbn);
        if(ki != 0) processGetCate(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }        
}
