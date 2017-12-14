<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Reservation</li>
	</ol>
</div>
<!---->
<div class="container">
	<div class="register">
		<h3>Reservation</h3>
		<form role="form" method="post" id="reserveForm">
		<input type="hidden" name= "r_phone" id="r_phone"> 
			<div class="mation">
				<div>
					<span>Name</span>
					<input type="text" name="r_name" id="r_name" value="${uvo.u_name }" readonly="readonly"/>
				</div>
				<div>
					<span>E-mail</span>
					<input type="email" name="r_email" id="r_email" value="${uvo.u_email }" readonly="readonly"/>
				</div>
				<div>
					<span>Phone</span>
					<label for="r_phone" >PHONE</label> 
					<select id="phone1" name="phone1"> 
					    <option value="011">011</option>
					    <option value="016">016</option>
					    <option value="017">017</option>
					    <option value="019">019</option>
					    <option value="010" selected>010</option>
					</select>
					-&nbsp;<input type="number" id="phone2" name="phone2"/>
					-&nbsp;<input type="number" id="phone3" name="phone3"/>
				</div>
				<div>
					<span>Date</span>
					<input type="text"  name="r_date" id="r_date">					 
				</div>
				<div>
					<span style="display:inline;">Time</span>&nbsp;&nbsp;<span style="display:inline;color:#ff5d56;">If you want to reserve today, you can reserve after 2 hours of the current time</span>
					<select name="r_time" id="r_time" class="form-control">
						<option value="${11*60}">11:00</option>
						<option value="${11*60+30}">11:30</option>
						<option value="${12*60}">12:00</option>
						<option value="${12*60+30}">12:30</option>
						<option value="${13*60}">13:00</option>
						<option value="${13*60+30}">13:30</option>
						<option value="${14*60}">14:00</option>
						<option value="${14*60+30}">14:30</option>
						<option value="${15*60}">15:00</option>
						<option value="${15*60+30}">15:30</option>
						<option value="${16*60}">16:00</option>
						<option value="${16*60+30}">16:30</option>
						<option value="${17*60}">17:00</option>
						<option value="${17*60+30}">17:30</option>
						<option value="${18*60}">18:00</option>
						<option value="${18*60+30}">18:30</option>
						<option value="${19*60}">19:00</option>
						<option value="${19*60+30}">19:30</option>
						<option value="${20*60}">20:00</option>
						<option value="${20*60+30}">20:30</option>
					</select>					 
				</div>
				<div>
					<label for="r_people" >The number of people</label> 
					<select name="r_people" id="r_people" class="form-control">
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>					 
				</div>
				<div>
					<span>MESSAGE</span>
					<textarea name="r_message" id="r_message" class="form-control"></textarea>
				</div>
			</div>
			<input type="button" id="regBtn" value="REGISTER"/>
		</form>
	</div>
</div>
<!---->
<%-- 
<section class="container">
		<form role="form" method="post" id="reserveForm">
		<input type="hidden" name= "r_phone" id="r_phone">
			<div id="reservation-container">
				<div class="">
					<h3>RESERVATION</h3>
				</div>
				<div class="form-group">
					<label for="r_name" >NAME</label> 
					<input type="text" name="r_name" id="r_name" class="form-control" value="${uvo.u_name }" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="r_email">EMAIL</label>
					<input type="email" name="r_email" id="r_email" class="form-control" value="${uvo.u_email }" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="r_phone" >PHONE</label> 
					<select id="phone1" name="phone1"> 
					    <option value="011">011</option>
					    <option value="016">016</option>
					    <option value="017">017</option>
					    <option value="019">019</option>
					    <option value="010" selected>010</option>
					</select>
					-&nbsp;<input type="number" id="phone2" name="phone2"/>
					-&nbsp;<input type="number" id="phone3" name="phone3"/>
				</div>
				<div class="form-group">
					<label for="r_date">DATE</label>
					<input type="text"  name="r_date" id="r_date" class="form-control">
				</div>
				<div class="form-group">
					<label for="r_time" >TIME</label> 
					<select name="r_time" id="r_time" class="form-control">
						<option value="${11*60}">11:00</option>
						<option value="${11*60+30}">11:30</option>
						<option value="${12*60}">12:00</option>
						<option value="${12*60+30}">12:30</option>
						<option value="${13*60}">13:00</option>
						<option value="${13*60+30}">13:30</option>
						<option value="${14*60}">14:00</option>
						<option value="${14*60+30}">14:30</option>
						<option value="${15*60}">15:00</option>
						<option value="${15*60+30}">15:30</option>
						<option value="${16*60}">16:00</option>
						<option value="${16*60+30}">16:30</option>
						<option value="${17*60}">17:00</option>
						<option value="${17*60+30}">17:30</option>
						<option value="${18*60}">18:00</option>
						<option value="${18*60+30}">18:30</option>
						<option value="${19*60}">19:00</option>
						<option value="${19*60+30}">19:30</option>
						<option value="${20*60}">20:00</option>
						<option value="${20*60+30}">20:30</option>
					</select>
				</div>
				<div class="form-group">
					<label for="r_people" >The number of people</label> 
					<select name="r_people" id="r_people" class="form-control">
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="form-group">
					<label for="r_message">MESSAGE</label>
					<textarea name="r_message" id="r_message" class="form-control"></textarea>
				</div>
				<div class="r_">
					<input type="button" class="btn btn-default" id="regBtn" value="REGISTER"/>
				</div>		
			</div>
		</form>
