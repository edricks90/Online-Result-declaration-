

package controller;

import Bean.ExamMarkBean;
import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllMark extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ExamMarkBean exam=new ExamMarkBean();
        String date=request.getParameter("txtdateexam");
        //SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        try{
            if(request.getParameter("bt").equals("Insert")) {
                String rollno=request.getParameter("roll");
                String subid=request.getParameter("subid");
                String semid=request.getParameter("semid");
                 String curid=request.getParameter("curid");
                 String branchid=request.getParameter("branchid");
                 String username=request.getParameter("username");
                int examTime=Integer.parseInt(request.getParameter("ExamTimes"));
                float mark=Float.parseFloat(request.getParameter("Marks"));
                //java.sql.Date d = new java.sql.Date(format.parse(date).getTime());
                boolean rs=exam.InsertExamMark(rollno, subid, semid, curid, branchid, username, examTime, mark, date);
                if(rs==true){
                    response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Mark");
                }else
                    out.println("<a href='index.jsp?page=ResultDeclarationBoard&url=Mark'>Insert fail back...!</a>");
            }
            if(request.getParameter("bt").equals("Delete")) {
                String exameID=request.getParameter("exameID");
                boolean rs=exam.deleteExamMasrk(Integer.parseInt(exameID));
                response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Mark");
            }
            if(request.getParameter("bt").equals("Edit")){
                String id=request.getParameter("exameID");
                String examTime=request.getParameter("examTime");
                String mark=request.getParameter("mark");
                String sem=request.getParameter("sem");
                String cur=request.getParameter("cur");
                String bra=request.getParameter("bra");
                String usn=request.getParameter("usn");
                String da=request.getParameter("dateexm");
                /////////session
                HttpSession session=request.getSession(true);
                session.setAttribute("exameID", id);
                session.setAttribute("examTime", examTime);
                session.setAttribute("mark", mark);
                session.setAttribute("sem", sem);
                session.setAttribute("cur", cur);
                session.setAttribute("bra", bra);
                session.setAttribute("usn", usn);
                session.setAttribute("date", da);
                response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Mark");
            }
            if(request.getParameter("bt").equals("Update")) {
                int id=Integer.parseInt(request.getParameter("exameID"));
                String rollno=request.getParameter("roll");
                String subid=request.getParameter("subid");
                String SemID=request.getParameter("SemID");
                String CurID=request.getParameter("CurID");
                String BranchId=request.getParameter("BranchId");
                String UserName=request.getParameter("UserName");
                int examTime=Integer.parseInt(request.getParameter("ExamTimes"));
                float mark=Float.parseFloat(request.getParameter("Marks"));
                //java.sql.Date d = new java.sql.Date(format.parse(date).getTime());
                boolean rs=exam.updateStudent(id,rollno,subid,SemID,CurID,BranchId,UserName,examTime,mark, date);
                if(rs==true){
                    HttpSession session = request.getSession();
                    session.removeAttribute("exameID");
                    session.removeAttribute("examTime");
                    session.removeAttribute("mark");
                    response.sendRedirect("index.jsp?page=ResultDeclarationBoard&url=Mark");
                }else
                    out.println("<a href='index.jsp?page=ResultDeclarationBoard&url=Mark'>Insert fail back...!</a>");
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
