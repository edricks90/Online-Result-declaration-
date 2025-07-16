<%@page contentType="text/html" import="java.util.Collection, Bean.*"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="css/main.css">  
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    </head>
    <body>
        
        
        
          <jsp:include page="Header.jsp"/>
        
        <%
            NotificationBean ojb=new NotificationBean();
            Collection kq=ojb.getListfull();
            request.setAttribute("st", kq);
            %>
            
            
            
            <div id="contentBk" class="clearfix">

            <div id="content">
                <div class="topImg clearfix">
                    <img src="img/headers/header_1.jpg" alt="About Us">
                    <p>OUR <strong>NOTIFICATION</strong></p>
                </div>

                <div class="wrapper">

                    <div class="course column c-67 clearfix">
                        
                        
                        
                        <div class="course column c-67 clearfix">

                            <h3 class="title">Recent&nbsp;&nbsp;-<strong>Notice</strong></h3>
 <c:set var="count" value="0"/>
                    <pg:paging pageSize="2" url="Notification.jsp"> 
                       <c:forEach items="${st}" var="s">
                            <pg:item> 
                        
                               <div class="box">
                            <ul class="courseId">
                                <li> <c:out value="${s.notitle}"/></li>
                                <li>Notice:- ${s.noid}</li>
                            </ul>
                            <div class="boxInfo">
                                <p>${s.noinfo}</p>
                            </div>
                            <div class="courseInfo">
                                <p class="courseTime">Date:-${s.nodate}</p>
                                <ul>
                                    
                                </ul>
                            </div>
                        </div>
                                
                                
                                 <c:url var="edit" value="../ControllNotification">
                                        <c:param name="bt" value="Edit" />
                                        <c:param name="no" value="${s.noid}" />
                                        <c:param name="not" value="${s.notitle}" />
                                        <c:param name="noi" value="${s.noinfo}" />
                                        <c:param name="nod" value="${s.nodate}" />
                                        <c:param name="p" value="${param.pageNum}"/> 
                                    </c:url> 
                                                        <c:url var="delete" value="../ControllNotification">
                                        <c:param name="bt" value="Delete" />
                                        <c:param name="no" value="${s.noid}" />
                                       <c:param name="p" value="${param.pageNum}"/> 
                                                        </c:url>

                                
                                
                                
                                </pg:item> 
                        </c:forEach>
                                                 <pg:index>
                                                    
                                                         
						
						<pg:page><b><%=thisPage%></b></pg:page>
						<pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [Previous]</pg:firstPage>
						<pg:lastPage>[Next] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage>                      
                                                     
                            
                        </pg:index> 
                   
                    </pg:paging> 	
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
            </div>
            
            
            
            
           <jsp:include page="Footer.jsp"/> 
            
    </body>
</html>
