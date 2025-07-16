

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
public class SemesterBean {
    private Collection listSemester;
     private Collection serachlist;
    
    /** Creates a new instance of SemesterBean */
    public SemesterBean() {
    }
    //String semid, String curid, String semname
    
    public boolean insertSemester(String semid,String curid,String semname){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Semester](SemID, CurID, SemName) values(?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, semid);
            stm.setString(2, curid);
            stm.setString(3,semname);
            
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
    public boolean updateSemester(String semid,String curid,String semname){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update Semester set CurID=?,SemName=? where SemID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1,curid);
            stm.setString(2,semname);
            stm.setString(3,semid);
            
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
    public boolean deleteSemester(String semid){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from Semester where SemID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, semid);
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
    public Collection getListSemester() {
        listSemester=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select * from [Semester]";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Semester ls=new Semester();
                ls.setSemid(rs.getString("SemID"));
                ls.setCurid(rs.getString("CurID"));
                ls.setSemname(rs.getString("SemName"));
                
                listSemester.add(ls);
            }
            rs.close();
            con.close();
            return listSemester;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;

    }
    
}
