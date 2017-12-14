<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>


<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Create an Account</li>
	</ol>
</div>
<!---->
<div class="container">
	<div class="register">
		<h3>PERSONAL INFORMATION</h3>
		<form role="form" method="post" id="registerForm" action="/user/registerPost">
		<input type="hidden" id="isClicked" value="n">
		<input type="hidden" id="isConfirmed" value="n"> 
			<div class="mation">
				<div>
					<span style="display:inline;">Email Address</span>&nbsp;&nbsp;<input type="button" id="checkIdBtn" value="CHECK ID" style="display:inline;font-size:0.6em;width:initial;margin-bottom:0.2em;">
					&nbsp;<span id="checkIdMsg" style="display:inline;"></span>
					<input type="email" name="u_email" id="u_email" placeholder="Enter Your EMAIL"/>
				</div>
				<div>
					<span>Name</span>
					<input type="text" name="u_name" id="u_name" placeholder="Enter Your NAME"/> 
				</div>
				<div>
					<span>Password</span>
					<input type="password" name="u_pwd" id="u_pwd" placeholder="Enter Your PASSWORD"/>
				</div>
				<div>
					<span style="display:inline;">Confirm Password</span>&nbsp;<span id="confirmPwdMsg" style="display:inline;"></span>
					<input type="password" name="pwconfirm" id="pwdconfirm" placeholder="Confirm Your PASSWORD"/>					 
				</div>
			</div>
			<input type="submit" id="regBtn" value="REGISTER"/>
		</form>
	</div>
</div>
<!---->
<script>
$(document).ready(function(){
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

<%@include file="../include/footer.jsp" %>