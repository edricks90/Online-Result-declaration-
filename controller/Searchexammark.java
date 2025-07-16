

package controller;

import Bean.ExamMarkBean;
import java.io.*;
import java.net.*;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class Searchexammark extends HttpServlet {
    
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
        String date=request.getParameter("txtdateexam");
        ExamMarkBean exam=new ExamMarkBean();
        if(request.getParameter("bt").equals("Search")){
            Collection col=exam.getSearchmarks(search);
            request.setAttribute("sear", col);
            RequestDispatcher rds=request.getRequestDispatcher("indexAdmin2.jsp?page=Admin&url=SearchExamMarks");
            rds.forward(request, response);
        }
        if(request.getParameter("bt").equals("Delete")) {
            String exameID=request.getParameter("exameID");
            String name=request.getParameter("txtsearch");
            boolean rs=exam.deleteExamMasrk(Integer.parseInt(exameID));
            String url="Searchexammark?txtsearch="+name+"&bt=Search";
            RequestDispatcher rds=request.getRequestDispatcher(url);
            rds.forward(request, response);
        }
        if(request.getParameter("bt").equals("Edit")){
            String id=request.getParameter("exameID");
            String examTime=request.getParameter("examTime");
            String mark=request.getParameter("mark");
            String da=request.getParameter("dateexm");
            /////////session
            //  HttpSession session=request.getSession(true);
            session.setAttribute("exameID", id);
            session.setAttribute("examTime", examTime);
            session.setAttribute("mark", mark);
            session.setAttribute("date", da);
            response.sendRedirect("indexAdmin2.jsp?page=Admin&url=ExamMark.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Rollno Marks")){
            //String t=request.getParameter("txt");
            ExamMarkBean b=new ExamMarkBean();
            Collection c=b.getListMark();
            //if(c!=null){
            request.setAttribute("sear", c);
            RequestDispatcher rds=request.getRequestDispatcher("indexAdmin2.jsp?page=Admin&url=SearchExamMarks");
            rds.forward(request, response);
            //response.sendRedirect("indexAdmin2.jsp?page=Admin&url=SearchExamMarks");
            //}
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
