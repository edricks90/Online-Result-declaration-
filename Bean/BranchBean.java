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




public class BranchBean {
    
    
     private Collection allbranchlist;

    public BranchBean() {
    }
   
    
    public boolean insertBranch(String branchID, String branchname, String address, String email, String phoneno){
        try{
            Connect ojb=new Connect();
            Connection con=ojb.getconnection();
            String sql="insert into [Branch](BranchId, BranchName, Address, Email, PhoneNo) values(?,?,?,?,?)";//"insert into [Users](UserName) values('"+userName+"')"
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, branchID);
            stm.setString(2, branchname);
            stm.setString(3, address);
            stm.setString(4, email);
            stm.setString(5, phoneno);
            
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
    public boolean UpdateBranch(String BranchID, String Branchname, String Address, String Email, String Phoneno){
        try{
            Connect ojb=new Connect();
            Connection con=ojb.getconnection();
            String sql="update Branch set BranchName= ?, Address= ?, Email= ?, PhoneNo= ? where BranchId= ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, Branchname);
            stm.setString(2, Address);
            stm.setString(3, Email);
            stm.setString(4, Phoneno);
            stm.setString(5, BranchID);
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
    
    public Collection getAllbranchlist() {
        allbranchlist=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        String sql="select * from [Branch]";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next()){
                Branch ls=new Branch();
                ls.setBranchID(rs.getString("BranchId"));
                ls.setBranchname(rs.getString("BranchName"));
                ls.setAddress(rs.getString("Address"));
                ls.setEmail(rs.getString("Email"));
                ls.setPhoneno(rs.getString("PhoneNo"));
               
                allbranchlist.add(ls);
            }
            rs.close();
            con.close();
            return allbranchlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public boolean deleteUser(String BranchId){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        String sql="Delete from [Branch] where BranchId=?";
        
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, BranchId);
            int result=stm.executeUpdate();
            if(result>0)
                return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    
    
    
    
    
}
