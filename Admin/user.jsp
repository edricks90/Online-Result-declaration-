<%@page contentType="text/html" import="java.util.Collection, Bean.*"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
if(session.getAttribute("un")==null){
    response.sendRedirect("Login.jsp");
//out.println("user khong the login");
}%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript" type="text/javascript" src="../script/validate.js"></script>
<script language="javascript">
   function kiemtra(){
        var username = document.form1.txtuname;
	var fullname = document.form1.txtfullname;
        var address = document.form1.txtaddress;
        var phone = document.form1.txtphone;
        var email = document.form1.txtemail;
        var question = document.form1.txtquestion;
        var pass = document.form1.txtpassword;
        var compass = document.form1.txtcomfpassword;
        
        
	if( laChuoiRong(username.value))
	{
            alert('Username must be not blank!');
            username.focus();
            return false;
	}
        if(username.value.length<4||username.value.length>16)
	{
            alert('Username invalid!');
            username.focus();
            return false;
	}
        if( laChuoiRong(pass.value))
	{
            alert('Password must be not blank!');
            pass.focus();
            return false;
	}
        if( laChuoiRong(compass.value))
	{
            alert('Password must be not blank!');
            compass.focus();
            return false;
	}
        if(pass.value.length<6)
        {
            alert('Password must be 6 characters or more!');
            pass.focus();
            return false;
	}
        if(pass.value!=compass.value)
	{
            alert('Comfirm password invalid!');
            compass.focus();
            return false;
	}
        if( laChuoiRong(fullname.value))
	{
            alert('Full name must be not blank!');
            fullname.focus();
            return false;
	}
        if( laChuoiRong(address.value))
	{
            alert('Address  must be not blank!');
            address.focus();
            return false;
	}
        if( laChuoiRong(phone.value))
	{
            alert('Phone  must be not blank!');
            phone.focus();
            return false;
	}
        if(!laSoNguyen(phone.value) )
	{
            alert('Phone number invalid!');
            phone.focus();
            return false;
	}
        if( laChuoiRong(email.value))
	{
            alert('Email  must be not blank!');
            email.focus();
            return false;
	}
        if( !laEmail(email.value) )
	{
            alert('Email invalid!, Ex: jhon@gmail.com');
            email.focus();
            return false;
	}
        if( laChuoiRong(question.value))
	{
            alert('Question  must be not blank!');
            question.focus();
            return false;
	}
         return true;
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
                    
                     <li     class="users current "><a href="indexAdmin2.jsp?page=Admin&url=user"  title="Users">User</a>
			
				<ul>
					
					
                                    <li  class="current"><a href="indexAdmin2.jsp?page=Admin&url=user" title="User Lists"> User Lists</a></li>
						
					<li  ><a href="indexAdmin2.jsp?page=Admin&url=addUser" title="Add Users"> Add Users </a></li>
				</ul>
                        </li>
			<li class="write " ><a href="indexAdmin2.jsp?page=Admin&url=Student" title="Student Manage">Student</a>
				<ul >
					<li  ><a href="indexAdmin2.jsp?page=Admin&url=Student" title="Student List">Student Lists</a></li>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=AddStudent" title="Add Students">Add Students</a></li>
			
				</ul>
			</li>
                        
                        
                        
                        <li class="home "><a href="indexAdmin2.jsp?page=Admin&url=Curriculum" title="Curriculum Manage">Curriculum</a>
				<ul>
					<li ><a href="indexAdmin2.jsp?page=Admin&url=Curriculum" title="Curriculum Lists">Curriculum Lists</a></li>
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
			<li class=" backup "><a href="indexAdmin2.jsp?page=Admin&url=Schedules" title="Schedules Manage">Schedules</a>
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
		
		
	
	</div></div>    
    
           
    
    
                       
                   <jsp:include page="Include/s_Login.jsp"/>
        
        
          
    
    
    
    
    
    
    
    
    
           
            <%
            /// Code Display data table
            UserBean ojb=new UserBean();
            Collection kq=ojb.getAlllist();
            request.setAttribute("profile", kq);
            %>            
            <%
            String g="";
            String id="";
            String s="";
            String fn="";
            String ad="";
            String pho="";
            String branch="";
            String mail="";
            String q="";
            if(session.getAttribute("eid")!=null){
                id=session.getAttribute("eid").toString();
                fn=session.getAttribute("efullname").toString();
                ad=session.getAttribute("eAddress").toString();
                pho=session.getAttribute("ephone").toString();
                branch=session.getAttribute("ebranchid").toString();
                mail=session.getAttribute("eemail").toString();
                g=session.getAttribute("egender").toString();
                s=session.getAttribute("estatus").toString();
                q=session.getAttribute("equestion").toString();
            }
            %>
            
            <%
            



%>
            
            
            
            <%
            if(session.getAttribute("permission")!=null){
                if(session.getAttribute("permission").equals("Admin")){%>
            
                
                
        
        	
        
        
        
        
        
        <!-- Help_Bar -->
        
        
       
                
                
                
        
        
              
            
                
             <article class="container_12">
                  <section class="grid_12">
			<div class="block-border"><form class="block-content form" name="formSuser" id="formSuser" method="get" action="Serachuser">
				<h1>
					Search Users
					
				</h1>
				
				<div class="block-controls">
					<span class="input-type-text"><input type="text" name="txtsearch" id="stats-period" value=""></span>
                                    <button type="submit" name="bt" value="Search" ><img src="images/icons/fugue/tick-circle.png" width="16" height="16"> Search </button>
					
				</div>
				
				<div class="with-head no-margin">
					
					
				
				</div>
				
				<ul class="message no-margin">
					<li>Results 1 - 5 out of 47</li>
				</ul>
				
				
					
			</form></div>
		</section>
                 
                 
          
		
		<section class="grid_12">
			<div class="block-border"><form class="block-content form" id="table_form" method="post" action="">
                             
                                    
                              
				<h1>User Manage</h1>
				
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
                                    
                                       <c:if test="${not empty profile}">
                                   
                                    <table class="table" cellspacing="0" width="100%">
				 
					<thead>
						<tr>
							<th class="black-cell"><span class="loading"></span></th>
							<th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up active"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								User Name
							</th>
							<th scope="col">Status</th>
							<th scope="col">Real Name</th>
							<th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								Address
							</th>
							<th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								Phone
							</th>
                                                        <th scope="col">
								<span class="column-sort">
									<a href="#" title="Sort up" class="sort-up"></a>
									<a href="#" title="Sort down" class="sort-down"></a>
								</span>
								Branch Name
							</th>
							<th scope="col" class="table-actions">Email</th>
                                                        <th scope="col" class="table-actions">Gender</th>
                                                        <th scope="col" class="table-actions">Action</th>
						</tr>
					</thead>
					
					<tbody>
						
                                            <c:set var="count" value="0"/>
                    <pg:paging pageSize="5" url="indexAdmin2.jsp?page=Admin&url=user"> 
                        <c:forEach items="${requestScope.profile}" var="rows">
                            <pg:item> 
                                <c:set var="count" value="${count+1}" />
                                            
                                            
                                            
                                            
						<tr>
							
                                                        <td scope="row" class="table-check-cell"    > ${count}  </td>
							<td><c:out value="${rows.username}" /></td>
							<td><ul class="keywords">
								<li><a href="#"><c:out value="${rows.status}" /></a></li>
								
							</ul></td>
							<td><a href="#"><small><c:out value="${rows.fullname}" /></small></a></td>
							<td><c:out value="${rows.address}" /></td>
							<td><c:out value="${rows.phone}" /></td>
                                                        <td><c:out value="${rows.branchid}" /></td>
                                                        <td><c:out value="${rows.email}" /></td>
                                                        <td><c:out value="${rows.gender}" /></td>
                                                         <c:url var="edit" value="../controllUser">
                                        <c:param name="bt" value="Edit" />
                                        <c:param name="username" value="${rows.username}" />
                                        <c:param name="fullname" value="${rows.fullname}" />
                                        <c:param name="address" value="${rows.address}" />
                                        <c:param name="phone" value="${rows.phone}" />
                                        <c:param name="branchid" value="${rows.branchid}" />
                                        <c:param name="email" value="${rows.email}" />
                                        <c:param name="gender" value="${rows.gender}" />
                                        <c:param name="question" value="${rows.question}" />
                                        <c:param name="status" value="${rows.status}" />
                                        <c:param name="p" value="${param.pageNum}"/> 
                                    </c:url> 
                                                        <c:url var="delete" value="../controllUser">
                                        <c:param name="bt" value="Delete" />
                                        <c:param name="username" value="${rows.username}" />
                                        <c:param name="p" value="${param.pageNum}"/>
                                                        </c:url>
                                                        
                                                        
							<td class="table-actions">
								<a href="${edit}" title="Edit" class="with-tip"><img src="images/icons/fugue/pencil.png" width="16" height="16"></a>
								<a href="${delete}" onclick="return confirm('Do you really want to delete these records ?')" title="Delete" class="with-tip"><img src="images/icons/fugue/cross-circle.png" width="16" height="16"></a>
							</td>
						</tr>
						
						<tr>
							<th scope="row" class="table-check-cell"></th>
							<td></td>
							<td><ul class="keywords">
								
							</ul></td>
							<td><a href="#"><small></small></a></td>
							<td></td>
							<td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
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
                   
                                       </c:if>
                                
                                
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
                
                 
               
                
                
                
                
                
                
                
               
                
        
        <%}else {
                    out.println("You must be permission Admin!");
                    response.sendRedirect("Student.jsp");
        }
        }%>
    </body>
</html>

