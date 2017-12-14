<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Login</li>
	</ol>
</div>
<div class="container">
	<div class="account_grid">
		<div class=" login-right">
			<h3>REGISTERED CUSTOMERS</h3>
			<p>If you have an account with us, please log in.</p>
			<form role="form" method="post" id="loginForm" action="/user/loginPost">
				<div>
					<span>Email Address</span>
					<input type="email" name="u_email" id="loginId">
				</div>
				<div>
					<span>Password</span>
					<input type="password" name="u_pwd" id="loginPw"> 
				</div>
				<input type="button" value="LOGIN" id="loginBtn" style="display:inline;">&nbsp;&nbsp;<span id="checkLoginMsg" style="display:inline;"></span>
				<label>
		          <input type="checkbox" name="useCookie"> Remember Me
		        </label>
			</form>
		</div>	
		<div class=" login-left">
			<h3>NEW CUSTOMERS</h3>
			<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			<a class="acount-btn" href="/user/register">Create an Account</a>
		</div>			
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
		var u_check = false;
	$('#loginBtn').on("click",function(){
		var u_email = $("#loginId").val();
		var u_pwd = $("#loginPw").val();
		
		if (loginForm.loginId.value == "" || loginForm.loginPw.value == "") {
			alert("ID & PASSWORD are required");
			loginForm.loginId.focus();
			return;
		}
		
		$.ajax({
			type : 'post',
			url : '/user/checkLogin',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({u_email : u_email, u_pwd : u_pwd}),
			async: false,
			success : function(result){
				if(result =='SUCCESS'){
					u_check = true;
				} else {
					u_check = false;
					$("#checkLoginMsg").css("color","red").html("Check your id and password");
				}
			}
		});
		if(!u_check){
			return false;
		}else{
			loginForm.submit();	
		}
	});
});
</script>

<%@include file="../include/footer.jsp" %>