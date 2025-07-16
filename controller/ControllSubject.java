
package controller;

import Bean.SubjectBean;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllSubject extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        SubjectBean sub=new SubjectBean();
        
        if(request.getParameter("bt").equals("Insert"))
        {
            String subid=request.getParameter("subid");
            String semid=request.getParameter("semid");
            String subname=request.getParameter("subname");
            boolean rs=sub.InsertSubject(subid,semid,subname);
            if(rs==true)
            {
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Subject");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Subject'>Insert fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Edit"))
        {
            String sid=request.getParameter("subid");
           // String semid=request.getParameter("semid");
            String sname=request.getParameter("subName");
            HttpSession session=request.getSession(true);
            session.setAttribute("subid", sid);
            session.setAttribute("Sname", sname);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateSubject");
        }
         if(request.getParameter("bt").equals("Update"))
        {
            //String subid=request.getParameter("subid");
            String semid=request.getParameter("semid");
            String subname=request.getParameter("subname");
            String tempidSub=request.getParameter("tempsubid");
            boolean rs=sub.updateSubject(tempidSub,semid,subname);
            if(rs==true)
            {
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Subject");
                HttpSession session = request.getSession();
                session.removeAttribute("subid");
                session.removeAttribute("Sname");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Subject'>Update fail back...!</a>");
         }
        if(request.getParameter("bt").equals("Delete"))
        {
            String subid=request.getParameter("subid");
            boolean rs=sub.deleteSubject(subid);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Subject");
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
