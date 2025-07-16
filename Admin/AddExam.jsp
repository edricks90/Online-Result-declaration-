<%-- 
    Document   : AddExam
    Created on : Apr 25, 2013, 2:03:18 PM
    Author     : Shiv
--%>

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
            var examtime = document.form1.ExamTimes;
            var mark = document.form1.Marks;
            var dateexam = document.form1.txtdateexam;
            if( laChuoiRong(examtime.value))
            {
                alert('Exam time is not blank!');
                examtime.focus();
                return false;
            }
            if( laChuoiRong(mark.value))
            {
                alert('Mark is not blank!');
                mark.focus();
                return false;
            }
            if( laChuoiRong(dateexam.value))
            {
                alert('Date exam is not blank!');
                dateexam.focus();
                return false;
            }
            if(!laSoNguyen(examtime.value))
            {
                alert('Examtimes is number!');
                examtime.focus();
                return false;
            }
            if(!laso(mark.value))
            {
                alert('Mark is number!');
                mark.focus();
                return false;
            }
            if(mark.value>100)
            {
                alert('Mark must be greater than or equal to 0 and or equal to 100 !');
                mark.focus();
                return false;
            }
            if(!laNgay(dateexam.value))
            {
                alert('Date exam invail !');
                dateexam.focus();
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
        
        <link href="css/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css">
        
          <link href="css/jquery-ui-1.10.2.custom.min.css" rel="stylesheet" type="text/css">
   
<script type="text/javascript" src="Jquery/jquery-1.9.1.js"></script>	
<script type="text/javascript" src="Jquery/jquery-ui-1.10.2.custom.js"></script>
<script type="text/javascript" src="Jquery/jquery-ui-1.10.2.custom.min"></script>

<script>
 $(function() {
    $( "#datepicker" ).datepicker({
      showOn: "button",
      buttonImage: "images/icons/fugue/calendar-month.png",
      buttonImageOnly: true
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
			<li class="medias current"><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Manage">Marks</a>
				<ul>
					
					<li ><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Lists">Exam Marks Lists</a></li>
                                        <li class="current" ><a href="indexAdmin2.jsp?page=Admin&url=AddExam" title="Add Exam Mark">Add Exam Mark  </a></li>
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

                   
                    <article class="container_12">
               
                   
                    <section class="grid_8">
			<div class="block-border"><div class="block-content">
				<!-- We could put the menu inside a H1, but to get valid syntax we'll use a wrapper -->
				<div class="h1 with-menu">
					<h1>Add Exam Marks</h1>
					<div class="menu">
						<img src="images/menu-open-arrow.png" width="16" height="16">
					
					</div>
				</div>
			
				<div class="block-controls">
					
					<ul class="controls-tabs js-tabs same-height with-children-tip">
						<li><a href="#tab-stats" title="Charts"><img src="images/icons/web-app/24/Bar-Chart.png" width="24" height="24"></a></li>
						
					</ul>
					
				</div>
				<%
        StudentBean stu=new StudentBean();
        Collection kq=stu.getListStudent();
        request.setAttribute("st1", kq);
        
        String r="";String m="";String ma=""; String d=""; String drop=""; String sem="";
        if(session.getAttribute("exameID")!=null){
            r=session.getAttribute("exameID").toString();
            m=session.getAttribute("examTime").toString();
            ma=session.getAttribute("mark").toString();
            d=session.getAttribute("date").toString();
            drop=session.getAttribute("subject").toString();
            sem=session.getAttribute("semester").toString();
        }
        %>
        <%
        SubjectBean subject=new SubjectBean();
        Collection sub=subject.getListSubject();
        request.setAttribute("sts", sub);
        %>
        
        <%
        SemesterBean semester=new SemesterBean();
        Collection  ls =semester.getListSemester();
        request.setAttribute("sts2", ls);
        
        %>
        
          <%
        CurriculumBean ojb=new CurriculumBean();
        Collection kq1=ojb.getListCurriculum();
        request.setAttribute("st2", kq1);
        %>
        
        <% 
            BranchBean  bb =new BranchBean();
            
         Collection profile =bb.getAllbranchlist();
        request.setAttribute("br", profile);


%>
      

 <%
            UserBean ojb4=new UserBean();
            Collection mp=ojb4.getAlllist();
            request.setAttribute("us", mp);
            %>

				<form action="../ControllExamMark"  method="post"  name="form1" class="form" id="form1" onsubmit="return kiemtra()" >
				 
                
                
						<fieldset class="grey-bg">
						<legend><a href="#">Options</a></legend>
                                                <table>
						<div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Roll.No</label></td>
                                                    <td>
                                                        <select name="roll" id="stats-sites-0">
								
								<c:forEach items="${st1}" var="student">
                                                                <option value="${student.rollno}">${student.rollno}</option>
                                                                </c:forEach>
							</select>
                                                    
                                                    <input type="hidden" name="tempsubid" value="" />
                                                    
                                                    </td>
                                                   
                                                   
                                                    </tr>
						</div>
                                                    
                                                    
                                                    
                                                   <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                 
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Subject ID</label></td>
                                                    <td>
                                                       
                        
                      
                                                        <select name="subid" id="stats-sites-0">
								<c:forEach items="${sts}" var="subj">
                             
                                <option selected="selected" value="${subj.subID}">${subj.subID}</option>
                            </c:forEach>
								
							</select>
                                                    
                                                    </td>
                                                    </tr>
						</div>
                                                    
                                                     <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                  
                                                    
                                                  <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Semester ID</label></td>
                                                    <td>
                                                        
                        
                      
                                                         <select name="semid" id="stats-sites-0">
								<c:forEach items="${sts2}" var="sem">
                             
                                <option selected="selected" value="${sem.semid}">${sem.semid}</option>
                            </c:forEach>
								
							</select>
                                                    
                                                    </td>
                                                    </tr>
						</div>   
                                                    
                                                    
                                                    
                                                     <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                  
                                                    
                                                  <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Curriculum ID</label></td>
                                                    <td>
                                                       
                        
                 
                                                         <select name="curid" id="stats-sites-0">
								<c:forEach items="${st2}" var="cur">
                             
                                <option selected="selected" value="${cur.curid}">${cur.curid}</option>
                            </c:forEach>
								
							</select>
                                                    
                                                    </td>
                                                    </tr>
						</div>   
                                                    
                                                    
                                                    
                                                    
                                                  <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                  
                                                    
                                                  <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Branch ID</label></td>
                                                    <td>
                                                       
                        
                 
                                                         <select name="branchid" id="stats-sites-0">
								<c:forEach items="${br}" var="b">
                             
                                <option selected="selected" value="${b.branchID}">${b.branchID}</option>
                            </c:forEach>
								
							</select>
                                                    
                                                    </td>
                                                    </tr>
						</div>     
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                  
                                                    
                                                  <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Faculty Name</label></td>
                                                    <td>
                                                       
                        
                 
                                                         <select name="username" id="stats-sites-0">
								<c:forEach items="${us}" var="u">
                             
                                <option selected="selected" value="${u.username}">${u.username}</option>
                            </c:forEach>
								
							</select>
                                                    
                                                    </td>
                                                    </tr>
						</div>    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                   
                                                    
                                                    <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Duration Exam Time</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="examTime" id="stats-period" value=""></span></td>
                                                    </tr>
						</div>
                                                    
                                                    <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Total Marks</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="mark" id="stats-period" value=""></span></td>
                                                    </tr>
						</div>
                                                   
                                                 
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                        <td><label for="stats-period">Date Of Exam &nbsp;&nbsp;</label></td>
                                                    <td> 
                                                        
                                                        
                                                        
                                                        <span class="input-type-text"><input type="text" id="datepicker" name="dateexam" id="stats-period" value=""></span></td>
                                                    </tr>
						</div>
                                                    
                                                    
                                                  
                                                    
                                                    
                                                    <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
					
					<div class="float-right"> 
                                            <tr>
                                                
			
			<td><button type="submit" name="bt" value="Insert" ><img src="images/icons/fugue/tick-circle.png" width="16" height="16"> Insert </button></td>
                        <td><button  type="button" name="btreset" value="Reset" onclick="clear_fields()"  class="grey">Reset</button> </td>
		
                                        </div>
                                                    
                                                    
                                                    </table>
					</fieldset>
                                        
					
					
				</form>
				
				<div id="tab-comments" class="with-margin">
					<script type="text/javascript">
					
						$('#tab-comments').onTabShow(function() { $(this).loadWithEffect('ajax-tab.html', function() { notify('Content loaded via ajax'); }); }, true);
					
					</script>
				</div>
				
				
				
				
				
				
				
				<ul class="message no-margin">
					<li>This is an <strong>information message</strong>, inside a box</li>
				</ul>
				
			</div>
                        
                        
                      
                                                    
                        </div>
                                                  
		</section>
                    </article>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       
    </body>
</html>
<%}%>
