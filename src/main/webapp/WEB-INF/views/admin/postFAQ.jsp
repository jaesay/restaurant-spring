<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li>FAQ</li>
		<li class="active">Post FAQ</li>
	</ol>
</div>
<section class="container">
<form role="form" method="post" id="registerForm" action="/admin/postFAQ">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	<div id="register-container">
		<div class="">
			<h3>POST FAQ</h3>
			</div>
			<div class="form-group">
				<label for="f_writer">WRITER</label>
				<input type="email" name="f_writer" id="f_writer" class="form-control" value="${login.u_email}" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="f_question" >QUESTION</label> 
				<input type="text" name="f_question" id="f_question" class="form-control" placeholder="Enter a Question"/>
			</div>
			<div class="form-group">
				<label for="f_answer" >ANSWER</label> 
				<textarea name="f_answer" id="f_answer" class="form-control" placeholder="Enter the Answer"></textarea>
			</div>
			<br />
			<div class="btn-group">
				<input type="submit" id="regBtn" class="btn btn-default" value="REGISTER"/>
				<input type="button" id="listBtn" class="btn btn-default" value="LIST">
			</div>
		</div>
	</form>
</section><br><br><br>
<script>
$(document).ready(function(){
	var mForm = $("#registerForm");
	
	$("#listBtn ").on("click", function(){
		mForm.attr("method", "get");
		mForm.attr("action", "/admin/umlistPage");
		mForm.submit();
	});
});
</script>
<%@include file="../include/adminFooter.jsp" %>