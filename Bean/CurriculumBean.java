

package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author Rakesh Chander
 */
public class CurriculumBean {
    private Collection listCurriculum;
    private Collection serachlist;
    private Collection inforcur;
    /** Creates a new instance of CurriculumBean */
    public CurriculumBean() {
    }
    
    public boolean insertCurriculum(String curid, String curname, String period, int fee){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Curriculum](CurID, CurName, Period, Fee) values(?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1,curid);
            stm.setString(2,curname);
            stm.setString(3,period);
            stm.setInt(4,fee);
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
    public boolean updateCurriculum(String curid, String curname, String period, int fee){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update Curriculum set CurName=?, Period=?, Fee=? where CurID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1,curname);
            stm.setString(2,period);
            stm.setInt(3,fee);
            stm.setString(4,curid);
            
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
    public boolean deleteCurriculum(String curid){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from Curriculum where Curid=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, curid);
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
    public Collection getListCurriculum() {
        listCurriculum=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select * from [Curriculum]";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Curriculum ls=new Curriculum();
                ls.setCurid(rs.getString("CurID"));
                ls.setCurname(rs.getString("CurName"));
                ls.setPeriod(rs.getString("Period"));
                ls.setFee(rs.getInt("Fee"));
                
                listCurriculum.add(ls);
            }
            rs.close();
            con.close();
            return listCurriculum;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public Collection getSerachlist(String rollno) {
        serachlist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{//
            String sql="select * from [Curriculum] where Rollno like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + rollno + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Curriculum ls=new Curriculum();
                ls.setCurid(rs.getString("CurID"));
                ls.setCurname(rs.getString("CurName"));
                ls.setPeriod(rs.getString("Period"));
                ls.setFee(rs.getInt("Fee"));
                
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

    public Collection getInforcur(String curid) {
        inforcur=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{//
            String sql="select a.CurID, CurName, Period, Fee, SemName from Curriculum a, Semester b where a.CurID=b.CurID and a.CurID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, curid);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                InforCurriculum ls=new InforCurriculum();
                ls.setCurid(rs.getString("CurID"));
                ls.setCurname(rs.getString("CurName"));
                ls.setPeriod(rs.getString("Period"));
                ls.setFee(rs.getInt("Fee"));
                ls.setSemname(rs.getString("SemName"));
                inforcur.add(ls);
            }
            rs.close();
            con.close();
        return inforcur;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
