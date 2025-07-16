<%@page contentType="text/html" import="java.util.Collection, Bean.*"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             
            
      
            
            
                      
            <div id="status-bar"><div class="container_12">
                    
                    <%if( session.getAttribute("un")!=null )  {
                %>
		<ul id="status-infos">
                   <li class="spaced">Logged as: <strong><%=session.getAttribute("un").toString()%></strong></li>
			<li>
				<a href="indexAdmin2.jsp?page=Admin&url=ChangePassword" class="button" title="Changed Password"> <strong>Changed Password</strong></a>
				
			</li>
			<li>
				<a href="indexAdmin2.jsp?page=Admin&url=ResetPassword" class="button" title="Re-set Password"> <strong>Re-set Password</strong></a>
			
			</li>
			<li><a href="indexAdmin.jsp?page=Admin&url=Login" class="button red" title="Logout"><span class="smaller">LOGOUT</span></a></li>
		</ul>
		
		
	
                </div></div>          
                        
        
        <div id="header-shadow"></div>
        
        <div id="control-bar" class="grey-bg clearfix"><div class="container_12">
	
		<div class="float-left">
			
		</div>
		
		<div class="float-right"> 
			
		</div>
			
	</div></div>
        
        
        
     
        
        
        
        
        
        
        
        
        
       <%}else{%>
                <div id="menu_horizontal"><a href="indexAdmin.jsp?page=Admin&url=Login">login</a></div>
                <%}%>
    </body>
</html>
