/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Bean.*;
import Bean.NotificationBean;
import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.sql.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import java.text.SimpleDateFormat;



/**
 *
 * @author Rakesh Chander
 */
public class ControllNotification extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
         
         String noid=request.getParameter("txtnoid");
         String notitle=request.getParameter("txtnotitle");
         String noinfo=request.getParameter("txtnoinfo");
        
        String nodate=request.getParameter("txtnodate");
             
        String temp=request.getParameter("txttemp");
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session=request.getSession(true);
        NotificationBean exam =new NotificationBean();
        
         
       
        
        
        
            if(request.getParameter("bt").equals("Insert")){
            
                
                
                
                
                
                
                
            boolean rs=exam.InsertNotification(noid, notitle, noinfo, nodate);
            if(rs==true){
               
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Notification");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Notification'>Insert fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
         
            //                java.sql.Date anodate = new java.sql.Date(format.parse(nodate).getTime());
            boolean rs=exam.updateNotification(temp, notitle, noinfo, nodate);
            if(rs==true){
                
               
                session.removeAttribute("noid");
                session.removeAttribute("notitle");
                session.removeAttribute("noinfo");
                session.removeAttribute("nodate");
               
               
                
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Notification");
              
                
                
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Notification'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
           
            
            
            String anoid=request.getParameter("noid");
            
            
            boolean del=exam.deleteNotification(anoid);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Notification.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
                String anoid=request.getParameter("noid");
                String bnotitle=request.getParameter("notitle");
                String cnoinfo=request.getParameter("noinfo");
                String dnodate=request.getParameter("nodate");
            
            /////////session
            
            session.setAttribute("noid",anoid);
            session.setAttribute("notitle",bnotitle);
            session.setAttribute("noinfo",cnoinfo);
            session.setAttribute("nodate",dnodate);
         
             session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateNotification.jsp?pageNum="+request.getParameter("p"));
        }
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
