

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
public class SearchExammarks extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String ccname=request.getParameter("dropccname");
        String semname=request.getParameter("dropsemname");
        String rollno=request.getParameter("txtrollno");
        ExamMarkBean ojb=new ExamMarkBean();
        if(request.getParameter("bt").equals("Search")){
            Collection getmarks=ojb.getSelectExamdropdowlist(ccname, semname);
            request.setAttribute("getmarks", getmarks);
            RequestDispatcher rds=request.getRequestDispatcher("index.jsp?page=ResultDeclarationBoard&url=Results");
            rds.include(request, response);
            //out.println("cc:"+ccname+"sem:" +semname);
        }
        if(request.getParameter("bt").equals("Submit")){
            Collection getmarks=ojb.getSelectExamtxt(rollno);
            request.setAttribute("getmarks", getmarks);
            RequestDispatcher rds=request.getRequestDispatcher("index.jsp?page=ResultDeclarationBoard&url=Results");
            rds.forward(request, response);
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
