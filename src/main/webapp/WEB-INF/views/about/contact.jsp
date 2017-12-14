<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Contact</li>
	</ol>
</div>
<div class="container" style="margin-bottom:7em;">
			<div class="contact">
				<div class=" contact-top">
					<h3>Want to ask to me?</h3>
						<div>
							<span>Your Name </span>		
							<input type="text" value="" >						
						</div>
						<div>
							<span>Your Email </span>		
							<input type="text" value="" >						
						</div>
						<div>
							<span>Subject</span>		
							<input type="text" value="" >	
						</div>
						<div>
							<span>Your Message</span>		
							<textarea> </textarea>	
						</div>
						<input type="submit" value="SEND" >	
				</div>
		</div>
</div>

<%@include file="../include/footer.jsp" %>