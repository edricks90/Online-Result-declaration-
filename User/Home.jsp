<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Declaration Board</title>
        
        
        
     


        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="css/main.css">  
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

        <!--[if lt IE 9]>
         <script src="js/html5shiv.js"></script>
        <![endif]-->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    
    <script type="text/javascript">
    
    var theme_list_open = false;
    var style_list_open = false;
    
    document.domain = 'demo.krownthemes.com'

    $(document).ready(function () {

    	var $choose_theme = $('#choose_theme');
        var $choose_style = $('#choose_style');
    	var $purchase = $('#switcher_purchase');
    	var $close = $('#switcher_close');
    	var $iframe = $('#switcher_iframe');
    	var $switcher = $('#switcher');
    	var $current = $('#current_theme').find('p');
        var $current2 = $('#current_style').find('p');
        var $type = $('#current_version');
    
    	function fixHeight () {
	    	var headerHeight = $switcher.outerHeight() + 1;
	    	$iframe.attr("height", ($(window).height() - headerHeight) + 'px');
    	}
    	
    	$(window).resize(function() {
    		fixHeight();
    	}).resize();

    	fixHeight();
    	
    	$("#current_theme").click(function(){
    		if (theme_list_open == false) {
    			theme_list_open = true;
    			$choose_theme.stop().fadeIn(100);
    		} else {
    			theme_list_open = false;
    			$choose_theme.stop().fadeOut(50);
    		}
    		return false;
    	});

        var sWhat = true;
        
        $("#current_style").click(function(){
            if(sWhat){
                if (style_list_open == false) {
                    style_list_open = true;
                    $choose_style.stop().fadeIn(100);
                } else {
                    style_list_open = false;
                    $choose_style.stop().fadeOut(50);
                }
            } else {
                sWhat = true;
            }
            return false;
        });

        $choose_style.find('li').click(function(){
            if($(this).data('type') == 'js'){
                style_list_open = false;
                sWhat = false;
                $choose_style.stop().fadeOut(50);
                $iframe.contents().find('body').removeClass('Light Dark Orange dark light');
                $iframe.contents().find('body').addClass($(this).data('change'));
                $current2.text($(this).data('title'));
            } else if($(this).data('type') == 'url') {
                style_list_open = false;
                sWhat = false;
                $choose_style.stop().fadeOut(50);
                $iframe.attr('src', $(this).data('change'));
            }
        });
    	
    	$choose_theme.find('li').hover(function(){
    		$(this).find('img.preview').stop().fadeIn(250);
    	}, function(){
    		$(this).find('img.preview').stop().fadeOut(150);
    	}).click(function () {
	    	$purchase.attr('href', $(this).data('purchase'));
	    	$close.attr('href', $(this).data('href'));
	    	$iframe.attr('src', $(this).data('href'));
            $type.find('div').css('display', 'none');
            $type.find('div#' + $(this).data('id'))
                .css('display', 'block')
                .find('a').removeClass('selected')
                .parent().find('a:first-child').addClass('selected');
	    	$current.text($(this).data('title'));
			theme_list_open = false;
			$choose_theme.stop().fadeOut(50);
			document.title = 'WordPress Themes by Ruben Bristian | Theme: ' + $(this).data('title');
			top.location.href = 'http://demo.krownthemes.com/?theme=' + $(this).data('id');
	    	return false;	
    	});

        $type.find('a').click(function(){
            if(!$(this).hasClass('selected')){
                $(this).parent().find('a.selected').removeClass('selected');
                $(this).addClass('selected');
                $purchase.attr('href', $(this).data('purchase'));
                $close.attr('href', $(this).data('href'));
                $iframe.attr('src', $(this).data('href'));
            }
            return false;
        });
    
    });
    
    </script>
     
    </head>
        
        
        
        
        
        
        
        
 
   
     
       <body>

        <!-- SITE CONTENT -->
        <jsp:include page="Header.jsp"/>
        
        <!-- CONTENT -->

        <div id="contentBk">
            <div id="content" class="clearfix">

                <div id="homeSlider" class="clearfix flexslider">

                    <div class="thumbs"></div>

                    <ul class="slides">
                        <li data-thumb="img/slider/1st_thumb.jpg"><img src="img/slider/1st.jpg" alt="A Classroom"></li>
                        <li data-thumb="img/slider/2nd_thumb.jpg"><img src="img/slider/2nd.jpg" alt="Just a different perspective over this new issue"></li>
                        <li data-thumb="img/slider/3rd_thumb.jpg"><img src="img/slider/3rd.jpg" alt="A Classroom"></li>
                        <li data-thumb="img/slider/4th_thumb.jpg"><img src="img/slider/4th.jpg" alt="Just a different perspective over this new issue"></li>
                    </ul>

                    <ul class="captions">
                        <li>
                            <h3>A student <strong>reading</strong></h3>
                            <p>The Institute has successfully trained more than 65
 lakh (6.5 million) students through its wide network
 of education centres located in over 40 countries..</p>
                        </li>
                        <li>
                            <h3>Just a different <em>perspective</em> over this new issue</h3>
                            <p>The Institute also provides recruitment assistance to companies. Based on the companies' job requirements, our students are shortlisted to get interviewed & placed with the organization in need </p>
                        </li>
                        <li>
                            <h3>Look at <strong>the baloon!</strong></h3>
                            <p> World's leading provider of open source solutions, ..</p>
                        </li>
                        <li>
                            <h3>90% of the people have back issues</h3>
                            <p>Red Hat uses a community powered approach to provide reliable and high-performing cloud, virtualization, storage, linux, and middleware technologies. .</p>
                        </li>
                    </ul>

                </div>

                <div class="wrapper">

                    <div class="welcome column c-67 clearfix">
                        <h3>Welcome To Result Declaration Board</h3>
                        <div class="cContent clearfix">
                            <img src="img/other/welcome.jpg" alt="">
                            <div>
                                <p>A wide variety of career, professional,
                                     short-term & certification courses
                                      designed for the learning & career
                                        needs of students, working 
                                         professionals & others.<br>
                                         Alliances with industry leaders like
 Java, Oracle, Microsoft & Red Hat
 which helps students obtain global
 certifications<a href=""> Read more</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="searchCourse searchCourseHome column c-33 clearfix">
                        <p>Search Roll.no And Exam Marks</p>
                        <form name="formSuser" id="formSuser" method="get" action="Result.jsp"   >
                           
                            <input class="focus input" type="text"  name="txtsearch" value=" Fill your keywords" />
                           
                            <input class="submit" type="submit" name="bt" value="Search"/>
                        </form>
                    </div>

                    <div class="clear"></div>

                    

                    

                    <div class="clear"></div>

                    <div class="event column c-67 clearfix">
                        <h3>Academy Event</h3>
                        <div class="arrows"></div>
                        <div class="cContent clearfix rotator">
                            <ul class="slides">
                                <li><a href="img/events/e1_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e1.jpg" src="img/events/e1_gray.jpg" alt="" class="imgBorder"></a></li>
                                <li><a href="img/events/e2_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e2.jpg" src="img/events/e2_gray.jpg" class="imgBorder" alt=""></a></li>
                                <li><a href="img/events/e3_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e3.jpg" src="img/events/e3_gray.jpg" alt="" class="imgBorder"></a></li>
                                <li><a href="img/events/e4_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e4.jpg" src="img/events/e4_gray.jpg" class="imgBorder" alt=""></a></li>
                                <li><a href="img/events/e5_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e5.jpg" src="img/events/e5_gray.jpg" class="imgBorder" alt=""></a></li>
                                <li><a href="img/events/e6_large.jpg" rel="lightbox[events]" class="grayColor"><img data-color="img/events/e6.jpg" src="img/events/e6_gray.jpg" class="imgBorder" alt=""></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="featured column c-33 clearfix">
                        <h3>Featured Professor</h3>
                        <div class="cContent">
                            <img class="imgBorder" src="img/professors/1st.jpg" alt="">
                            <div>
                                <h5>Jason Wills</h5>
                                <p>LAfter a lot of hard work, i proudly present GoodWork - the incredible all... </p>
                                
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
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
