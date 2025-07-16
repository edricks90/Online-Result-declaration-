

package controller;

import Bean.ExamMarkBean;
import Bean.StudentBean;
import Bean.SemesterBean;
import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllExamMark extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ExamMarkBean exam=new ExamMarkBean();
        
        HttpSession session=request.getSession();
        session.setAttribute("p", request.getParameter("p"));
        try{
            if(request.getParameter("bt").equals("Insert")) {
                String rollno=request.getParameter("roll");
                String subid=request.getParameter("subid");
                String semid=request.getParameter("semid");
                String curid=request.getParameter("curid");
                String branchid=request.getParameter("branchid");
                String username=request.getParameter("username");
                int examTime=Integer.parseInt(request.getParameter("examTime"));
                String date=request.getParameter("dateexam");
                SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
                
                float mark=Float.parseFloat(request.getParameter("mark"));
                 
                boolean rs=exam.InsertExamMark(rollno, subid, semid, curid, branchid, username, examTime, mark, date);
                if(rs==true){
                    session.setAttribute("p", request.getParameter("p"));
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ExamMark");
                }else
                    out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ExamMark'>Insert fail back...!</a>");
            }
            if(request.getParameter("bt").equals("Delete")) {
                session.setAttribute("p", request.getParameter("p"));
                String exameID=request.getParameter("exameID");
                boolean rs=exam.deleteExamMasrk(Integer.parseInt(exameID));
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ExamMark.jsp?pageNum="+request.getParameter("p"));
            }
            if(request.getParameter("bt").equals("Edit")){
                
                String id=request.getParameter("exameID");
                String examTime=request.getParameter("examTime");
                String mark=request.getParameter("mark");
                String da=request.getParameter("dateexm");
                String su=request.getParameter("sb");
                String sm=request.getParameter("sid");
                String cid=request.getParameter("cid");
                String bid=request.getParameter("bid");
                String usen=request.getParameter("usen");
                
                /////////session
                session.setAttribute("exameID", id);
                session.setAttribute("examTime", examTime);
                session.setAttribute("mark", mark);
                session.setAttribute("date", da);
                session.setAttribute("subject", su);
                session.setAttribute("semester", sm);
                session.setAttribute("curriculum", cid);
                session.setAttribute("branch", bid);
                session.setAttribute("usen", usen);
                session.setAttribute("p", request.getParameter("p"));
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateExamMark.jsp?pageNum="+request.getParameter("p"));
            }
            if(request.getParameter("bt").equals("Update")) {
                int id=Integer.parseInt(request.getParameter("exameID"));
                String rollno=request.getParameter("roll");
                String subid=request.getParameter("subid");
                String semid=request.getParameter("semid");
                String curid=request.getParameter("curid");
                String branchid=request.getParameter("branchid");
                String username=request.getParameter("username");
                int examTime=Integer.parseInt(request.getParameter("examTime"));
                float mark=Float.parseFloat(request.getParameter("mark"));
                String ate=request.getParameter("dateexam");
                SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
                
                
                
                boolean rs=exam.updateStudent(id,rollno,subid,semid,curid, branchid, username, examTime,mark, ate);
                if(rs==true){
                    session.removeAttribute("exameID");
                    session.removeAttribute("examTime");
                    session.removeAttribute("mark");
                    
                    session.removeAttribute("date");
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ExamMark");
                    session.removeAttribute("p");
                }else
                    out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ExamMark'>Update fail back...!</a>");
            }
        } catch(Exception ex){
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