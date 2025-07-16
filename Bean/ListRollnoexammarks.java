

package Bean;

import java.sql.Date;

/**
 *
 * @author Rakesh Chander
 */
public class ListRollnoexammarks {
    private String rollno;
    private String fullname;
    private String subject;
    private int examTime;
    private float mark;
    private String dateexam;
    /** Creates a new instance of ListRollnoexammarks */
    public ListRollnoexammarks() {
    }
    public ListRollnoexammarks(String rollno, String fullname, String subject, int examtime, float mark, String dateexam) {
        this.rollno=rollno;
        this.fullname=fullname;
        this.subject=subject;
        this.examTime=examtime;
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

    public String getDateexam() {
        return dateexam;
    }

    public void setDateexam(String dateexam) {
        this.dateexam = dateexam;
    }
    
}
