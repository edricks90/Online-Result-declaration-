

package controller;

import Bean.*;
import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.ParsePosition;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class controllUser extends HttpServlet {
    // super.init();
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);
        
        String uname=request.getParameter("txtuname");
        String pass=request.getParameter("txtpassword");
        String fullname=request.getParameter("txtfullname");
        String address=request.getParameter("txtaddress");
        String phone=request.getParameter("txtphone");
        String branchid=request.getParameter("ddlbranchid");
        String email=request.getParameter("txtemail");
        String gender=request.getParameter("rdgender");
        String ques=request.getParameter("txtquestion");
        String status=request.getParameter("dropstatus");
        String tmpid=request.getParameter("tmp");
        UserBean ojb=new UserBean();
        
        if(request.getParameter("bt").equals("Insert")){
            try{
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                md5.update(pass.getBytes());
                BigInteger dis = new BigInteger(1, md5.digest());
                pass = dis.toString(16);
                boolean insertuser = ojb.insertuser(uname, pass, fullname, address, phone, branchid, email, gender,ques, status);
                if(insertuser==true){
                    //out.println("Insert thanh cong");
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=user");
                } else
                    out.println("insert fail!!!");
                // out.println(request.getParameter("bt"));
            }catch(Exception ex){
                ex.printStackTrace();
            }
        } else if(request.getParameter("bt").equals("Update")){
            try{
                boolean updateuser=ojb.UpdateUser(tmpid, fullname, address, phone, branchid, email, gender,ques, status);
                if(updateuser==true){
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=user");
                    session.removeAttribute("p");
                }else
                    out.println("update fail!!!");
                //out.println(request.getParameter("bt"));
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        // -------------------Delete ------------------------------
        if(request.getParameter("bt").equals("Delete")){
            String id=request.getParameter("username");
            boolean del=ojb.deleteUser(id);
            //RequestDispatcher rds=request.getRequestDispatcher("Admin/user.jsp");
            //rds.forward(request, response);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=user.jsp?pageNum="+request.getParameter("p"));
        }
        //-------------------------get data to edit---------------------
        String eid = null;
        if(request.getParameter("bt").equals("Edit")){
            eid=request.getParameter("username");
            String efullname=request.getParameter("fullname");
            String eAddress=request.getParameter("address");
            String ephone=request.getParameter("phone");
            String ebranchid=request.getParameter("branchid");
            String eemail=request.getParameter("email");
            String egender=request.getParameter("gender");
            String equestion=request.getParameter("question");
            String estatus=request.getParameter("status");

            request.setAttribute("full", efullname);
            session.setAttribute("eid", eid);
            session.setAttribute("efullname", efullname);
            session.setAttribute("eAddress", eAddress);
            session.setAttribute("ephone", ephone);
            session.setAttribute("ebranchid", ebranchid);
            session.setAttribute("eemail", eemail);
            session.setAttribute("egender", egender);
            session.setAttribute("equestion", equestion);
            session.setAttribute("estatus", estatus);
            //out.println("ID "+estatus);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Updateuser.jsp?pageNum="+request.getParameter("p"));
            
        }
        
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
