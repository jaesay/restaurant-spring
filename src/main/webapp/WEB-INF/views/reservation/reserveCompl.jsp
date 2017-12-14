<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li>Reservation</li>
		<li class="active">Reservation Completed</li>
	</ol>
</div>
<div class="container"> 
	<div class="box_5">
		<div class="faqs">
			<h4>Thank you for your Reservation</h4>
			<div class="questions">
				<h5><b style="text-transform:lowercase">${login.u_email }</b>'s request for reservation was received by the reservation number of <b>${rvo.r_id }</b><br></h5>
	        	<p>If you want to check the state of your reservation , you can do in <b>${login.u_email } > MY RESERVATION</b></p>
	        </div>				    
		</div>  
	</div>
</div>

<%-- <section class="container">
	<div id="register-compl">
		<h3>Thank you for your Reservation</h3><br>
		<b>${rvo.r_email }</b>'s request for reservation was received by the reservation number of <b>${rvo.r_id }</b><br>
		If you want to check the state of your reservation , you can do in <b>YOUR ID > MY RESERVATION</b>
	</div>
</section> --%>

<%@include file="../include/footer.jsp" %>