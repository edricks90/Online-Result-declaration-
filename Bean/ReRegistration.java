

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class ReRegistration {
    private String regid;
    private String rollno;
    private String scheid;
    private String status;
    private String date;
    
    /** Creates a new instance of ReRegistration */
    public ReRegistration() {
    }
    public ReRegistration(String regid,String rollno,String scheid,String status,String date) {
        this.regid=regid;
        this.rollno=rollno;
        this.scheid=scheid;
        this.status=status;
        this.date=date;
    }

    public String getRegid() {
        return regid;
    }

    public void setRegid(String regid) {
        this.regid = regid;
    }

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getScheid() {
        return scheid;
    }

    public void setScheid(String scheid) {
        this.scheid = scheid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
