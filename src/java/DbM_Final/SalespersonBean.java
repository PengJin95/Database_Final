package DbM_Final;

import java.io.Serializable;

/**
 *
 * @author chracyc
 */
public class SalespersonBean extends Object implements Serializable{
    private String ISBN;
    private String sid;
    private String spid;
    
    public SalespersonBean(){
        spid = new String();
        sid = new String();
        ISBN = new String();
    }
    public String getSpid(){
        return spid;
    }
    public void setSpid(String value){
        spid = value;
    }
    public String getSid(){
        return sid;
    }
    public void setSid(String value){
        sid = value;
    }
    public String getISBN(){
        return ISBN;
    }
    public void setISBN(String value){
        ISBN = value;
    }
}
