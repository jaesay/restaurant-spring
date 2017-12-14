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
		<li class="active">Edit FAQ</li>
	</ol>
</div>
<!---->
<div class="container">
	<div class="register">
		<h3>FAQ INFORMATION</h3>
		<form role="form" method="post" id="modifyForm" action="/admin/editFAQ">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
			<div class="mation">
				<div>
					<span>FAQ ID</span>
					<input type="text" name="f_id" id="f_id" value="${vo.f_id}" readonly="readonly"/>
				</div>
				<div>
					<span>Writer</span>
					<input type="email" name="f_writer" id="f_writer" value="${vo.f_writer}" readonly="readonly"/>
				</div>
				<div>
					<span>Question</span>
					<input type="text" name="f_question" id="f_question" value="${vo.f_question}" /> 
				</div>
				<div>
					<span>Answer</span>
					<textarea name="f_answer" id="f_answer" class="form-control" >${vo.f_answer}</textarea>
				</div>
				<div>
					<span>FAQ ID</span>
					<input type="text" name="updated" id="updated" value="${vo.f_udate}" readonly="readonly"/>
				</div>
				<div>
					<span>FAQ ID</span>
					<input type="text" name="registered" id="registered" value="${vo.f_rdate}" readonly="readonly"/>
				</div>
			</div>
			<input type="submit" value="MODIFY"/>
			<input type="button" id="delBtn" value="DELETE">
			<input type="button" id="listBtn" value="LIST">
		</form>
	</div>
</div><br><br><br>
<%-- 
<section class="container">
	<form role="form" method="post" id="modifyForm" action="/admin/ummodify">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<div id="register-container">
			<div class="">
				<h3>MODIFY</h3>
			</div>
			<div class="form-group">
				<label for="u_email">EMAIL</label>
				<input type="email" name="u_email" id="u_email" class="form-control" value="${vo.u_email }" readonly="readonly"/>
			</div>
			<div class="form-group">
				<label for="u_name" >NAME</label> 
				<input type="text" name="u_name" id="u_name" class="form-control" value="${vo.u_name }"/>
			</div>
			<div class="form-group">
				<label for="u_pwd" >PASSWORD</label> 
				<input type="text" name="u_pwd" id="u_pwd" class="form-control" value="${vo.u_pwd }"/>
			</div><br>
			<div class="btn-group">
				<input type="submit" class="btn btn-default" value="MODIFY"/>&nbsp;
				<input type="button" id="listBtn" class="btn btn-default" value="LIST">
			</div>		
		</div>
	</form>
</section> --%>
<script>
$(document).ready(function(){
	var mForm = $("#modifyForm");
	
	$("#delBtn").on("click", function(){
		mForm.attr("action", "/admin/deleteFAQ");
		mForm.submit();
	});
	
	$("#listBtn ").on("click", function(){
		mForm.attr("method", "get");
		mForm.attr("action", "/admin/listFAQ");
		mForm.submit();
	});
});
</script>
<%@include file="../include/adminFooter.jsp" %>