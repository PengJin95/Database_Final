/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

/**
 *
 * @author Yale Chu
 */
public class book {
    private String sid;
    private String ISBN;
    private String name;
    private Float price;
    private Float discount;
    private String category;
    private String purl;
    private String storename;
    private int inventory;
    private String publisher;
    private Date publishdate;
    private String author;
    private String description;
    private String shortdescription;
         
    public book(){
    }
    
    public String getsid(){
        return sid;
    }
    public void setsid(String sid){
        this.sid=sid;        
    }
    
    public String getstorename(){
        return storename;
    }
    public void setstorename(String storename){
        this.storename=storename;        
    }
    
    public String getISBN(){
        return ISBN;
    }
    public void setISBN(String ISBN){
        this.ISBN=ISBN;
    }
    
    public String getname(){
        return name;
    }
    public void setname(String name){
        this.name=name;
    }
    
    public String getcategory(){
        return category;
    }
    public void setcategory(String category){
        this.category=category;
    }    
    
    public String getpurl(){
        return purl;
    }
    public void setpurl(String purl){
        this.purl=purl;
    }
    
    public Float getprice(){
        return price;
    }
    public void setprice(Float price){
        this.price=price;
    }
    
    public Float getdiscount(){
        return discount;
    }
    public void setdiscount(Float discount){
        this.discount=discount;
    }
    
    public int getinventory(){
        return inventory;
    }
    public void setinventory(int inventory){
        this.inventory=inventory;
    }
    
    public String getpublisher(){
        return publisher;
    }
    public void setpublisher(String publisher){
        this.publisher=publisher;
    }
    
    public Date getpublishdate(){
        return publishdate;
    }
    public void setpublishdate(Date publishdate){
        this.publishdate=publishdate;
    }
    
    public String getauthor(){
        return author;
    }
    public void setauthor(String author){
        this.author=author;
    }
    
    public String getdescription(){
        return description;
    }
    public void setdescription(String description){
        this.description=description;
    }
    
    public String getshortdescription(){
        return shortdescription;
    }
    public void setshortdescription(String shortdescription){
        this.shortdescription=shortdescription;
    }
}
