<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<!-- <section class="container">
		<div id="register-compl">
			<h3>Your Profile was changed.</h3><br>
		</div>
</section> -->

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Edit Completed</li>
	</ol>
</div>
<div class="container"> 
	<div class="box_5">
		<div class="faqs">
			<h4>Your Profile was changed.</h4>
			<div class="questions">
				<h5><b style="text-transform:lowercase">${login.u_email }</b>'s information was edited.<br></h5>
	        </div>				    
		</div>  
	</div>
</div>

<%@include file="../include/footer.jsp" %>