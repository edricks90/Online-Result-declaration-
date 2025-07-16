

package controller;

import Bean.SemesterBean;
import java.io.*;
import java.net.*;
import java.text.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllSemester extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String semid=request.getParameter("txtsemid");
        String curid=request.getParameter("ddlcurid");
        String semname=request.getParameter("txtsemname");
        String tempi=request.getParameter("tempsemname");
        SemesterBean obj=new SemesterBean();
        HttpSession session=request.getSession(true);
        if(request.getParameter("bt").equals("Insert")){
            
            boolean rs=obj.insertSemester(semid,curid, semname);
            if(rs==true){
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Semester");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Semester'>Insert fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
            
            boolean rs=obj.updateSemester(tempi, curid, semname);
            if(rs==true){
                session.removeAttribute("semid");
                //session.removeAttribute("curid");
                session.removeAttribute("semname");
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Semester");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Semester'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
            String asemid=request.getParameter("semid");
            boolean del=obj.deleteSemester(asemid);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Semester.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
            String asemid=request.getParameter("semid");
            String asemname=request.getParameter("semname");
            
            /////////session
            
            session.setAttribute("semid", asemid);
            //session.setAttribute("curid", acurid);
            session.setAttribute("semname",asemname);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateSemester.jsp?pageNum="+request.getParameter("p"));
            
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
