

package controller;

import Bean.SchedulesBean;
import java.io.*;
import java.net.*;
import java.sql.Date;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Rakesh Chander
 */
public class ControllSchedules extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String scheid=request.getParameter("txtscheid");
        String updatescheid=request.getParameter("txtup");
        String subid=request.getParameter("ddlsubid");
        String schename=request.getParameter("txtschename");
        String fee=request.getParameter("txtfee");
        //int afee=Integer.parseInt(fee);
        String startdate=request.getParameter("txtstartdate");
        String enddate=request.getParameter("txtenddate");
        String dateexam=request.getParameter("txtdateexam");
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session=request.getSession(true);
        SchedulesBean ojb=new SchedulesBean();
//        try {
        
        if(request.getParameter("bt").equals("Insert")){
            int afee=Integer.parseInt(fee);
            boolean rs=ojb.insertSchedules(scheid, subid,schename, afee,startdate, enddate ,dateexam);
            if(rs==true){
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Schedules");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Schedules'>Insert  fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Update")){
//                java.sql.Date astartdate = new java.sql.Date(format.parse(startdate).getTime());
//                java.sql.Date aenddate = new java.sql.Date(format.parse(enddate).getTime());
//                java.sql.Date adateexam = new java.sql.Date(format.parse(dateexam).getTime());
            int afee=Integer.parseInt(fee);
            boolean rs=ojb.updateSchedules(updatescheid, subid,schename, afee, startdate, enddate, dateexam);
            if(rs==true){
                session.removeAttribute("scheid");
                session.removeAttribute("schename");
                session.removeAttribute("fee");
                session.removeAttribute("startdate");
                session.removeAttribute("enddate");
                session.removeAttribute("dateexam");
                response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Schedules");
            }else
                out.println("<a href='Admin/indexAdmin2.jsp?page=Admin&url=Schedules'>Update fail back...!</a>");
        }
        if(request.getParameter("bt").equals("Delete")){
            String ascheid=request.getParameter("scheid");
            boolean del=ojb.deleteSchedules(ascheid);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=Schedules.jsp?pageNum="+request.getParameter("p"));
        }
        if(request.getParameter("bt").equals("Edit")){
            String ascheid=request.getParameter("scheid");
            // String asubid=request.getParameter("subid");
            String aschename=request.getParameter("schename");
            String bfee=request.getParameter("fee");
            //int a=Integer.parseInt(bfee);
            String sdate=request.getParameter("startdate");
            String estdate=request.getParameter("enddate");
            String dexam=request.getParameter("dateexam");
            /////////session
            
            session.setAttribute("scheid", ascheid);
            // session.setAttribute("subid", asubid);
            session.setAttribute("schename",aschename);
            session.setAttribute("fee",bfee);
            session.setAttribute("startdate",sdate);
            session.setAttribute("enddate",estdate);
            session.setAttribute("dateexam", dexam);
            response.sendRedirect("Admin/indexAdmin2.jsp?page=Admin&url=UpdateSchedules.jsp?pageNum="+request.getParameter("p"));
        }
//        } catch (ParseException ex) {
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
