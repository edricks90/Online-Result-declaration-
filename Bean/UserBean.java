

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



/**
 *
 * @author Rakesh Chander
 */
public class UserBean{
    private Collection alllist;
    private Collection list;
    private Collection profile;
    private Collection searchlist;
    /** Creates a new instance of insertBean */
    public UserBean() {
    }
    public boolean insertuser(String userName, String Password, String FullName, String Address, String Phone, String Branchid, String Email, String Gender, String Question, String Status){
        try{
            Connect ojb=new Connect();
            Connection con=ojb.getconnection();
            String sql="insert into [Users](UserName, Password, FullName, Address, Phone, BranchId, Email, Gender, Question, Status) values(?,?,?,?,?,?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, Password);
            stm.setString(3, FullName);
            stm.setString(4, Address);
            stm.setString(5, Phone);
            stm.setString(6,Branchid);
            stm.setString(7, Email);
            stm.setString(8, Gender);
            stm.setString(9, Question);
            stm.setString(10, Status);
            int result=stm.executeUpdate();
            stm.close();
            con.close();
            if(result>0)
                return true;
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean UpdateUser(String userName, String FullName, String Address, String Phone, String Branchid, String Email, String Gender,String Question, String Status){
        try{
            Connect ojb=new Connect();
            Connection con=ojb.getconnection();
            String sql="update [Users] set FullName= ?, Address= ?, Phone= ?, BranchId= ?, Email= ?, Gender= ?, Question=?, Status= ? where UserName= ?";
            PreparedStatement stm=con.prepareStatement(sql);
            
            
            stm.setString(1, FullName);
            stm.setString(2, Address);
            stm.setString(3, Phone);
            stm.setString(4,Branchid);
            stm.setString(5, Email);
            stm.setString(6, Gender);
            stm.setString(7, Question);
            stm.setString(8, Status);
            stm.setString(9, userName);
            int result=stm.executeUpdate();
            stm.close();
            con.close();
            if(result>0)
                return true;
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public Collection getAlllist() {
        alllist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        String sql="select * from [Users]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                User ls=new User();
                ls.setUsername(rs.getString("UserName"));
                ls.setFullname(rs.getString("FullName"));
                ls.setAddress(rs.getString("Address"));
                ls.setPhone(rs.getString("Phone"));
                ls.setBranchid(rs.getString("BranchId"));
                ls.setEmail(rs.getString("Email"));
                ls.setGender(rs.getString("Gender"));
                ls.setQuestion(rs.getString("Question"));
                ls.setStatus(rs.getString("Status"));
                alllist.add(ls);
            }
            rs.close();
            con.close();
            return alllist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public boolean deleteUser(String username){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        String sql="Delete from [Users] where UserName=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, username);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    

    public Collection getProfile(String username) {
        profile=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        String sql="select * from [Users] where UserName=?";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                User ls=new User();
                ls.setUsername(rs.getString("UserName"));
                ls.setFullname(rs.getString("FullName"));
                ls.setAddress(rs.getString("Address"));
                ls.setPhone(rs.getString("Phone"));
                ls.setEmail(rs.getString("Email"));
                ls.setGender(rs.getString("Gender"));
                ls.setQuestion(rs.getString("Question"));
                ls.setStatus(rs.getString("Status"));
                profile.add(ls);
            }
            rs.close();
            con.close();
            return profile;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
        
    }

    public Collection getSearchlist(String username) {
        searchlist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{//
            String sql="select * from [Users] where UserName like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + username + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                User ls=new User();
                ls.setUsername(rs.getString("UserName"));
                ls.setFullname(rs.getString("FullName"));
                ls.setAddress(rs.getString("Address"));
                ls.setPhone(rs.getString("Phone"));
                ls.setEmail(rs.getString("Email"));
                ls.setGender(rs.getString("Gender"));
                ls.setQuestion(rs.getString("Question"));
                ls.setStatus(rs.getString("Status"));
                searchlist.add(ls);
            }
            rs.close();
            con.close();
            return searchlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