</section> --%>
<script type="text/javascript">
$(document).ready(function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	var hh = today.getHours();
	var m = today.getMinutes();
	var formObj = $("form[role='form']");
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	today = yyyy+'-' + mm+'-'+dd;
	$(function() {
	    $( "#r_date" ).datepicker({
	    	changeMonth: true, 
	        changeYear: true,
	    	dateFormat: 'yy-mm-dd',
	    	minDate:0 
	    });
	});
	$('#r_date').change(function(){
		if(today == $('#r_date').val()){
			var ctime= hh*60+m+120;
			for(var i=0; i< 20; i++){
				if(ctime >= $("#r_time option:first").val()) {
					$("#r_time option:first").remove();			
				}
			}
		}else{
			$("#r_time").append("<option value='${11*60}'>11:00</option>");
			$("#r_time").append("<option value='${11*60+30}'>11:30</option>");
			$("#r_time").append("<option value='${12*60}'>12:00</option>");
			$("#r_time").append("<option value='${12*60+30}'>12:30</option>");
			$("#r_time").append("<option value='${13*60}'>13:00</option>");
			$("#r_time").append("<option value='${13*60+30}'>13:30</option>");
			$("#r_time").append("<option value='${14*60}'>14:00</option>");
			$("#r_time").append("<option value='${14*60+30}'>14:30</option>");
			$("#r_time").append("<option value='${15*60}'>15:00</option>");
			$("#r_time").append("<option value='${15*60+30}'>15:30</option>");
			$("#r_time").append("<option value='${16*60}'>16:00</option>");
			$("#r_time").append("<option value='${16*60+30}'>16:30</option>");
			$("#r_time").append("<option value='${17*60}'>17:00</option>");
			$("#r_time").append("<option value='${17*60+30}'>17:30</option>");
			$("#r_time").append("<option value='${18*60}'>18:00</option>");
			$("#r_time").append("<option value='${18*60+30}'>18:30</option>");
			$("#r_time").append("<option value='${19*60}'>19:00</option>");
			$("#r_time").append("<option value='${19*60+30}'>19:30</option>");
			$("#r_time").append("<option value='${20*60}'>20:00</option>");
			$("#r_time").append("<option value='${20*60+30}'>20:30</option>");
		}
	});
	$("#regBtn").on("click", function(){	
		if(document.getElementById("phone2").value.length != 4) {
		    alert("you must enter 4 digits in the phone blanks");
		    oForm.mobile2.focus();
		    return false;
		}
		if(document.getElementById("phone3").value.length != 4) {
		    alert("you must enter 4 digits in the phone blanks");
		    oForm.mobile3.focus();
		    return false;
		}
		if($('#r_date').val()==""){
			alert("you must enter the reservation date");
			return false;
		}
		var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
		$("#r_phone").attr("value", phone);
		formObj.submit();
	});
});

</script>

<%@include file="../include/footer.jsp" %>