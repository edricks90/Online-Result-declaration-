

package controller;

import Bean.UserBean;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author Rakesh Chander
 */
public class ControllProfile extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname=request.getParameter("txtuname");
        String pass=request.getParameter("txtpassword");
        String fullname=request.getParameter("txtfullname");
        String address=request.getParameter("txtaddress");
        String phone=request.getParameter("txtphone");
        String branchid=request.getParameter("txtbranchid");
        String email=request.getParameter("txtemail");
        String gender=request.getParameter("rdgender");
        String ques=request.getParameter("txtquestion");
        String status=request.getParameter("dropstatus");
        String tmpid=request.getParameter("tmp");
        String eid = null;
        UserBean ojb=new UserBean();
        if(request.getParameter("bt").equals("Update")){
            try{
                boolean updateuser=ojb.UpdateUser(tmpid, fullname, address, phone, branchid, email, gender,ques, status);
                if(updateuser==true){
                    HttpSession session=request.getSession(true);
                    request.removeAttribute("full");
                    session.removeAttribute("efullname");
                    session.removeAttribute("eAddress");
                    session.removeAttribute("ephone");
                     session.removeAttribute("ebranchid");
                    session.removeAttribute("eemail");
                    session.removeAttribute("egender");
                    session.removeAttribute("equestion");
                    session.removeAttribute("estatus");
                    response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Profile");
                    
                }else
                   out.println("<a href='index.jsp?page=ResultDeclarationBoard&url=Profile'>Update profile fail back...!</a>");
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        if(request.getParameter("bt").equals("Edit")){
            HttpSession session=request.getSession(true);
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
            response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Profile");
            
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
