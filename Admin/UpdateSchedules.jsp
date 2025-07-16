<%-- 
    Document   : UpdateSchedules
    Created on : Apr 25, 2013, 8:44:32 PM
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
        var id = document.form1.txtscheid;
        var name = document.form1.txtschename;
        var fee = document.form1.txtfee;
        var sdate = document.form1.txtstartdate;
        var edate = document.form1.txtenddate;
        var datexame = document.form1.txtdateexam;
       
        
        if( laChuoiRong(id.value) )
	{
            alert('Schedule ID is not blank !');
            id.focus();
            return false;
	}
        if( laChuoiRong(name.value) )
	{
            alert('Schedule name is not blank !');
            name.focus();
            return false;
	}
        if( laChuoiRong(fee.value) )
	{
            alert('Fee is not blank !');
            fee.focus();
            return false;
	}
        if( laChuoiRong(sdate.value) )
	{
            alert('StartDate is not blank !');
            sdate.focus();
            return false;
	}
        if( laChuoiRong(edate.value) )
	{
            alert('EndDate is not blank !');
            edate.focus();
            return false;
	}
        if( laChuoiRong(datexame.value) )
	{
            alert('Date exame is not blank !');
            datexame.focus();
            return false;
	}
        if(!laNgay(sdate.value))
            {
                alert('Date invail !');
                sdate.focus();
                return false;
            }
        if(!laNgay(edate.value))
            {
                alert('Date invail !');
                edate.focus();
                return false;
            }
        if(!laNgay(datexame.value))
            {
                alert('Date invail !');
                datexame.focus();
                return false;
            }
        if(!laSoNguyen(fee.value))
            {
                alert('Fee is number!');
                fee.focus();
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
  
  $(function() {
    $( "#datepicker2" ).datepicker({
      showOn: "button",
      buttonImage: "images/icons/fugue/calendar-month.png",
      buttonImageOnly: true
    });
  });
  $(function() {
    $( "#datepicker3" ).datepicker({
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
			<li class="medias"><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Manage">Marks</a>
				<ul>
					
					<li ><a href="indexAdmin2.jsp?page=Admin&url=ExamMark" title="Exam Marks Lists">Exam Marks Lists</a></li>
                                        <li ><a href="indexAdmin2.jsp?page=Admin&url=AddExam" title="Add Exam Mark">Add Exam Mark  </a></li>
				</ul>
			</li>
			<li class="backup current"><a href="indexAdmin2.jsp?page=Admin&url=Schedules" title="Schedules Manage">Schedules</a>
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
					<h1>Update Scheduling</h1>
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
        String scheid="";
        String subid="";
        String schename="";
        String fee="";
        String startdate="";
        String enddate="";
        String dateexam="";
        if(session.getAttribute("scheid")!=null){
            scheid=session.getAttribute("scheid").toString();
            //subid=session.getAttribute("subid").toString();
            schename=session.getAttribute("schename").toString();
            fee=session.getAttribute("fee").toString();
            startdate=session.getAttribute("startdate").toString();
            enddate=session.getAttribute("enddate").toString();
            dateexam=session.getAttribute("dateexam").toString();
        }
        %>
        <% 
        SchedulesBean obj=new SchedulesBean();
        Collection kq=obj.getListSchedules();
        request.setAttribute("st", kq);
        %>
        <%
        SubjectBean subject=new SubjectBean();
        Collection kq1=subject.getListSubject();
        request.setAttribute("st1", kq1);
        %>
                                
                                
		<form action="../ControllSchedules"  method="post" name="form1" class="form" id="form1" onsubmit="return kiemtra()" >
				 
                
                
						<fieldset class="grey-bg">
						<legend><a href="#">Options</a></legend>
                                                <table>
                                                    
                                                    
                                                  <div class="float-left">
                                                    <tr>
                                                        <td><span class="label"></span></td>
                                                        <td>
                                                        </td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Schedules ID</label></td>
                                                    <td><ul class="keywords"><li class=" purple-keyword"><%=scheid%></li></ul></td>
                                                    <input type="hidden" name="txtup" value="<%=scheid%>" />
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
                                                        <select name="ddlsubid" id="stats-sites-0">
								
								 <c:forEach items="${st1}" var="s">
                                                                    <option>${s.subID}</option>    
                                                                 </c:forEach>
							</select>
                                                    
                                                    
                                                    
                                                    </td>
                                                   
                                                   
                                                    </tr>
						</div>
                                                    
                                                    
                                                    
                                                   <div class="float-left">
                                                    <tr>
                                                        <td><span class="label">  </span></td>
                                                         <td></td>
                                                        </tr>
						</div>
                                                    
                                                    
                                                    
                                                    
                                                    <div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Schedule Name</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtschename" id="stats-period" value="<%=schename%>"></span></td>
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
                                                    <td><label for="stats-period">Fee</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtfee" id="stats-period" value="<%=fee%>"></span></td>
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
                                                    <td><label for="stats-period">Start Date</label></td>
                                                    <td><span class="input-type-text"><input type="text" id="datepicker" name="txtstartdate" id="stats-period" value="<%=startdate%>"></span></td>
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
                                                        <td><label for="stats-period">End Date &nbsp;&nbsp;</label></td>
                                                    <td>  <span class="input-type-text"><input type="text" id="datepicker2" name="txtenddate" id="stats-period" value="<%=enddate%>"></span></td>
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
                                                    <td><label for="stats-period">Date Exam</label></td>
                                                    <td><span class="input-type-text"><input type="text" id="datepicker3" name="txtdateexam" id="stats-period" value="<%=dateexam%>"></span></td>
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
                                                
			
			<td><button type="submit" name="bt" value="Update" ><img src="images/icons/fugue/tick-circle.png" width="16" height="16"> Update </button></td>
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

