

package controller;

import Bean.LoginBean;
import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllChangePassoword extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String un=request.getParameter("txtusername");
        String passold=request.getParameter("txtpassold");
        String passnew=request.getParameter("txtpassnew");
        LoginBean ojb=new LoginBean();
        try{
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(passnew.getBytes());
            BigInteger dis = new BigInteger(1, md5.digest());
            passnew = dis.toString(16);
            /////////////
            md5.update(passold.getBytes());
            passold = dis.toString(16);
            boolean checkchange=ojb.changePass(un, passnew, passold);
            if(checkchange==true) {
                out.println("You have change Password successful!");
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ChangePassword'>Back..!</a>");
            }else{
                out.println("You have change Password fail!");
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ChangePassword'>Back..!</a>");
            }
        }catch(Exception ex){
            ex.printStackTrace();
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
