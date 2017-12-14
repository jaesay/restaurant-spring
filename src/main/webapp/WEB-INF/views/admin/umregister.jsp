<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<section class="container">
<form role="form" method="post" id="registerForm" action="/admin/umregister">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	<input type="hidden" id="isClicked" value="n">
	<input type="hidden" id="isConfirmed" value="n"> 
	<div id="register-container">
		<div class="">
			<h3>REGISTER</h3>
			</div>
			<div class="form-group">
				<label for="u_email" style="display:inline;">EMAIL</label>&nbsp;&nbsp;<input type="button" id="checkIdBtn" value="CHECK ID"  class="btn btn-default" style="display:inline;font-size:0.6em;width:initial;margin-bottom:0.2em;">
					&nbsp;<span id="checkIdMsg" style="display:inline;"></span>
				<input type="email" name="u_email" id="u_email" class="form-control" placeholder="Enter Your EMAIL"/>
			</div>
			<div class="form-group">
				<label for="u_name" >NAME</label> 
				<input type="text" name="u_name" id="u_name" class="form-control" placeholder="Enter Your NAME"/>
			</div>
			<div class="form-group">
				<label for="u_pwd" >PASSWORD</label> 
				<input type="password" name="u_pwd" id="u_pwd" class="form-control" placeholder="Enter Your PASSWORD"/>
			</div>
			<div class="form-group">
				<label for="pwdconfirm" style="display:inline;" >CONFIRM</label>&nbsp;<span id="confirmPwdMsg" style="display:inline;"></span> 
				<input type="password" name="pwconfirm" id="pwdconfirm" class="form-control" />
			</div><br />
			<div class="btn-group">
				<input type="submit" class="btn btn-default" id="regBtn" value="REGISTER"/>
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
	
	$("#checkIdBtn").on("click", function(){
		u_email = $("#u_email").val();
		if(u_email==''){
			$("#checkIdMsg").css("color","red").html("Enter your id");
			$("#isClicked").val('n');
			return;
		}
		
		if($("#u_email").val().match('@')==null) {
			$("#checkIdMsg").css("color","red").html("Id must include @");
			$("#isClicked").val('n');
			return;
		}
		if($("#u_email").val().match('.')==null) {
			$("#checkIdMsg").css("color","red").html("Id must include .");
			$("#isClicked").val('n');
			return;
		}
		
		$.ajax({
			type : 'post',
			url : '/user/checkId',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({u_email : u_email}),
			success : function(result){
				if(result =='SUCCESS'){
					$("#checkIdMsg").css("color","blue").html("You can use the id");
					$("#isClicked").val('y');
				} else {
					$("#checkIdMsg").css("color","red").html("The id is already registered");
					$("#isClicked").val('n');
				}
			}
		});
	});
	
	$("#regBtn").on("click", function(){
		if($("#u_email").val()=='' || $("#u_name").val()==''||$("#u_pwd").val()==''||$("#pwdconfirm").val()==''){
			alert("you must enter all blanks");
			return false;
		}
		if($("#isClicked").val()=='n'){
			alert("Check your id");
			return false;
		}
		if($("#isConfirmed").val()=='n'){
			alert("Check your password");
			return false;
		}
	});
	
	$("#pwdconfirm").keyup(function(){
		if($("#u_pwd").val() != $("#pwdconfirm").val()){
			$("#confirmPwdMsg").text('');
			$("#confirmPwdMsg").css("color","red").html("Passwords do not match");
			$("#isConfirmed").val('n');
		}else{
			$("#confirmPwdMsg").text('');
			$("#confirmPwdMsg").css("color","blue").html("Passwords match");
			$("#isConfirmed").val('y');
		}
	});
});
</script>
<%@include file="../include/adminFooter.jsp" %>