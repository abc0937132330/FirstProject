<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Groovin one page bootstrap template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- styles -->
<link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css">
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/slippry.css">
<link href="assets/css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/color/default.css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<script src="assets/js/modernizr.custom.js"></script>
</head>
<body>
<header>

<div id="navigation" class="navbar navbar-inverse navbar-fixed-top default" role="navigation">
  <div class="container">

    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">Just do it</a>
       </div>

	<div class="navigationp">
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"><nav>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="index.jsp" target="_parent">Home</a></li>
			<li><a href="Login.jsp" target="_parent">會員登錄</a></li>
			<li><a href="Registration.html" target="_parent">註冊</a></li>
	      </ul></nav>
	    </div><!-- /.navbar-collapse -->
	</div>

  </div>
</div>

</header>
<!-- section intro -->
<section id="intro">
			<ul id="slippry-slider">
			  <li>
				<a href="#slide1"><img src="assets/img/slide/4.jpg" alt="keep your life!"></a>
			  </li>
			  <li>
				<a href="#slide2"><img src="assets/img/slide/5.jpg"  alt="Exercise can control your life"></a>
			  </li>
			  <li>
				<a href="#slide3"><img src="assets/img/slide/6.jpg" alt=""></a>
			  </li>
			  <li>
				<a href="#slide3"><img src="assets/img/slide/8.jpg" alt=""></a>
			  </li>
			</ul>
</section>



<!-- end section contact -->
<footer>
		<div class="row">
			<div class="col-md-12">
				<div class="aligncenter">
					<p>
						 &copy;2015 Groovin - All right reserved | Designed by <a href="http://bootstraptaste.com">BootstrapTaste</a>.
					</p>
                    <!-- 
                        All links in the footer should remain intact. 
                        Licenseing information is available at: http://bootstraptaste.com/license/
                        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Groovin
                    -->
				</div>
			</div>
		</div>
	</div>
</div>
</footer>
<a href="#" class="scrollup"><i class="fa fa-angle-up fa-2x"></i></a>
<!-- javascript don't stop-->
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/jquery.easing.js"></script>
<script src="assets/js/classie.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/slippry.min.js"></script>
<script src="assets/js/nagging-menu.js"></script>
<script src="assets/js/jquery.nav.js"></script>
<script src="assets/js/jquery.scrollTo.js"></script>
<script src="assets/js/jquery.fancybox.pack.js"></script> 
<script src="assets/js/jquery.fancybox-media.js"></script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/imagesloaded.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script src="assets/js/validate.js"></script>	
<script src="assets/js/AnimOnScroll.js"></script>
    <script>
        new AnimOnScroll( document.getElementById( 'grid' ), {
            minDuration : 0.4,
            maxDuration : 0.7,
            viewportFactor : 0.2
        } );
    </script>
<script>
	$(document).ready(function(){
	  $('#slippry-slider').slippry(
		defaults = {
			transition: 'vertical',
			useCSS: true,
			speed: 5000,
			pause: 3000,
			initSingle: false,
			auto: true,
			preload: 'visible',
			pager: false,		
		} 
	  
	  )
	});
</script>

<script src="assets/js/custom.js"></script>
        <script type="text/javascript">
            // When the window has finished loading create our google map below
            google.maps.event.addDomListener(window, 'load', init);
        
            function init() {
                // Basic options for a simple Google Map
                // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
                var mapOptions = {
                    // How zoomed in you want the map to start at (always required)
                    zoom: 11,

                    // The latitude and longitude to center the map (always required)
                    center: new google.maps.LatLng(40.6700, -73.9400), // New York

                    // How you would like to style the map. 
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [	{		featureType:"all",		elementType:"all",		stylers:[		{			invert_lightness:true		},		{			saturation:10		},		{			lightness:30		},		{			gamma:0.5		},		{			hue:"#5C9F24"		}		]	}	]
                };

                // Get the HTML DOM element that will contain your map 
                // We are using a div with id="map" seen below in the <body>
                var mapElement = document.getElementById('map');

                // Create the Google Map using out element and options defined above
                var map = new google.maps.Map(mapElement, mapOptions);
            }
        </script>
</body>
</html>