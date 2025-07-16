

package controller;

import Bean.StudentBean;
import java.io.*;
import java.net.*;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class SearchStudent extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        StudentBean ojb=new StudentBean();
        if(request.getParameter("bt").equals("Search")){
            String search=request.getParameter("txtsearch");
            Collection co=ojb.getSerachlist(search);
            request.setAttribute("search", co);
            RequestDispatcher rds=request.getRequestDispatcher("indexAdmin2.jsp?page=Admin&url=SearchStudent");
            rds.forward(request, response);
            //response.sendRedirect("Admin/SearchStudent.jsp");
        }
        if(request.getParameter("bt").equals("Delete")){
            String roll=request.getParameter("rollno");
            String name=request.getParameter("txtSearch");
            boolean del=ojb.deleteStudent(roll);
            String url="SearchStudent?txtsearch="+name+"&bt=Search";
            RequestDispatcher rds=request.getRequestDispatcher(url);
            rds.forward(request, response);
        }
        if(request.getParameter("bt").equals("Edit")){
            String roll=request.getParameter("rollno");
            String name=request.getParameter("stname");
            String gen=request.getParameter("gender");
            String addrss=request.getParameter("address");
            String pho=request.getParameter("phone");
            String mail=request.getParameter("email");
            /////////session
            HttpSession session=request.getSession(true);
            session.setAttribute("roll", roll);
            session.setAttribute("name", name);
            session.setAttribute("gen", gen);
            session.setAttribute("addrss",addrss);
            session.setAttribute("pho",pho);
            session.setAttribute("mail", mail);
            response.sendRedirect("indexAdmin2.jsp?page=Admin&url=Updatestudent");
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
