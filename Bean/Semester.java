

package Bean;

/**
 *
 * @author Rakesh Chander
 */
public class Semester {
    private String semid;
    private String curid;
    private String semname;
    
    /** Creates a new instance of Semester */
    public Semester() {
    }
     public Semester(String semid, String curid, String semname) {
         this.semid=semid;
         this.curid=curid;
         this.semname=semname;
    }

    public String getSemid() {
        return semid;
    }

    public void setSemid(String semid) {
        this.semid = semid;
    }

    public String getCurid() {
        return curid;
    }

    public void setCurid(String curid) {
        this.curid = curid;
    }

    public String getSemname() {
        return semname;
    }

    public void setSemname(String semname) {
        this.semname = semname;
    }
    
}
