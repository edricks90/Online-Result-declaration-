
package Bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

public class ExamMarkBean {
    Collection listEXam;
    private Collection listfull;
    private Collection selectExamdropdowlist;
    private Collection selectExamtxt;
    private Collection searchmarks;
    private Collection listMark;
    public ExamMarkBean() {
    }
    public Collection getListExamMark() {
        listEXam =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Select ID, Rollno, SubID, SemID, CurID, BranchId, BranchId, UserName, ExamTimes, Marks, convert(varchar, DateExam, 101) as DateExam from ExamMark";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ExamMark exam=new ExamMark();
                exam.setId(rs.getInt("ID"));
                exam.setRollno(rs.getString("Rollno"));
                exam.setSubid(rs.getString("SubID"));
                exam.setSemid(rs.getString("SemID"));
                exam.setCurid(rs.getString("CurID"));
                exam.setBranchid(rs.getString("BranchId"));
                exam.setUsername(rs.getString("UserName"));
                exam.setExamTime(rs.getInt("ExamTimes"));
                exam.setMark(rs.getFloat("Marks"));
                exam.setDateexam(rs.getString("DateExam"));
                listEXam.add(exam);
            }
            rs.close();
            con.close();
            return listEXam;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public Collection getListfull() {
        listfull =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select   b.Rollno, stName,  d.SemID, SemName, e.CurID, CurName, f.BranchId, BranchName, g.UserName, FullName, c.SubID, SubName, ExamTimes, Marks, a.ID, convert(varchar, DateExam, 101) as DateExam " +
                    "from ExamMark a, Student b, Semester d, Curriculum e, Branch f, Users g, Subject c where c.SubID=a.SubID and d.SemID=a.SemID and e.CurID=a.CurID and f.BranchId=a.BranchId and g.UserName=a.UserName and b.Rollno=a.Rollno";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Listfullexam fullexam=new Listfullexam();
                fullexam.setId(rs.getInt("ID"));
                fullexam.setRollno(rs.getString("Rollno"));
                fullexam.setFullname(rs.getString("stName"));
                fullexam.setSemname(rs.getString("Semname"));
                fullexam.setCurname(rs.getString("CurName"));
                fullexam.setBranchname(rs.getString("BranchName"));
                fullexam.setFname(rs.getString("FullName"));
                fullexam.setSubid(rs.getString("SubID"));
                fullexam.setSubject(rs.getString("SubName"));
                fullexam.setExamTime(rs.getInt("ExamTimes"));
                fullexam.setMark(rs.getFloat("Marks"));
                fullexam.setDateexam(rs.getString("DateExam"));
                listfull.add(fullexam);
            }
            rs.close();
            con.close();
            return listfull;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public boolean InsertExamMark(String rollno, String subid, String semid, String curid, String branchid, String username, int examTime,float mark, String dateexam) {
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [ExamMark](Rollno, SubID, SemID, CurID, BranchId, UserName, ExamTimes, Marks, DateExam) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            stm.setString(2, subid);
            stm.setString(3, semid);
            stm.setString(4, curid);
            stm.setString(5, branchid);
            stm.setString(6, username);
            stm.setInt(7, examTime);
            stm.setFloat(8, mark);
            stm.setString(9, dateexam);
            int result=stm.executeUpdate();
            stm.close();
            con.close();
            if(result>0)
                return true;
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean updateStudent(int id,String rollno,String subid,String SemID, String CurID, String BranchID, String UserName, int examTime,float mark, String dateexam){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update ExamMark set Rollno=?, SubID=?, SemID=?, CurID=?, BranchId=?, UserName=?, ExamTimes=?, Marks=?, DateExam=? where ID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            stm.setString(2, subid);
            stm.setString(3, SemID);
            stm.setString(4, CurID);
            stm.setString(5, BranchID);
            stm.setString(6, UserName);
            stm.setInt(7, examTime);
            stm.setFloat(8, mark);
            stm.setString(9, dateexam);
            stm.setInt(10, id);
            int result=stm.executeUpdate();
            stm.close();
            con.close();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean deleteExamMasrk(int id){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from ExamMark where ID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setInt(1, id);
            int result=stm.executeUpdate();
            stm.close();
            con.close();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getSelectExamdropdowlist(String ccname, String semname) {
        selectExamdropdowlist =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select a.ID, d.SubID, SubName,e.Rollno, StName, Marks, ExamTimes,  convert(varchar, DateExam, 101) as DateExam from ExamMark a, Semester b, Curriculum c, Subject d, Student e " +
                    "where c.CurID=b.CurID and b.SemID=d.SemID and d.SubID=a.SubID and e.Rollno=a.Rollno and c.CurID=? and b.SemID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, ccname);
            stm.setString(2, semname);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Listfullexam fullexam=new Listfullexam();
                fullexam.setId(rs.getInt("ID"));
                fullexam.setRollno(rs.getString("Rollno"));
                fullexam.setFullname(rs.getString("stName"));
                fullexam.setSubid(rs.getString("SubID"));
                fullexam.setSubject(rs.getString("SubName"));
                fullexam.setExamTime(rs.getInt("ExamTimes"));
                fullexam.setMark(rs.getFloat("Marks"));
                fullexam.setDateexam(rs.getString("DateExam"));
                selectExamdropdowlist.add(fullexam);
            }
            rs.close();
            con.close();
            return selectExamdropdowlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
        
    }
    
    public Collection getSelectExamtxt(String rollno) {
        selectExamtxt =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select SubName, b.Rollno, StName, Marks, ExamTimes,  convert(varchar, DateExam, 101) as DateExam " +
                    " from ExamMark a, Student b, Subject c where a.Rollno=b.Rollno and c.SubID=a.SubID and b.Rollno=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ListRollnoexammarks fullexam=new ListRollnoexammarks();
                fullexam.setRollno(rs.getString("Rollno"));
                fullexam.setFullname(rs.getString("stName"));
                fullexam.setSubject(rs.getString("SubName"));
                fullexam.setExamTime(rs.getInt("ExamTimes"));
                fullexam.setMark(rs.getFloat("Marks"));
                fullexam.setDateexam(rs.getString("DateExam"));
                selectExamtxt.add(fullexam);
            }
            rs.close();
            con.close();
            return selectExamtxt;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public Collection getSearchmarks(String rollno) {
        searchmarks=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{//
            String sql="select ID, Rollno, SubID, ExamTimes, marks,  convert(varchar, DateExam, 101) as DateExam from [ExamMark] where Rollno like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + rollno + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ExamMark ls=new ExamMark();
                ls.setId(rs.getInt("ID"));
                ls.setRollno(rs.getString("Rollno"));
                ls.setSubid(rs.getString("SubID"));
                ls.setExamTime(rs.getInt("ExamTimes"));
                ls.setMark(rs.getFloat("Marks"));
                ls.setDateexam(rs.getString("DateExam"));
                searchmarks.add(ls);
            }
            rs.close();
            con.close();
            return searchmarks;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
        
    }

    public Collection getListMark() {
        listMark =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Select ID, Rollno, SubID, ExamTimes, Marks, convert(varchar, DateExam, 101) as DateExam from ExamMark where Marks<40";
            PreparedStatement stm=con.prepareStatement(sql);
           // stm.setString(1, rollno);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ExamMark exam=new ExamMark();
                exam.setId(rs.getInt("ID"));
                exam.setRollno(rs.getString("Rollno"));
                exam.setSubid(rs.getString("SubID"));
                exam.setExamTime(rs.getInt("ExamTimes"));
                exam.setMark(rs.getFloat("Marks"));
                exam.setDateexam(rs.getString("DateExam"));
                listMark.add(exam);
            }
            rs.close();
            con.close();
            return listMark;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
        //return listMark;
    }
}
