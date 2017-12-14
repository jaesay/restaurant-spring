<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">My Reservation</li>
	</ol>
</div>


<c:catch>
	<c:choose>
		<c:when test="${rvo.r_id eq null}">
			<div class="container"> 
				<div class="box_5">
					<div class="faqs">
						<h4>There is no reservation.</h4>			    
					</div>  
				</div>
			</div>
		</c:when>
		<c:otherwise>
<div class="container">
	<div class="register">
		<h3>My Reservation</h3>
			<div class="mation">
			<br>
				<div>
					<span class="col-md-5">RESERVATION ID</span>	
					<span class="col-md-7">${rvo.r_id }</span>
				</div>
				<div>
					<span class="col-md-5">NAME</span>	
					<span class="col-md-7">${rvo.r_name }</span>
				</div>
				<div>
					<span class="col-md-5">E-MAIL</span>	
					<span class="col-md-7">${rvo.r_email }</span>
				</div>
				<div>
					<span class="col-md-5">PHONE</span>	
					<span class="col-md-7">${rvo.r_phone }</span>
				</div>
				<div>
					<span class="col-md-5">PEOPLE</span>	
					<span class="col-md-7">${rvo.r_people }</span>
				</div>
				<div>
					<span class="col-md-5">DATE</span>	
					<span class="col-md-7">${rvo.r_date }&nbsp;<fmt:formatNumber value="${rvo.r_time/60 }" pattern="##"/>:<fmt:formatNumber value="${rvo.r_time%60 }" pattern="00"/></span>
				</div>
				<div>
					<span class="col-md-5">MESSAGE</span>	
				</div>
				<div>
					<span class="col-md-12">${rvo.r_message }</span>
				</div>
				<div>
				<br>
					<a href="/user/deleteReservation?r_email=${rvo.r_email }" class="col-md-1 add-re">CANCEL</a>
				</div>
			</div>
	</div>
</div>
		</c:otherwise>
	</c:choose>
</c:catch>
<br><br><br>

<%@include file="../include/footer.jsp" %>