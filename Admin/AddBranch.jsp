<%-- 
    Document   : ADDBranch
    Created on : Apr 29, 2013, 9:27:40 PM
    Author     : Shiv
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>
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
        var branchID = document.form1.txtbranchID;
	var  branchname = document.form1.txtbranchname;
        var address = document.form1.txtaddress;
        var email = document.form1.txtemail;
        var phoneno = document.form1.txtphoneno;
        
        
        
	if( laChuoiRong(branchID.value))
	{
            alert('branch Id must be not blank!');
            branchID.focus();
            return false;
	}
        
        if( laChuoiRong(branchname.value))
	{
            alert('Full name must be not blank!');
            branchname.focus();
            return false;
	}
        if( laChuoiRong(address.value))
	{
            alert('Address  must be not blank!');
            address.focus();
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
        
        
        
        
        
        if( laChuoiRong(phoneno.value))
	{
            alert('Phone  must be not blank!');
            phoneno.focus();
            return false;
	}
        if(!laSoNguyen(phoneno.value) )
	{
            alert('Phone number invalid!');
            phoneno.focus();
            return false;
	}
        
       
         return true;
    }
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Constellation Admin Skin</title>
	<meta charset="utf-8">
	
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
                         <li class="settings current"><a href="indexAdmin2.jsp?page=Admin&url=Branch" title="Branch">Branch</a>
                         <ul>
                                        <li><a href="indexAdmin2.jsp?page=Admin&url=Branch" title="BranchLists">Branch Lists</a></li>
                                        <li class="current"><a href="indexAdmin2.jsp?page=Admin&url=AddBranch" title="AddBranch">Add Branch  </a></li>
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
           
        
        <section class="grid_8">
			<div class="block-border"><div class="block-content">
				<!-- We could put the menu inside a H1, but to get valid syntax we'll use a wrapper -->
				<div class="h1 with-menu">
					<h1>Add Branch</h1>
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
         String b=""; String br=""; String a=""; String m="";  String p=""; 
        if(session.getAttribute("bri")!=null){
            b=session.getAttribute("bri").toString();
            br=session.getAttribute("bran").toString();
            a=session.getAttribute("addr").toString();
            m=session.getAttribute("mail").toString();
            p=session.getAttribute("pho").toString();
           
        }
        %>
				<form action="../ControllBranch"  method="post"  name="form1" class="form" id="form1" onsubmit="return kiemtra()" >
				 
                
                
					<fieldset class="grey-bg">
						<legend><a href="#">Options</a></legend>
                                                <table>
						<div class="float-left gutter-right">
                                                    <tr>
                                                    <td><label for="stats-period">Branch ID </label></td>
                                                    <td><input type="text" name="txtbranchID" id="stats-period" value="" /></td>
                                                    
                                                   
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
                                                    <td><label for="stats-period">Branch Name</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtbranchname" id="stats-period" value=""></span></td>
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
                                                    <td><label for="stats-period">Address</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtaddress" id="stats-period" value=""></span></td>
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
                                                    <td><label for="stats-period">E-Mail</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtemail" id="stats-period" value=""></span></td>
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
                                                    <td><label for="stats-period">Phone</label></td>
                                                    <td><span class="input-type-text"><input type="text" name="txtphoneno" id="stats-period" value=""></span></td>
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       
    </body>
</html>
<%}%>


