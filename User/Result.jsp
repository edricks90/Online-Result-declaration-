<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="Bean.*"%>
<%@page import="javax.swing.text.html.HTMLDocument.Iterator"%>
<%@page import="Bean.ExamMarkBean"%>
<%@page import="java.util.Collection"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Declaration Board</title>
        
         <!-- Global stylesheets -->
	 <!-- Global stylesheets -->
	
	
	<!-- Comment/uncomment one of these files to toggle between fixed and fluid layout -->
	<!--<link href="css/960.gs.css" rel="stylesheet" type="text/css">-->
	<link href="css/960.gs.fluid.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles -->
	<link href="css/simple-lists.css" rel="stylesheet" type="text/css">
	<link href="css/block-lists.css" rel="stylesheet" type="text/css">
	<link href="css/planning.css" rel="stylesheet" type="text/css">
	<link href="css/table.css" rel="stylesheet" type="text/css">
	<link href="css/calendars.css" rel="stylesheet" type="text/css">
	<link href="css/wizard.css" rel="stylesheet" type="text/css">
	<link href="css/gallery.css" rel="stylesheet" type="text/css">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="icon" type="image/png" href="favicon-large.png">
	
	<!-- Generic libs -->
	<script type="text/javascript" src="js/html5.js"></script>				<!-- this has to be loaded before anything else -->
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/old-browsers.js"></script>		<!-- remove if you do not need older browsers detection -->
	
	<!-- Template libs -->
	<script type="text/javascript" src="js/jquery.accessibleList.js"></script>
	<script type="text/javascript" src="js/searchField.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/standard.js"></script>
	<!--[if lte IE 8]><script type="text/javascript" src="js/standard.ie.js"></script><![endif]-->
	<script type="text/javascript" src="js/jquery.tip.js"></script>
	<script type="text/javascript" src="js/jquery.hashchange.js"></script>
	<script type="text/javascript" src="js/jquery.contextMenu.js"></script>
	
	<!-- Custom styles lib -->
	<script type="text/javascript" src="js/list.js"></script>
	
	<!-- Charts library -->
	<!--Load the AJAX API-->
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">
	
		// Load the Visualization API and the piechart package.
		google.load('visualization', '1', {'packages':['corechart']});
		
	</script>
	
	<!-- Example context menu -->
	<script type="text/javascript">
	
		$(document).ready(function()
		{
			// Context menu for all favorites
			$('.favorites li').bind('contextMenu', function(event, list)
			{
				var li = $(this);
				
				// Add links to the menu
				if (li.prev().length > 0)
				{
					list.push({ text: 'Move up', link:'#', icon:'up' });
				}
				if (li.next().length > 0)
				{
					list.push({ text: 'Move down', link:'#', icon:'down' });
				}
				list.push(false);	// Separator
				list.push({ text: 'Delete', link:'#', icon:'delete' });
				list.push({ text: 'Edit', link:'#', icon:'edit' });
			});
			
			// Extra options for the first one
			$('.favorites li:first').bind('contextMenu', function(event, list)
			{
				list.push(false);	// Separator
				list.push({ text: 'Settings', icon:'terminal', link:'#', subs:[
					{ text: 'General settings', link: '#', icon: 'blog' },
					{ text: 'System settings', link: '#', icon: 'server' },
					{ text: 'Website settings', link: '#', icon: 'network' }
				] });
			});
		});
	
	</script>
        
	
	<!-- Comment/uncomment one of these files to toggle between fixed and fluid layout -->
	<!--<link href="css/960.gs.css" rel="stylesheet" type="text/css">-->

	
	<!-- Custom styles -->
	<link href="css/simple-lists.css" rel="stylesheet" type="text/css">
	<link href="css/block-lists.css" rel="stylesheet" type="text/css">
	<link href="css/planning.css" rel="stylesheet" type="text/css">
	<link href="css/table.css" rel="stylesheet" type="text/css">
	<link href="css/calendars.css" rel="stylesheet" type="text/css">
	<link href="css/wizard.css" rel="stylesheet" type="text/css">
	<link href="css/gallery.css" rel="stylesheet" type="text/css">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="icon" type="image/png" href="favicon-large.png">
	
	<!-- Generic libs -->
	
	
	<!-- Custom styles lib -->
	
	
	<!-- Charts library -->
	<!--Load the AJAX API-->


	
	<!-- Example context menu -->
	
        
        
        
        
        
        
        
        
        
        
        
     

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="css/main.css">  
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    </head>
    <body>
    
     <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        
        <!-- CONTENT -->
    
    
    
    
    
     <div id="contentBk" class="clearfix">

            <div id="content">
                <div class="topImg clearfix">
                    <img src="img/headers/header_2.jpg" alt="About Us">
                    <p>Your <strong> Exam Result</strong></p>
                </div>

                <div class="wrapper">

                    <div class="course column c-67 clearfix">

                       

                        <h3 class="title">Exam <strong>Result</strong></h3>

                        <table class="box">
                             <tr class="tableHeader">
                                <th>Roll.No</th>
                <th>Branch</th>
                <th>Curriculum </th>
                <th>Student</th>
                <th>Subject</th>
                <th>Date</th>
                <th>Mark</th>
                
                <th>Semester</th>
                <th>Status</th>
                <th>Percentage</th>
                <th>Grade</th>
                <th>Faculty</th>
                             </tr>
                              <c:set var="count" value="0"/>
                    <pg:paging pageSize="5" url="indexAdmin2.jsp?page=Admin&url=ExamMark">          
             <pg:item> 
                             <%
                        ExamMarkBean exam = new ExamMarkBean();
                        try {
                            Collection<Listfullexam>  c = exam.getListfull();
                            //request.setAttribute("listmark", co);
                            for(Listfullexam   l: c) 
                            {
            %>
                 
            <tr>
                                  <td><%=l.getRollno()%></td>
                  <td><%=l.getBranchname()%></td>
                 <td><%=l.getCurname()%></td>
                   <td><%=l.getFullname()%></td>
                   <td><%=l.getSubject()%></td>
                   <td><%=l.getDateexam()%></td>
                   <td><%=l.getMark()%></td>
                 <td><%=l.getSemname()%></td>
                 
                
                
                <td><%


                            float  a =l.getMark();
                     if(a<45)
                     {%>
                        Fail
                     <%}
                     else
                     {%>
                        Pass
                     <%}
                        %></td>
                
                
                
                
                
                
                <td>
                
               
                <%=l.getMark()%> %
                
                </td>
                
                
                 <td>
                
               
                <%


                            float  b =l.getMark();
                     if(b<45)
                     {%>
                        Poor
                        
                        
                        <%}
                                                 else if(b <75 && b>50)
                     {%> 
                        
                     Very Good
                        
                       <%}
                                                 else if(b >75)
                     {%> 
                        
                     Distinction
                     
                     
                     <%}
                                                 else if(b >85)
                     {%> 
                        
                     Excellent
                     
                     
                        
                     <%}
                     else
                     {%>
                        Good
                     <%}
                        %>
                
                </td>
                
                
                <td><%=l.getFname()%></td>
                             </tr>
                             
                             
                             
                             
                              <%                            }
                        } catch (Exception ex) {
                        }
            %>

            </pg:item>
             <pg:index>
                                                     <ul class="controls-buttons">
                                                         
						
						<li><pg:page><b><%=thisPage%></b></pg:page></li>
						<li><pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [  Previous   ]</pg:firstPage></li>
						<li><pg:lastPage>[  Next  ] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage></li>
                       
                                                     </ul>
                            
                        </pg:index> 
   </pg:paging>
                        </table>
                    </div>

                    <div id="sidebar" class="column c-33 clearfix">

                       

                       
                        
                      

                    </div> 

                </div>

            </div>
        </div>
        
        <!-- FOOTER -->

        <jsp:include page="Footer.jsp"/>

        <!-- END SITE CONTENT -->
        
        <!-- END SITE CONTENT -->

        <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="js/jquery.flexslider-min.js"></script>
        <script src="js/scripts.js"></script>

</body>
</html>
