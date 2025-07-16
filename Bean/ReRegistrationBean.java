

package Bean;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
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
public class ReRegistrationBean {
    private Collection listReRegistration;
    private Collection serachlist;
    
    /** Creates a new instance of ReRegistrationBean */
    public ReRegistrationBean() {
    }
    public Collection getListReRegistration() {
        listReRegistration=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select RegID,Rollno,ScheID, Status, convert(varchar, Date, 101) as Date   from [ReRegistration]";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ReRegistration ls=new ReRegistration();
                ls.setRegid(rs.getString("RegID"));
                ls.setRollno(rs.getString("Rollno"));
                ls.setScheid(rs.getString("ScheID"));
                ls.setStatus(rs.getString("Status"));
                ls.setDate(rs.getString("Date"));
                listReRegistration.add(ls);
            }
            rs.close();
            con.close();
            return listReRegistration;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean insertReRegistration(String regid,String rollno,String scheid,String status,String date){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [ReRegistration](RegID, Rollno, ScheID, Status, Date) values(?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, regid);
            stm.setString(2, rollno);
            stm.setString(3, scheid);
            stm.setString(4, status);
            stm.setString(5, date);
            
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
    public boolean updateReRegistration(String regid,String rollno,String scheid,String status, String date){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update ReRegistration set Rollno=?, ScheID=?, Status=?, Date=? where RegID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            stm.setString(2, scheid);
            stm.setString(3, status);
            stm.setString(4, date);
            stm.setString(5, regid);
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
    public boolean deleteReRegistration(String regid){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from ReRegistration where RegID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, regid);
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
    public Collection getSerachlist(String regid) {
        serachlist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select RegID,Rollno,ScheID, Status, convert(varchar, Date, 101) as Date from [ReRegistration] where RegID like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + regid + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                ReRegistration ls=new ReRegistration();
                ls.setRegid(rs.getString("RegID"));
                ls.setRollno(rs.getString("Rollno"));
                ls.setScheid(rs.getString("ScheID"));
                ls.setStatus(rs.getString("Status"));
                ls.setDate(rs.getString("Date"));
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
    //check rollno
    public boolean checkStudentRollno(String rollno){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select * from [Student] where Rollno=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            ResultSet rs=stm.executeQuery();
            boolean result=rs.next();
            rs.close();
            stm.close();
            con.close();
            if(result)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
}
