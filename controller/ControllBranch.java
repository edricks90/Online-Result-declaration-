/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Bean.*;
import Bean.BranchBean;
import java.io.*;
import java.math.BigInteger;
import java.net.*;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;


import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllBranch extends HttpServlet {

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
        String branchID=request.getParameter("txtbranchID");
        String branchname=request.getParameter("txtbranchname");
        String add=request.getParameter("txtaddress");
        String email=request.getParameter("txtemail");
        String phoneno=request.getParameter("txtphoneno");
        String temp=request.getParameter("txttemp");
          HttpSession session=request.getSession(true);
         BranchBean ojb=new BranchBean();
       
        
        
       
        
        
        
            if(request.getParameter("bt").equals("Insert")){
            
                
                
                
                
                
                
                
            boolean rs=ojb.insertBranch(branchID, branchname, add, email, phoneno);
            if(rs==true){
               
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Branch");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Branch'>Insert fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
         
            boolean rs=ojb.UpdateBranch(temp, branchname, add, email, phoneno);
            if(rs==true){
                
               
                session.removeAttribute("bri");
                session.removeAttribute("bran");
                session.removeAttribute("addr");
                session.removeAttribute("mail");
                session.removeAttribute("pho");
               
                
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Branch");
              
                
                
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Branch'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
           
            String bri=request.getParameter("branchID");
            boolean del=ojb.deleteUser(bri);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Branch.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
            String bri=request.getParameter("branchID");
                String bran=request.getParameter("branchname");
                 String addr=request.getParameter("address");
                String mail=request.getParameter("email");
                String pho=request.getParameter("phoneno");;
            
            /////////session
            
            session.setAttribute("bri", bri);
            session.setAttribute("bran", bran);
            session.setAttribute("addr",addr);
            session.setAttribute("mail",mail);
            session.setAttribute("pho", pho);
             session.setAttribute("p", request.getParameter("p"));
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateBranch.jsp?pageNum="+request.getParameter("p"));
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
