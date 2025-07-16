

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class Listfullschedule {
    private String schename;
    private String semname;
    private String subname;
    private String startdate;
    private String enddate;
    private String dateexam;
    private int fee;
    
    /** Creates a new instance of Listfullschedule */
    public Listfullschedule() {
    }
    public Listfullschedule(String schename, String semname, String subname, String startdate, String enddate, String dateexam, int fee) {
        this.schename=schename;
        this.semname=semname;
        this.subname=subname;
        this.startdate=startdate;
        this.enddate=enddate;
        this.dateexam=dateexam;
        this.fee=fee;
    }
    public String getSchename() {
        return schename;
    }

    public void setSchename(String schename) {
        this.schename = schename;
    }

    public String getSemname() {
        return semname;
    }

    public void setSemname(String semname) {
        this.semname = semname;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
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

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getDateexam() {
        return dateexam;
    }

    public void setDateexam(String dateexam) {
        this.dateexam = dateexam;
    }
    
}
