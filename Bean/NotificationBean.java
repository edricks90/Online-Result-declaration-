/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Rakesh Chander
 */

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
import java.sql.Date;










public class NotificationBean {
    
    private Collection listfull;

    public NotificationBean() {
    
    
    }

    
    
     public Collection getListfull() {
        listfull =new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Select NoID, NoTitle, NoInfo, convert(varchar, NoDate, 101) as NoDate from Notification";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Notification notiy=new Notification();
                
                
                notiy.setNoid(rs.getString("NoID"));
                notiy.setNotitle(rs.getString("Notitle"));
                notiy.setNoinfo(rs.getString("Noinfo"));
                notiy.setNodate(rs.getString("Nodate"));
                
                
               listfull.add(notiy);
            }
            rs.close();
            con.close();
            return listfull;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    
     
     
     
     public boolean InsertNotification( String noid, String notitle, String noinfo, String nodate) {
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Notification](NoID, NoTitle, NoInfo, NoDate) values(?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, noid);
            stm.setString(2, notitle);
            stm.setString(3, noinfo);
            stm.setString(4, nodate);
           
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
    public boolean updateNotification(String noid, String notitle, String noinfo, String nodate){
       
        try{
             Connect ojb=new Connect();
             Connection con=ojb.getconnection();
            String sql="update Notification set NoTitle= ?, NoInfo= ?, NoDate= ? where NoID= ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, notitle);
            stm.setString(2, noinfo);
            stm.setString(3, nodate);
            stm.setString(4, noid);
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
    public boolean deleteNotification(String noid){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from [Notification] where NoID=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, noid);
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
