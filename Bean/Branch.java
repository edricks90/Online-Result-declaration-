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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class Branch {
    
    private String branchID;
    private String branchname;
    private String address;
    private String email;
    private String phoneno;

    public Branch() {
    }

    public Branch(String branchID, String branchname, String address, String email, String phoneno) {
        this.branchID = branchID;
        this.branchname = branchname;
        this.address = address;
        this.email = email;
        this.phoneno = phoneno;
    }

    
    
    
    
    
    
    public String getBranchID() {
        return branchID;
    }

    public void setBranchID(String branchID) {
        this.branchID = branchID;
    }

    public String getBranchname() {
        return branchname;
    }

    public void setBranchname(String branchname) {
        this.branchname = branchname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

  

    
    
    
    
  
   
    
    
    
    
    
}
