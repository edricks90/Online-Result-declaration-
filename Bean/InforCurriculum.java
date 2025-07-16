

package Bean;

/**
 *
 * @author Rakesh Chander
 */
public class InforCurriculum {
    private String curid;
    private String curname;
    private String period;
    private int fee;
    private String semname;
    /** Creates a new instance of InforCurriculum */
    public InforCurriculum() {
    }
    public InforCurriculum(String curid, String curname, String period, int fee, String semname) {
        this.curid=curid;
        this.curname=curname;
        this.period=period;
        this.fee=fee;
        this.semname=semname;
    }
    public String getCurid() {
        return curid;
    }

    public void setCurid(String curid) {
        this.curid = curid;
    }

    public String getCurname() {
        return curname;
    }

    public void setCurname(String curname) {
        this.curname = curname;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getSemname() {
        return semname;
    }

    public void setSemname(String semname) {
        this.semname = semname;
    }
    
}
