/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Rakesh Chander
 */
import java.sql.Date;


public class Notification {
    
    private String noid;
    private String notitle;
    private String noinfo;
    private String nodate;
    
    
    public Notification() {
    }

    public Notification(String noid, String notitle, String noinfo, String nodate) {
        this.noid = noid;
        this.notitle = notitle;
        this.noinfo = noinfo;
        this.nodate = nodate;
    }

    

    public String getNoid() {
        return noid;
    }

    public void setNoid(String noid) {
        this.noid = noid;
    }

    public String getNotitle() {
        return notitle;
    }

    public void setNotitle(String notitle) {
        this.notitle = notitle;
    }

    public String getNoinfo() {
        return noinfo;
    }

    public void setNoinfo(String noinfo) {
        this.noinfo = noinfo;
    }

    public String getNodate() {
        return nodate;
    }

    public void setNodate(String nodate) {
        this.nodate = nodate;
    }
    
    
   
   
    
    
    
    
    
}
