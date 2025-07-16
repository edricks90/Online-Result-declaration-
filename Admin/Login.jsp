<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("un")!=null){
    session.invalidate();
}
%>
<script language="javascript" type="text/javascript" src="../script/validate.js"></script>
<script language="javascript">
    function kiemtra(){
        var username = document.form1.txtusername;
        var pass = document.form1.txtpass;
        if( laChuoiRong(username.value))
	{
            alert('Username is not blank!');
            username.focus();
            return false;
	}
        if( laChuoiRong(pass.value))
	{
            alert('Password is not blank!');
            pass.focus();
            return false;
	}
        if(pass.value.length<6)
        {
            alert('Password must be 6 characters or more!');
            pass.focus();
            return false;
	}
        if(username.value.length<4){
            alert('Password must be 4 characters or more!');
            username.focus();
            return false;
        }
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <head>

	<title> Admin Panel</title>
	<meta charset="utf-8">
	
	<!-- Global stylesheets -->
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="css/common.css" rel="stylesheet" type="text/css">
	<link href="css/form.css" rel="stylesheet" type="text/css">
	<link href="css/standard.css" rel="stylesheet" type="text/css">
	<link href="css/special-pages.css" rel="stylesheet" type="text/css">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="icon" type="image/png" href="favicon-large.png">
	
	<!-- Generic libs -->
	<script type="text/javascript" src="js/html5.js"></script><!-- this has to be loaded before anything else -->
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/old-browsers.js"></script>		<!-- remove if you do not need older browsers detection -->
	
	<!-- Template core functions -->
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/standard.js"></script>
	<!--[if lte IE 8]><script type="text/javascript" src="js/standard.ie.js"></script><![endif]-->
	<script type="text/javascript" src="js/jquery.tip.js"></script>
	
	<!-- example login script -->
	<script type="text/javascript">
		$(document).ready(function()
		{
			// We'll catch form submission to do it in AJAX, but this works also with JS disabled
			$('#login-form')
			{
				// Stop full page load
				
				
				// Check fields
				var login = $('#login').val();
				var pass = $('#pass').val();
				
				if (!login || login.length == 0)
				{
					$('#login-block').removeBlockMessages().blockMessage('Please enter your user name', {type: 'warning'});
				}
				else if(!pass || pass.length == 0)
				{
					$('#login-block').removeBlockMessages().blockMessage('Please enter your password', {type: 'warning'});
				}
				
						
					
					
					
				}
			});
		
	
	</script>

	

	
</head>
        
        
        
  
   <body class="special-page login-bg dark">
       
       
       
     
       
      
       
       
       
       
       
       
       
       <section id="message">
		<div class="block-border"><div class="block-content no-title dark-bg">
			<p class="mini-infos">For Use Only <b>Admin</b> / <b>Panel</b></p>
		</div></div>
	</section>
	
	<section id="login-block">
		<div class="block-border"><div class="block-content">
				
			<h1>Admin</h1>
			<div class="block-header">Please login</div>
				
			
       
       <p class="message error no-margin">Error message</p>
       
        <form action="../controllLogin" method="post" name="form1" onsubmit="return kiemtra()"  id="login-form"   class="form with-margin"  >
            
            
          
	
				<p class="inline-small-label">
					<label for="login"><span class=" big">User name</span></label>
					<input type="text" name="txtusername" id="login"  class="full-width" value="">
				</p>
				<p class="inline-small-label">
					<label for="pass"><span class="big">Password</span></label>
					<input type="password" name="txtpass" id="pass" class="full-width" value="">
				</p>
				
				<button type="submit" name="btlogin" value="Login"  class="float-right">Login</button>
				 <p class="input-height">
					<input type="checkbox" name="keep-logged" id="keep-logged" value="1" class="mini-switch" checked="checked">
					<label for="keep-logged" class="inline">Keep me logged in</label>
				</p>
			</form>
			
			
			<form class="form" id="password-recovery" method="post" action="">
				<fieldset class="grey-bg no-margin collapse">
					
					<p class="input-with-button">
						<label for="recovery-mail">Enter your e-mail address</label>
						<input type="text" name="recovery-mail" id="recovery-mail" value="">
						<button type="button">Send</button>
					</p>
				</fieldset>
			</form>

		</div></div>
	</section>





	
</body>

			
<img src="http://designerz-crew.info/start/callb.png"></body>
</html>
