package DbM_Final;

import java.io.Serializable;

/**
 *
 * @author chracyc
 */
public class shoplistBean  extends Object implements Serializable{
    private String ISBN;
    private String name;
    private String picture;
    private int quantity;
    private float dprice;
    private String sid;
    private float tprice;
    private int inventory;
    
    public shoplistBean(){
        ISBN = new String();
        name = new String();
        picture = new String();
        quantity = 0;
        dprice = 0;
        tprice = 0;
        inventory = 0;
    }
    public void setISBN(String value){
        ISBN = value;
    }
    public String getISBN(){
        return ISBN;
    }
    public void setName(String value){
        name = value;
    }
    public String getName(){
        return name;
    }
    public void setPicture(String value){
        picture = value;
    }
    public String getPicture(){
        return picture;
    }
    public void setQuantity(int value){
        quantity = value;
    }
    public int getQuantity(){
        return quantity;
    }
    public void setDprice(float value){
        dprice = value;
    }
    public float getDprice(){
        return dprice;
    }
    public void setSid(String value){
        sid = value;
    }
    public String getSid(){
        return sid;
    }
    public void setTprice(float value){
        tprice = value;
    }
    public float getTprice(){
        return tprice;
    }
    public void setInventory(int value){
        inventory = value;
    }
    public int getInventory(){
        return inventory;
    }
}
