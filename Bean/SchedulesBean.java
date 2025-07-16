

package Bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author Rakesh Chander
 */
public class SchedulesBean {
     private Collection listSchedules;
     private Collection serachlist;
    private Collection fullschedule;
    /** Creates a new instance of SchedulesBean */
    public SchedulesBean() {
    }
    public boolean insertSchedules(String scheid,String subid,String schename,int fee,String startdate,String enddate,String dateexam){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Schedules](ScheID, SubID,ScheName, Fee, StartDate, EndDate, DateExam) values(?,?,?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, scheid);
            stm.setString(2, subid);
            stm.setString(3,schename);
            stm.setInt(4, fee);
            stm.setString(5, startdate);
            stm.setString(6, enddate);
            stm.setString(7, dateexam);
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
     public boolean updateSchedules(String scheid,String subid,String schename, int fee,String startdate,String enddate,String dateexam){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update Schedules set SubID=?,ScheName=?, Fee=?, StartDate=?, EndDate=?, DateExam=? where ScheID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, subid);
            stm.setString(2,schename);
            stm.setInt(3, fee);
            stm.setString(4, startdate);
            stm.setString(5, enddate);
            stm.setString(6, dateexam);
            stm.setString(7, scheid);
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
     public boolean deleteSchedules(String scheid){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from Schedules where ScheID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, scheid);
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
    public Collection getListSchedules() {
        listSchedules=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select ScheID,SubID, ScheName, Fee, convert(varchar, StartDate, 101) as StartDate, convert(varchar, EndDate, 101) as EndDate,convert(varchar, DateExam, 101) as DateExam from [Schedules]";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Schedules ls=new Schedules();
                ls.setScheid(rs.getString("ScheID"));
                ls.setSubid(rs.getString("SubID"));
                ls.setSchename(rs.getString("ScheName"));
                ls.setFee(rs.getInt("Fee"));
                ls.setStartdate(rs.getString("StartDate"));
                ls.setEnddate(rs.getString("EndDate"));
                ls.setDateexam(rs.getString("DateExam"));
                listSchedules.add(ls);
            }
            rs.close();
            con.close();
            return listSchedules;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
   public Collection getSerachlist(String schename) {
        serachlist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{//
            String sql="select ScheID,SubID, ScheName, Fee, convert(varchar, StartDate, 101) as StartDate, convert(varchar, EndDate, 101) as EndDate,convert(varchar, DateExam, 101) as DateExam from [Schedules] where ScheName like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + schename + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Schedules ls=new Schedules();
                ls.setScheid(rs.getString("ScheID"));
                ls.setSubid(rs.getString("SubID"));
                ls.setSchename(rs.getString("ScheName"));
                ls.setFee(rs.getInt("Fee"));
                ls.setStartdate(rs.getString("StartDate"));
                ls.setEnddate(rs.getString("EndDate"));
                ls.setDateexam(rs.getString("DateExam"));
                serachlist.add(ls);
            }
            rs.close();
            con.close();
            return serachlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return serachlist;
    }

    public Collection getFullschedule() {
        fullschedule=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select ScheName, SemName, SubName, convert(varchar, StartDate, 101) as StartDate,convert(varchar, EndDate, 101) as EndDate,convert(varchar, DateExam, 101) as DateExam, Fee " +
                    "from Schedules a, Subject b,Semester c  where a.SubID=b.SubID and b.SemID=c.SemID";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Listfullschedule ls=new Listfullschedule();
                ls.setSchename(rs.getString("ScheName"));
                ls.setSemname(rs.getString("SemName"));
                ls.setSubname(rs.getString("SubName"));
                ls.setFee(rs.getInt("Fee"));
                ls.setStartdate(rs.getString("StartDate"));
                ls.setEnddate(rs.getString("EndDate"));
                ls.setDateexam(rs.getString("DateExam"));
                fullschedule.add(ls);
            }
            rs.close();
            con.close();
            return fullschedule;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
        
    }

    
}
