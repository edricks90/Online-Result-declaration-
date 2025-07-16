<%@page contentType="text/html" import="java.util.Collection, Bean.*"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
if(session.getAttribute("un")==null){
    response.sendRedirect("indexAdmin.jsp?page=Admin&url=Login");
    out.println("You must be login..!");
}else{%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript" type="text/javascript" src="../script/validate.js"></script>
<script language="javascript">
       function kiemtra(){
            var curid = document.form1.txtcurid;
            var curname = document.form1.txtcurname;
            var curperiod = document.form1.txtperiod;
            var curfee = document.form1.txtfee;
            if( laChuoiRong(curid.value))
            {
                alert('Curriculum ID is not blank!');
                curid.focus();
                return false;
            }
            if( laChuoiRong(curname.value))
            {
                alert('Curriculum name is not blank!');
                curname.focus();
                return false;
            }
            if( laChuoiRong(curperiod.value))
            {
                alert('Curriculum period is not blank!');
                curperiod.focus();
                return false;
            }
            if( laChuoiRong(curfee.value))
            {
                alert('Curriculum fee is not blank!');
                curfee.focus();
                return false;
            }
            if(!laSoNguyen(curfee.value) )
            {
                alert('Curriculum fee is number!');
                curfee.focus();
                return false;
            }
            
       }
</script>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- Global stylesheets -->
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/common.css" rel="stylesheet" type="text/css">
	<link href="css/form.css" rel="stylesheet" type="text/css">
	<link href="css/standard.css" rel="stylesheet" type="text/css">
	
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
        
        
        
    </head>
    <body>
     
        <nav id="main-nav">
                    
		<ul class="container_12"  >
                    
                     <li     class="users "><a href="indexAdmin2.jsp?page=Admin&url=user"  title="Users">User</a>
			
				<ul>
					
					
					<li ><a href="indexAdmin2.jsp?page=Admin&url=user" title="User Lists"> User Lists</a></li>
						
					<li  ><a href="indexAdmin2.jsp?page=Admin&url=addUser" title="Add Users"> Add Users </a></li>
				</ul>
                        </li>
			<li class="write " ><a href="indexAdmin2.jsp?page=Admin&url=Student" title="Student Manage">Student</a>
				<ul >
					<li  ><a href="indexAdmin2.jsp?page=Admin&url=Student" title="Student List">Student Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddStudent" title="Add Students">Add Students</a></li>
			
				</ul>
			</li>
                        
                        
                        
                        <li class="home current"><a href="indexAdmin2.jsp?page=Admin&url=Curriculum" title="Curriculum Manage">Curriculum</a>
				<ul>
                                    <li class="current" ><a href="indexAdmin2.jsp?page=Admin&url=Curriculum" title="Curriculum Lists">Curriculum Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddCurriculum" title="Add Curriculum Lists">Add Curriculum Lists </a></li>
				</ul>
			</li>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
			<li class="comments "><a href="indexAdmin2.jsp?page=Admin&url=Subject" title="Subjects Manage">Subjects</a>
				<ul>
					
					<li ><a href="indexAdmin2.jsp?page=Admin&url=Subject" title="Lists Of Subjects"> Lists Of Subjects</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=ADDSubject" title="Add Subjects">Add Subjects </a></li>
				</ul>
			</li>
			<li class="medias"><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Manage">Marks</a>
				<ul>
					
					<li ><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Lists">Exam Marks Lists</a></li>
                                        <li ><a href="indexAdmin2.jsp?page=Admin&url=AddExam" title="Add Exam Mark">Add Exam Mark  </a></li>
				</ul>
			</li>
			<li class="backup "><a href="indexAdmin2.jsp?page=Admin&url=Schedules" title="Schedules Manage">Schedules</a>
				<ul>
					<li ><a href="indexAdmin2.jsp?page=Admin&url=Schedules" title="Schedules Lists">Schedules Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddSchedules" title="Add Schedules">Add Schedules  </a></li>
				</ul>
			</li>
                        
                        
                        
                        
                        
                        
                        <li class="stats "><a href="indexAdmin2.jsp?page=Admin&url=ReRegistration" title="Registration">Registration</a>
			
                        <ul>
			                <li ><a href="indexAdmin2.jsp?page=Admin&url=ReRegistration" title="Registration">RE-Registration Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddReRegistration" title="AddRegistration">Add RE-Registration  </a></li>
                        </ul>              
                           </li>             
                         <li class="settings"><a href="indexAdmin2.jsp?page=Admin&url=Branch" title="Branch">Branch</a>
                         <ul>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=Branch" title="BranchLists">Branch Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddBranch" title="AddBranch">Add Branch  </a></li>
                            </ul> 
                             
                             </li>
                              <li class="semester "><a href="indexAdmin2.jsp?page=Admin&url=Semester" title="Semester">Semester</a>
                         <ul>
                                        <li ><a href="indexAdmin2.jsp?page=Admin&url=Semester" title="SemesterLists">Semester Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddSemester" title="AddSemester">Add Semester  </a></li>
                            </ul> 
                             
                             </li>  
                             
                             
                             <li class="notification"><a href="indexAdmin2.jsp?page=Admin&url=Notification" title="Notification">Notification</a>
                         <ul>
                             <li ><a href="indexAdmin2.jsp?page=Admin&url=Notification" title="NotificationLists">Notification Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddNotification" title="AddNotification">Add Notification  </a></li>
                            </ul> 
                             
                             </li> 
                             
             
                             
		</ul>
                    
                  
                    
	</nav> 
    
     <div id="sub-nav"><div class="container_12">
		
		
	
	</div>
         
     </div>    
      
                   <jsp:include page="Include/s_Login.jsp"/>
            
          
            
                   
         
              
            
        <%
        CurriculumBean ojb=new CurriculumBean();
        Collection kq=ojb.getListCurriculum();
        request.setAttribute("st", kq);
        %>
                
             <article class="container_12">
              
                 
                 
          
		
		<section class="grid_12">
			<div class="block-border"><form class="block-content form" id="table_form" method="post" action="">
                             
                                    
                              
				<h1>Curriculum Manage</h1>
				
				<div class="block-controls">
					
					<ul class="controls-buttons">
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						
						<li></li>
					</ul>
					
				</div>
			
				<div class="no-margin">
                                    
                                       
                                   
                                    <table class="table" cellspacing="0" width="100%">
				 
					<thead>
						<tr>
							<th class="black-cell"><span class="loading"> </span></th>
							<th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up active"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								 Curriculum Name
							</th>
							
							<th scope="col">Time Period</th>
							<th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								Fee 
							</th>
							
                                                        <th scope="col" class="table-actions">Action</th>
						</tr>
					</thead>
					
					<tbody>
						
                                            <c:set var="count" value="0"/>
                    <pg:paging pageSize="5" url="indexAdmin2.jsp?page=Admin&url=Curriculum"> 
                       <c:forEach items="${st}" var="s">
                            <pg:item> 
                                
                                            
                                            
                                            
                                            
						<tr>
							
                                                    <td scope="row" class="table-check-cell "> <ul class="keywords"><li class="orange-keyword"><c:out value="${s.curid}" /></li> </ul> </td>
							
							<td><ul class="keywords">
								<li><a href="#">${s.curname}</a></li>
								
							</ul></td>
                                                        <td><ul class="keywords"><li class="brown-keyword">${s.period}</li></ul></td>
                                                       
							<td><ul class="keywords"><li class="green-keyword">${s.fee}</li></ul></td>
                                                        
                                                         <c:url var="edit" value="../ControllCurriculum">
                                        <c:param name="bt" value="Edit" />
                                        <c:param name="curid" value="${s.curid}" />
                                        <c:param name="curname" value="${s.curname}" />
                                        <c:param name="period" value="${s.period}" />
                                        <c:param name="fee" value="${s.fee}" />
                                        
                                        <c:param name="p" value="${param.pageNum}"/> 
                                    </c:url> 
                                                        <c:url var="delete" value="../ControllCurriculum">
                                        <c:param name="bt" value="Delete" />
                                        <c:param name="curid" value="${s.curid}" />
                                       <c:param name="p" value="${param.pageNum}"/> 
                                                        </c:url>
                                                        
                                                        <% if(session.getAttribute("permission")!=null){
                                    if(session.getAttribute("permission").equals("Academic")){%>
							<td class="table-actions">
                                                            
								<a href="${edit}" title="Edit" class="with-tip"><img src="images/icons/fugue/pencil.png" width="16" height="16"></a>
                                                    <%    
                                    }
                                %>
                                <% 
                                    if(session.getAttribute("permission").equals("Admin")){%>            
                                                                
                                                                
                                                                
								
                                                                
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        <td class="table-actions">
                                                            
								<a href="${edit}" title="Edit" class="with-tip"><img src="images/icons/fugue/pencil.png" width="16" height="16"></a>
                                                                
                                                                
                                                                
                                                                
								<a href="${delete}" onclick="return confirm('Do you really want to delete these records ?')" title="Delete" class="with-tip"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"></a>
							</td>
                                                        
                                                        
                                                      <%    
                                    }
                                %>
                                <%}%>  
                                                        
                                                        
						</tr>
						
						<tr>
							<th scope="row" class="table-check-cell"></th>
							<td></td>
							<td><ul class="keywords">
								
							</ul></td>
							<td><a href="#"><small></small></a></td>
							
                                                        
                                                        
							<td class="table-actions">
								<a href="#" title="Edit" class="with-tip"></a>
								<a href="#" title="Delete" class="with-tip"></a>
							</td>
						</tr>
						
						
					</pg:item> 
                        </c:forEach>
                                                 <pg:index>
                                                     <ul class="controls-buttons">
                                                         
						
						<li><pg:page><b><%=thisPage%></b></pg:page></li>
						<li><pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [  Previous   ]</pg:firstPage></li>
						<li><pg:lastPage>[  Next  ] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage></li>
                       
                                                     </ul>
                            
                        </pg:index> 
                   
                    </pg:paging> 			
                        				
						
					</tbody>
			
				</table>
                   
                                     
                                
                                
                                </div>
			
                            
				
				
				<div class="block-footer">
					<div class="float-right">
						
					</div>
					
					
					
					<span class="sep"></span>
					
                                </div>
                            </form>
				</div>
					
			
                                                        
                       
                                      
                       
                   
                        
                       
                   
		</section>
            
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                     
                     
        </article>
                
                 
               
                
                
                
                
                
                
                
               
                
        
       
    </body>
</html>
<%}%>

