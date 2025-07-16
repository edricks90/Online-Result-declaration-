

package controller;

import Bean.*;
import Bean.BranchBean;
import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class controllLogin extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username=request.getParameter("txtusername");
        String password=request.getParameter("txtpass");
      
        
       
        LoginBean ojb=new LoginBean();
        UserBean ub=new UserBean();
        
        Collection co= ub.getAlllist();
        
        String permis = null;
        Iterator iter=co.iterator();
        
        if(request.getParameter("btlogin").equals("Login")){
            
            try{
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                md5.update(password.getBytes());
                BigInteger dis = new BigInteger(1, md5.digest());
                password = dis.toString(16);
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
            boolean result=ojb.checklogin(username, password);
            if(result==true){
                out.println("Login Thanh cong");
                HttpSession session=request.getSession(true);
                session.setAttribute("un", username);
                
                //session.setAttribute("permission", permis);
                while(iter.hasNext()){
                    User u=(User) iter.next();
                    if(u.getUsername().equals(username))
                        permis=u.getStatus();
                    // else permis=null;
                }
                session.setAttribute("permission", permis);
                //out.println("permission: "+permis);
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=user");
            } else
                //out.println("Login fail");
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=fail");
        }
        if(request.getParameter("btlogin").equals("Login!")){
            try{
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                md5.update(password.getBytes());
                BigInteger dis = new BigInteger(1, md5.digest());
                password = dis.toString(16);
                boolean result=ojb.checklogin(username, password);
                if(result==true){
                    out.println("Login Thanh cong");
                    HttpSession session=request.getSession(true);
                    session.setAttribute("un", username);
                    //session.setAttribute("permission", permis);
                    while(iter.hasNext()){
                        User u=(User) iter.next();
                        if(u.getUsername().equals(username))
                            permis=u.getStatus();
                    }
                    session.setAttribute("permission", permis);
                    response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Mark");
                } else
                    //out.println("Login fail");
                    response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=fail");
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
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

