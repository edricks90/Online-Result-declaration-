

package controller;

import Bean.*;
import java.io.*;
import java.net.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllReRegistration extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String regid=request.getParameter("txtregid");
        String rollno=request.getParameter("ddlrollno");
        String scheid=request.getParameter("ddlscheid");
        String status=request.getParameter("txtstatus");
        String date=request.getParameter("txtdate");
        String idtemp=request.getParameter("txttempid");
        HttpSession session=request.getSession(true);
        //SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        ReRegistrationBean obj=new ReRegistrationBean();
//        try {
        if(request.getParameter("bt").equals("Insert")){
            // java.sql.Date adate = new java.sql.Date(format.parse(date).getTime());
            boolean rs=obj.insertReRegistration(regid,rollno,scheid,status,date);
            if(rs==true){
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ReRegistration");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ReRegistration'>Please do not put same subject ID .... back and try again...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
            //java.sql.Date adate = new java.sql.Date(format.parse(date).getTime());
            boolean rs=obj.updateReRegistration(idtemp,rollno,scheid,status,date);
            if(rs==true){
                session.removeAttribute("regid");
                session.removeAttribute("status");
                session.removeAttribute("date");
               
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ReRegistration");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=ReRegistration'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
            String aregid=request.getParameter("regid");
            boolean del=obj.deleteReRegistration(aregid);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=ReRegistration.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
            String aregid=request.getParameter("regid");
             String arollno=request.getParameter("rollno");
            String ascheid=request.getParameter("scheid");
            String astatus=request.getParameter("status");
            String adate=request.getParameter("date");
            /////////session
            
            session.setAttribute("regid", aregid);
            session.setAttribute("rollno", arollno);
            session.setAttribute("scheid",ascheid);
            session.setAttribute("status",astatus);
            session.setAttribute("date",adate);
            session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateReRegistration.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Submit")){
            boolean checkrollno=obj.checkStudentRollno(rollno);
            if(checkrollno==true){
                //java.sql.Date adate = new java.sql.Date(format.parse(date).getTime());
                boolean rs1=obj.insertReRegistration(regid,rollno,scheid,status,date);
                if(rs1==true){
                    out.println("Thank you for sending a message and you need to branch to confirm before the exam!");
                    //response.sendRedirect("ReRegistration.jsp");
                }else
                    out.println("Insert data fail, click <a href='index.jsp?page=ResultDeclarationBoard&url=ReRegistration'>back!</a>");
            } else
                out.println("Rollno not found, click <a href='index.jsp?page=ResultDeclarationBoard&url=ReRegistration'>back!</a>");
        }
//        }catch (ParseException ex) {
//            ex.printStackTrace();
//        }
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
