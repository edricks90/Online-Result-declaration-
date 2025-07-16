

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class Listfullexam {
    private int id;
    private String rollno;
    private String fullname;

   
    private String Semname;
    private String subid;
    private String semid;
    private String curid;
    private String Curname;
    private String branchid;
    private String Branchname;
    
    private String username;
    private String Fname;
       
    private String subject;

    private int examTime;
    private float mark;
    private String dateexam;

   

   
    /** Creates a new instance of Listfullexam */
    
    
    
    
    
    
    public Listfullexam() {
    }
    public Listfullexam(int id, String rollno, String fullname, String Semname , String subid, String subject, String semid, String curid, String Curname, String branchid, String Branchname, String username, String Fname, int examTime, float mark, String dateexam){
        this.id=id;
        this.rollno=rollno;
        this.fullname=fullname;
        this.Semname=Semname;
        
        this.subid=subid;
        this.semid=semid;
        this.curid=curid;
        this.Curname=Curname;
        this.branchid=branchid;
        this.Branchname=Branchname;
        this.username=username;
        this.Fname=Fname;
        this.subject=subject;
        this.examTime=examTime;
        this.mark=mark;
        this.dateexam=dateexam;
    }
    
    public String getRollno() {
        return rollno;
    }
    
    public void setRollno(String rollno) {
        this.rollno = rollno;
    }
    
    public String getFullname() {
        return fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
     public String getSemname() {
        return Semname;
    }

    public void setSemname(String Semname) {
        this.Semname = Semname;
    }
    
    
    
    
    
    
    
    
    public String getSubid() {
        return subid;
    }
    
    public void setSubid(String subid) {
        this.subid = subid;
    }
    
    public String getSubject() {
        return subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    public int getExamTime() {
        return examTime;
    }
    
    public void setExamTime(int examTime) {
        this.examTime = examTime;
    }
    
    public float getMark() {
        return mark;
    }
    
    public void setMark(float mark) {
        this.mark = mark;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getDateexam() {
        return dateexam;
    }
    
    public void setDateexam(String dateexam) {
        this.dateexam = dateexam;
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

    public String getCurname() {
        return Curname;
    }

    public void setCurname(String Curname) {
        this.Curname = Curname;
    }

    public String getBranchid() {
        return branchid;
    }

    public void setBranchid(String branchid) {
        this.branchid = branchid;
    }

    public String getBranchname() {
        return Branchname;
    }

    public void setBranchname(String Branchname) {
        this.Branchname = Branchname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    
    
}
