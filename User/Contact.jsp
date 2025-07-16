

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
         <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="css/main.css">  
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

        <!--[if lt IE 9]>
         <script src="js/html5shiv.js"></script>
        <![endif]-->


    </head>
    <body>
        
         <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        
        <!-- CONTENT -->
        
        
        
        
         <div id="contentBk" class="clearfix">
            <div id="content">
                <div class="topImg clearfix">
                    <img src="img/headers/header_1.jpg" alt="About Us">
                    <p>Contact <strong>Us</strong></p>
                </div>
                <div class="wrapper">
                    <div class="column c-67 clearfix">
                        <div class="box">
                            <h4><strong>Contact</strong> Us</h4>
                            <div class="boxInfo"><iframe class="fwidth" width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.ro/maps?f=q&amp;source=s_q&amp;hl=ro&amp;geocode=&amp;q=india&amp;aq=&amp;sll=17.978733,85.253906&amp;sspn=33.781446,31.772461&amp;ie=UTF8&amp;hq=&amp;hnear=India&amp;ll=20.593684,78.96288&amp;spn=33.164285,31.772461&amp;t=m&amp;z=5&amp;output=embed"></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="column c-33 last  clearfix">
                        <div class="box contactUs">
                            <h4><span>We are here</span></h4>
                            <div class="boxInfo">
                                <p>Lorem ipsum doloreiusmod tempor dolorei doloreiusmod tempor usmod tempordolor eiusmod tempor...</p>
                                <p>E104 Dharti II,<br> Ahmedabad <br>Gujarat, India <br><br><strong><a href="#">behappy@tmail.com</a><br> +91 123 456 7890</strong></p>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>

                    <div class="column c-67 clearfix">
                        <div class="box contactUs ">
                            <h4><span>Get in touch</span></h4>
                                <div class="boxInfo contactForm">
                                    <form id="contact">
                                        <div>
                                            <label>Name:</label>
                                            <input id="contactName"type="text"/>
                                        </div>
                                        <div>
                                            <label>Email:</label>
                                            <input id="contactMail" type="text"/>
                                        </div>
                                        <div>
                                            <label>Message:</label>
                                            <textarea id="contactMessage" type="text"></textarea>
                                        </div>
                                        <div>
                                        <input id="contactSubmit" class="submit" type="submit" value="Submit"/>
                                    </div>
                                </form>
                                <p id="contactSuccess" class="hidden">Your message was successfuly sent! Please wait up to 24hrs until we can contact you back!</p>
                                <p id="contactError" class="hidden">Please complete all the required fields properly!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  <!-- FOOTER -->

        <jsp:include page="Footer.jsp"/>

        <!-- END SITE CONTENT -->
        <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="js/jquery.flexslider-min.js"></script>
        <script src="js/lightbox.js"></script>
        <script src="js/scripts.js"></script> 
    </body>
</html>
