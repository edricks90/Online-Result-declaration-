

package controller;

import Bean.ReRegistrationBean;
import java.io.*;
import java.net.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllRegis extends HttpServlet {
    
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
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        ReRegistrationBean obj=new ReRegistrationBean();
        try {
            Date adate = new Date(format.parse(date).getTime());
            if(request.getParameter("bt").equals("Insert")){
                
                
                boolean checkrollno=obj.checkStudentRollno(rollno);
                
                //  if(checkrollno==true){
                
                // boolean rs1=obj.insertReRegistration(regid,rollno,scheid,status,adate);
                //  if(rs1==true){
                out.println("Submit thanh cong"+regid);
                 out.println("Submit thanh cong"+rollno);
                  out.println("Submit thanh cong"+scheid);
                   out.println("Submit thanh cong"+status);
                    out.println("Submit thanh cong"+adate);
                //response.sendRedirect("ReRegistration.jsp");
                //   }else
                //        out.println("<a href='ReRegistration.jsp'>Insert fail back...!</a>");
                //      } else
                //          out.println("Rollno khong tim thay");
                
            }
        } catch (ParseException ex) {
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
