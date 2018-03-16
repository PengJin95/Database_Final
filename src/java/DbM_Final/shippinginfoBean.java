package DbM_Final;

import java.io.Serializable;

/**
 *
 * @author chracyc
 */
public class shippinginfoBean extends Object implements Serializable {
    private String fname;
    private String lname;
    private String address;
    private String zipcode;
    private String city;
    private String state;
    private String phone;
    
    public shippinginfoBean(){
        fname = new String();
        lname = new String();
        address = new String();
        zipcode = new String();
        city = new String();
        state = new String();
        phone = new String();
    }
    public String getFname(){
        return fname;
    }
    public void setFname(String value){
        fname = value;
    }
    public String getLname(){
        return lname;
    }
    public void setLname(String value){
        lname = value;
    }
    public String getAddress(){
        return address;
    }
    public void setAddress(String value){
        address = value;
    }
    public String getZipcode(){
        return zipcode;
    }
    public void setZipcode(String value){
        zipcode = value;
    }
    public String getCity(){
        return city;
    }
    public void setCity(String value){
        city = value;
    }
    public String getState(){
        return state;
    }
    public void setState(String value){
        state = value;
    }
    public String getPhone(){
        return phone;
    }
    public void setPhone(String value){
        phone = value;
    }
}
