

package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author Rakesh Chander
 */
public class LoginBean {
    
    /** Creates a new instance of LoginBean */
    public LoginBean() {
    }
    public boolean checklogin(String username, String password){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select * from [Users] where UserName=? and Password=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
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
    public boolean changePass(String username, String passwordnew, String passwordOld){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update [Users] set Password=? where UserName=? and password=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, passwordnew);
            stm.setString(2, username);
            stm.setString(3, passwordOld);
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
    public boolean ResetPassword(String username, String password, String Question){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update [Users] set Password=? where UserName=? and Question=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, username);
            stm.setString(3, Question);
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
