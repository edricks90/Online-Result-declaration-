

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
public class SubjectBean {
    Collection listSubject;
    public SubjectBean() {
    }
    public Collection getListSubject()
    {
        listSubject =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
        String sql="Select * from Subject";
        PreparedStatement stm=con.prepareStatement(sql);
        ResultSet rs=stm.executeQuery();       
            while(rs.next()){
                Subject sub=new Subject();
                sub.setSubID(rs.getString("SubID"));
                sub.setSemID(rs.getString("SemID"));
                sub.setSubName(rs.getString("SubName"));
                listSubject.add(sub);
            }
            rs.close();
            con.close();
        }catch (Exception ex){}         
        return listSubject;
    }
    public boolean InsertSubject(String subID,String semID,String subName)
    {
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Subject](SubID, SemID, SubName) values(?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, subID);
            stm.setString(2, semID);
            stm.setString(3, subName);
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
    public boolean updateSubject(String subID,String semID,String subName){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update Subject set SemID=?, SubName=? where SubID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, semID);
            stm.setString(2, subName);
            stm.setString(3, subID);
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
     public boolean deleteSubject(String id){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from Subject where SubID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, id);
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
}
