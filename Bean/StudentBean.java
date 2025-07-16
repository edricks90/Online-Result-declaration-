

package Bean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author Rakesh Chander
 */
public class StudentBean {
    private Collection listStudent;
    private Collection serachlist;
    private Collection list;
    /** Creates a new instance of StudentBean */
    public StudentBean() {
    }
    public boolean insertStudent(String rollno, String stName, String gender, String address, String phone, String email){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="insert into [Student](Rollno, StName, Gender, Address, Phone, Email) values(?,?,?,?,?,?)";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
            stm.setString(2, stName);
            stm.setString(3, gender);
            stm.setString(4, address);
            stm.setString(5, phone);
            stm.setString(6, email);
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
    public boolean updateStudent(String Rollno, String StName, String Gender, String Address, String Phone, String Email){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="update Student set StName=?, Gender=?, Address=?, Phone=?, Email=? where Rollno=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, StName);
            stm.setString(2, Gender);
            stm.setString(3, Address);
            stm.setString(4, Phone);
            stm.setString(5, Email);
            stm.setString(6, Rollno);
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
    public boolean deleteStudent(String rollno){
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="Delete from Student where Rollno=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, rollno);
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
    public Collection getListStudent() {
        listStudent=new ArrayList();
        Connect ojb=new Connect();
        Connection con=ojb.getconnection();
        try{
            String sql="select * from [Student]";
            PreparedStatement stm=con.prepareStatement(sql);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Student ls=new Student();
                ls.setRollno(rs.getString("Rollno"));
                ls.setStname(rs.getString("StName"));
                ls.setGender(rs.getString("Gender"));
                ls.setAddress(rs.getString("Address"));
                ls.setPhone(rs.getString("Phone"));
                ls.setEmail(rs.getString("Email"));
                listStudent.add(ls);
            }
            rs.close();
            con.close();
            return listStudent;
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
            String sql="select * from [Student] where Rollno like ?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, "%" + rollno + "%");
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                Student ls=new Student();
                ls.setRollno(rs.getString("Rollno"));
                ls.setStname(rs.getString("StName"));
                ls.setGender(rs.getString("Gender"));
                ls.setAddress(rs.getString("Address"));
                ls.setPhone(rs.getString("Phone"));
                ls.setEmail(rs.getString("Email"));
                serachlist.add(ls);
            }
            rs.close();
            con.close();
            return serachlist;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

}
