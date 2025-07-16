

package controller;

import Bean.*;
import java.io.*;
import java.net.*;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class Serachuser extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(true);
        String search=request.getParameter("txtsearch");
        UserBean ojb=new UserBean();
        if(request.getParameter("bt").equals("Search")){
            Collection col=ojb.getSearchlist(search);
            request.setAttribute("sear", col);
            RequestDispatcher rds=request.getRequestDispatcher("indexAdmin2.jsp?page=Admin&url=SearchUser");
            rds.forward(request, response);
        }
        if(request.getParameter("bt").equals("Delete")){
            String un=request.getParameter("username");
            String name=request.getParameter("txtsearch");
            boolean del=ojb.deleteUser(un);
            String url="Serachuser?txtsearch="+name+"&bt=Search";
            RequestDispatcher rds=request.getRequestDispatcher(url);
            rds.forward(request, response);
        }
        String eid = null;
        if(request.getParameter("bt").equals("Edit")){
            eid=request.getParameter("username");
            String efullname=request.getParameter("fullname");
            String eAddress=request.getParameter("address");
            String ephone=request.getParameter("phone");
            String eemail=request.getParameter("email");
            String egender=request.getParameter("gender");
            String equestion=request.getParameter("question");
            String estatus=request.getParameter("status");
            
            request.setAttribute("full", efullname);
            session.setAttribute("eid", eid);
            session.setAttribute("efullname", efullname);
            session.setAttribute("eAddress", eAddress);
            session.setAttribute("ephone", ephone);
            session.setAttribute("eemail", eemail);
            session.setAttribute("egender", egender);
            session.setAttribute("equestion", equestion);
            session.setAttribute("estatus", estatus);
            //out.println("ID "+estatus);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("indexAdmin2.jsp?page=Admin&url=Updateuser.jsp?pageNum="+request.getParameter("p"));
            
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
