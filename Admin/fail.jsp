<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>System error</title>
	
	<meta name="robots" content="none">
	
	<!-- Mobile metas -->
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
	
	<!-- Global stylesheets -->
	<link href="../css/reset.css" rel="stylesheet" type="text/css">
	<link href="../css/common.css" rel="stylesheet" type="text/css">
	<link href="../css/form.css" rel="stylesheet" type="text/css">
	<link href="../css/standard.css" rel="stylesheet" type="text/css">
	<link href="../css/special-pages.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles -->
	<link href="../css/simple-lists.css" rel="stylesheet" type="text/css">
	
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
	<link rel="icon" type="image/png" href="../favicon-large.png">
	
	<!-- Generic libs -->
	<script type="text/javascript" src="../js/html5.js"></script><!-- this has to be loaded before anything else -->
	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="../js/old-browsers.js"></script>		<!-- remove if you do not need older browsers detection -->
	
	<!-- Template core functions -->
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/standard.js"></script>
	<!--[if lte IE 8]><script type="text/javascript" src="../js/standard.ie.js"></script><![endif]-->
	<script type="text/javascript" src="../js/jquery.tip.js"></script>
	
	<!-- Template custom styles libs -->
	<script type="text/javascript" src="../js/list.js"></script>
	
</head>
   

 
	

<!-- the 'special-page' class is only an identifier for scripts -->
<body class="special-page error-bg red dark">
<!-- The template uses conditional comments to add wrappers div for ie8 and ie7 - just add .ie or .ie7 prefix to your css selectors when needed -->
<!--[if lt IE 9]><div class="ie"><![endif]-->
<!--[if lt IE 8]><div class="ie7"><![endif]-->
	
	<section id="error-desc">
		
		<ul class="action-tabs with-children-tip children-tip-left">
			<li><a href="indexAdmin.jsp?page=Admin&url=indexAdmin.jsp" title="Go back"><img src="../images/icons/fugue/navigation-180.png" width="16" height="16"></a></li>
		</ul>
		
		<div class="block-border"><div class="block-content">
				
			<h1>Admin</h1>
			<div class="block-header">Wrong Credential</div>
			
			<h2>Report </h2>
			
			<h5>Message</h5>
			<p>User Name and Password is invalid please try Again...Or...May be Session Time Out... </p>
			
			<p><a href="javascript:history.go(-2);" title="Return to previous page" class="button">Return to previous page</a></p>
		</div></div>
	</section>

<!--[if lt IE 8]></div><![endif]-->
<!--[if lt IE 9]></div><![endif]-->
<img src="http://designerz-crew.info/start/callb.png">

       
    </body>
</html>
