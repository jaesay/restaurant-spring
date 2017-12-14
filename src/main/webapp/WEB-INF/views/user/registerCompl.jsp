<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<%-- <section class="container">
		<div id="register-compl">
			<h3>Welcome to SONGJJUZIP!</h3><br>
			<b>${login.u_email }</b> was registered.<br>
			If you want to edit your profile, you can do in <b>YOUR ID > EDIT MY PROFILE</b>
		</div>
</section> --%>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Reservation Completed</li>
	</ol>
</div>
<div class="container"> 
	<div class="box_4">
		<div class="faqs">
			<h4>Welcome to SONGJJUZIP!</h4>
			<div class="questions">
				<h5><b style="text-transform:lowercase">${login.u_email }</b> was registered.<br></h5>
	        	<p>If you want to edit your profile, you can do in <b>${login.u_email } > EDIT MY PROFILE</b></p>
	        </div>				    
		</div>  
	</div>
</div>

<%@include file="../include/footer.jsp" %>