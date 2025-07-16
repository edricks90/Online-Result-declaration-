

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class Schedules {
    private String scheid;
    private String subid;
    private String schename;
    private int fee;
    private String startdate;
    private String enddate;
    private String dateexam;
    
    /** Creates a new instance of Schedules */
    public Schedules() {
    }
    public Schedules(String scheid,String subid,String schename,int fee,String startdate,String enddate,String dateexam) {
        this.scheid=scheid;
        this.subid=subid;
        this.schename=schename;
        this.fee=fee;
        this.startdate=startdate;
        this.enddate=enddate;
        this.dateexam=dateexam;
    }
    

    public String getScheid() {
        return scheid;
    }

    public void setScheid(String scheid) {
        this.scheid = scheid;
    }

    public String getSubid() {
        return subid;
    }

    public void setSubid(String subid) {
        this.subid = subid;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getDateexam() {
        return dateexam;
    }

    public void setDateexam(String dateexam) {
        this.dateexam = dateexam;
    }

    public String getSchename() {
        return schename;
    }

    public void setSchename(String schename) {
        this.schename = schename;
    }
    
}
