

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class ExamMark {
    
    private int id;
    private String rollno;
    private String subid;
    private String semid;
    private String curid;
    private String branchid;
    private String username;
    private int examTime;
    private float mark;
    private String dateexam;

   

    

   
    
  
    
    
    public ExamMark(){
        
    }
    public ExamMark(int id, String rollno,String subid, String semid, String curid, String branchid,String username, int examTime,float mark, String dateexam)
    {
        this.id=id;
        this.rollno=rollno;
        this.subid=subid;
        this.semid=semid;
        this.curid = curid;
        this.branchid=branchid;
        this.username=username;
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

    public String getSubid() {
        return subid;
    }

    public void setSubid(String subid) {
        this.subid = subid;
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

    public String getBranchid() {
        return branchid;
    }

    public void setBranchid(String branchid) {
        this.branchid = branchid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
   
}

    