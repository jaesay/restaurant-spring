<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SONGJJUZIP</title>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/bootstrap/js/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="/resources/bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="I-wear Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="/resources/bootstrap/js/move-top.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/easing.js"></script>
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Montez' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<script src="/resources/bootstrap/js/simpleCart.min.js"> </script>
<!-- start menu -->
<link href="/resources/bootstrap/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/resources/bootstrap/js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<script src="/resources/bootstrap/js/main.js"></script> <!-- Resource jQuery -->
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  	ga('create', 'UA-48014931-1', 'codyhouse.co');
  	ga('send', 'pageview');

  	jQuery(document).ready(function($){
  		$('.close-carbon-adv').on('click', function(){
  			$('#carbonads-container').hide();
  		});
  	});
</script>	
<script src="/resources/bootstrap/js/simpleCart.min.js"> </script>
		  		 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<!-- js -->
		 <script src="/resources/bootstrap/js/bootstrap.js"></script>
	<!-- js -->

<style type="text/css">
	a:link {text-decoration:none;}
</style>

</head>
<body> 
	
<!--header-->	
		<div class="header-info">
			<div class="container">
					<div class="header-top-in">
						
						<ul class="support">
							<li><a href="mailto:jaesay@ajou.ac.kr"><i class="glyphicon glyphicon-envelope"> </i>jaesay@ajou.ac.kr</a></li>
							<li><span><i class="glyphicon glyphicon-earphone" class="tele-in"> </i>+82 10 - 4783 - 3183</span></li>			
						</ul>
						<ul class=" support-right">
							<c:catch>
								<c:choose>
									<c:when test="${login.u_email != null }">
										<li>
											<div class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
												${login.u_email }<span class="caret"></span></a>	
												<ul class="dropdown-menu" role="menu">
													<c:catch>
														<c:choose>
															<c:when test="${login.u_email.equals('admin@songjjuzip.com') }">
																<li><a href="/user/edit?u_email=${login.u_email}">EDIT MY PROFILE</a></li>
																<li><a href="/user/myReservation?r_email=${login.u_email}">MY RESERVATION</a></li>
																<li><a href="/admin/">MANAGEMENT</a></li>
																<li><a href="/user/logout">LOGOUT</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="/user/edit?u_email=${login.u_email}">EDIT MY PROFILE</a></li>
																<li><a href="/user/myReservation?r_email=${login.u_email}">MY RESERVATION</a></li>
																<li><a href="/user/deleteAuth">DELETE MY ACCOUNT</a></li>
																<li><a href="/user/logout">LOGOUT</a></li>
															</c:otherwise>
														</c:choose>
													</c:catch>
												</ul>
											</div>
										</li>
									</c:when>
									<c:otherwise>
										<li><a id="loginUrl"><i class="glyphicon glyphicon-user" class="men"> </i>Login</a></li>
										<li><a href="/user/register"><i class="glyphicon glyphicon-lock" class="tele"> </i>Create an Account</a></li>
									</c:otherwise>
								</c:choose>
							</c:catch>
						
						</ul>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>	
<div class="header header5">
	<div class="header-top">

			<div class="header-bottom">
			<div class="container">			
				<div class="logo">
					<a href="/"><img src="/resources/bootstrap/images/logo.png" style="width:70%;" alt="logo"></a>
				</div>
				
				
				
		 
			<div class="top-nav">
				<ul class="memenu skyblue"><li class="active"><a href="/">Home</a></li>
					<li class="grid"><a href="/about/intro">About</a>
						<div class="mepanel">
							<div class="row">
								<div class="col1 me-one">
									<h4>About</h4>
									<ul>
										<li><a href="/about/intro">Introduction</a></li>
						    			<li><a href="/about/location">Location</a></li>
						    			<li><a href="/about/contact">Contact</a></li>
									</ul>
								</div>
							</div>
						</div>
					</li>
					<li class="grid"><a href="/menu/main">Menu</a>
						<div class="mepanel">
							<div class="row">
								<div class="col1 me-one">
									<h4>Menu</h4>
									<ul>
								    	<li><a href="/menu/main">Main</a></li>
										<li><a href="/menu/special">Special</a></li>
										<li><a href="/menu/side">Side</a></li>
										<li><a href="/menu/extra">Extra</a></li>
										<li><a href="/menu/beverage">Beverage</a></li>
									</ul>
								</div>
							</div>
						</div>
					</li>
					
					<li class="grid"><a href="/reserve">Reservation</a>
						
					</li>
					<li class="grid"><a href="/budget/">Budget</a>
						
					</li>
					<li class="grid"><a href="/faq">FAQ</a>
						
					</li>
				</ul>
				<div class="clearfix"> </div>
			</div>
					<!---->

<div class="clearfix"> </div>
					<!---->
				</div>
				
			</div>
			<div class="clearfix"> </div>
		</div>
		</div>
</div>
<script type="text/javascript">
	$("#loginUrl").attr("href", "/user/login?go=" + location.href);
</script>
<!---->