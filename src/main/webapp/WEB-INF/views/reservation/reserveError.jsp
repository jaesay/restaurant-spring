<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>
<%-- 
<section class="container">
	<div id="register-compl">
		<h3>You already reserved as reservation id of ${rvo.r_id }.</h3><br>
		<b>All member can have only one reservation.</b><br>
		If you want to check the state of your reservation , you can do in <b>${rvo.r_email } > MY RESERVATION</b>
	</div>
</section> --%>

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
			<h4>You already reserved as reservation id of ${rvo.r_id }.</h4>
			<div class="questions">
				<h5><b>All member can have only one reservation.</b><br></h5>
	        	<p>If you want to check the state of your reservation , you can do in <b>${rvo.r_email } > MY RESERVATION</b></p>
	        </div>				    
		</div>  
	</div>
</div>

<%@include file="../include/footer.jsp" %>