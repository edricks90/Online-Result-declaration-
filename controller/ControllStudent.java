

package controller;

import Bean.*;
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
public class ControllStudent extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String rollno=request.getParameter("txtrollno");
        String stname=request.getParameter("txtstname");
        String add=request.getParameter("txtaddress");
        String phone=request.getParameter("txtphone");
        String email=request.getParameter("txtemail");
        String gender=request.getParameter("rdgender");
        String temp=request.getParameter("txttemp");
        HttpSession session=request.getSession(true);
        //rollno, stname, gender, add, phone, email
        StudentBean ojb=new StudentBean();
        if(request.getParameter("bt").equals("Insert")){
            
            boolean rs=ojb.insertStudent(rollno, stname, gender, add, phone, email);
            if(rs==true){
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Student");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Student'>Insert fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
            
            boolean rs=ojb.updateStudent(temp, stname, gender, add, phone, email);
            if(rs==true){
                session.removeAttribute("roll");
                session.removeAttribute("name");
                session.removeAttribute("gen");
                session.removeAttribute("addrss");
                session.removeAttribute("pho");
                session.removeAttribute("mail");
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Student");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Student'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
            String roll=request.getParameter("rollno");
            boolean del=ojb.deleteStudent(roll);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Student.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
            String roll=request.getParameter("rollno");
            String name=request.getParameter("stname");
            String gen=request.getParameter("gender");
            String addrss=request.getParameter("address");
            String pho=request.getParameter("phone");
            String mail=request.getParameter("email");
            /////////session
            
            session.setAttribute("roll", roll);
            session.setAttribute("name", name);
            session.setAttribute("gen", gen);
            session.setAttribute("addrss",addrss);
            session.setAttribute("pho",pho);
            session.setAttribute("mail", mail);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Updatestudent.jsp?pageNum="+request.getParameter("p"));
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
