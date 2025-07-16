

package controller;

import Bean.CurriculumBean;
import java.io.*;
import java.net.*;
import java.text.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllCurriculum extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String curid=request.getParameter("txtcurid");
        String curname=request.getParameter("txtcurname");
        String period=request.getParameter("txtperiod");
        String fee=request.getParameter("txtfee");
        String temp=request.getParameter("txttemp");
        HttpSession session=request.getSession(true);
        //rollno, stname, gender, add, phone, email
        CurriculumBean ojb=new CurriculumBean();
        try {
            if(request.getParameter("bt").equals("Insert")){
                int afee=Integer.parseInt(fee);
                boolean rs=ojb.insertCurriculum(curid,curname,period,afee);
                if(rs==true){
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Curriculum");
                }else
                    out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Curriculum'>Insert fail back...!</a>");
            }
            if(request.getParameter("bt").equals("Update")){
                int afee=Integer.parseInt(fee);
                boolean rs=ojb.updateCurriculum(temp,curname,period,afee);
                if(rs==true){
                    session.removeAttribute("curid");
                    session.removeAttribute("curname");
                    session.removeAttribute("period");
                    session.removeAttribute("fee");
                    response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Curriculum");
                }else
                    out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Curriculum'>Insert fail back...!</a>");
            }
            if(request.getParameter("bt").equals("Delete")){
                String acurid=request.getParameter("curid");
                boolean del=ojb.deleteCurriculum(acurid);
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Curriculum.jsp?pageNum="+request.getParameter("p"));
            }
            if(request.getParameter("bt").equals("Edit")){
                String acurid=request.getParameter("curid");
                String acurname=request.getParameter("curname");
                String aperiod=request.getParameter("period");
                String bfee=request.getParameter("fee");
                
                /////////session
                
                session.setAttribute("curid", acurid);
                session.setAttribute("curname", acurname);
                session.setAttribute("period", aperiod);
                session.setAttribute("fee",bfee);
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=CurriculumUpdate.jsp?pageNum="+request.getParameter("p"));
            }
        } catch (Exception ex) {
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
