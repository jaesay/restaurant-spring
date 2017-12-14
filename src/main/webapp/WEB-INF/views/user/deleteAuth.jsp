<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<%-- <section class="container">
		<form role="form" method="post" id="checkPwdForm" action="/user/deleteId">
		<input type="hidden" id="isConfirmed" value="n">
			<div id="login-container">
				<div class="">
					<h3>Confirm Your Info</h3>
				</div>
				<div class="form-group">
					<label for="u_email">EMAIL</label>
					<input type="email" class="form-control" name="u_email" id="u_email" value="${login.u_email}" maxlength="35" size="35" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="u_pwd">PASSWORD</label>&nbsp;<span id="checkPwdMsg"></span>
					<input type="password" class="form-control" name="u_pwd" id="u_pwd" maxlength="35" size="35">
				</div>
				<div class="">
					<input type="button" value="OK" class="btn btn-default" id="checkPwdBtn">&nbsp;
					<a href="javascript:history.go(-1)" class="btn btn-default">CANCEL</a>
				</div>
				<br>	
			</div>
		</form>
</section> --%>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Delete My Account</li>
	</ol>
</div>
<div class="container">
	<div class="account_grid">
		<div class=" login-right">
			<h3>Confirm Your Info</h3>
			<p>If you want to delete your account, please confirm yourself.</p>
			<form role="form" method="post" id="checkPwdForm" action="/user/deleteId">
			<input type="hidden" id="isConfirmed" value="n">
				<div>
					<span>Email Address</span>
					<input type="email" name="u_email" id="u_email" value="${login.u_email}" readonly="readonly">
				</div>
				<div>
					<span style="display:inline;">Password</span>&nbsp;&nbsp;<span id="checkPwdMsg" style="display:inline;"></span>
					<input type="password" name="u_pwd" id="u_pwd"> 
				</div>
				<input type="button" value="OK" id="checkPwdBtn">
				<input type="button" value="CANCEL" id="backBtn">
			</form>
		</div>		
	</div>
</div>

<script>
$(document).ready(function(){
	$("#backBtn").on("click", function(){
		history.go(-1)();
	})
	
	$("#checkPwdBtn").on("click", function(){
		u_email = $("#u_email").val();
		u_pwd = $("#u_pwd").val();
		if(u_pwd==''){
			$("#checkIdMsg").css("color","red").html("Enter your pwd");
			$("#isConfirmed").val('n');
			return;
		}
		
		$.ajax({
			type : 'post',
			url : '/user/checkPwd',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({u_email : u_email, u_pwd : u_pwd}),
			success : function(result){
				if(result =='SUCCESS'){
					$("#checkPwdMsg").html("");
					$("#isConfirmed").val('y');
				} else {
					$("#checkPwdMsg").css("color","red").html("Password is incorrect");
					$("#isConfirmed").val('n');
				}
			}
		});
		
		if($("#isConfirmed").val()=='n'){
			return false;
		} else{
			$("#checkPwdForm").submit();
		}
	});
});
</script>

<%@include file="../include/footer.jsp" %>