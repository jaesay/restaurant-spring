<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<%-- <section class="container">
		<form role="form" method="post" id="editForm" action="/user/edit">
		<input type="hidden" id="isConfirmed" value="n">
		<input type="hidden" id="checkCrtPwd" value="n">
			<div id="register-container">
				<div class="">
					<h3>REGISTER</h3>
				</div>
				<div class="form-group">
					<label for="u_email">EMAIL</label>
					<input type="email" name="u_email" id="u_email" class="form-control" value=${uvo.u_email } readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="u_name" >NAME</label> 
					<input type="text" name="u_name" id="u_name" class="form-control" value="${uvo.u_name }"/>
				</div>
				<div class="form-group">
					<label for="u_pwd" >NEW PASSWORD</label> 
					<input type="password" name="u_pwd" id="u_pwd" class="form-control" placeholder="Enter Your PASSWORD"/>
				</div>
				<div class="form-group">
					<label for="pwdconfirm" >CONFIRM</label>&nbsp;<span id="confirmPwdMsg"></span>
					<input type="password" name="pwconfirm" id="pwdconfirm" class="form-control" />
				</div>
				<div class="form-group">
					<label for="chkpwd" >CURRENT PASSWORD</label>&nbsp;<span id="crtPwdMsg"></span>
					<input type="password" name="chkpwd" id="chkpwd" class="form-control" />
				</div><br>
					<div class="ver_center">
					<input type="submit" class="btn btn-default" id="editBtn" value="REGISTER"/>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)" class="btn btn-default">CANCEL</a>
				</div>		
			</div>
		</form>
</section>
 --%>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Edit My Profile</li>
	</ol>
</div>
<!---->
<div class="container">
	<div class="register">
		<h3>PERSONAL INFORMATION</h3>
		<form role="form" method="post" id="editForm" action="/user/edit">
		<input type="hidden" id="isConfirmed" value="n">
		<input type="hidden" id="checkCrtPwd" value="n"> 
			<div class="mation">
				<div>
					<span>Email Address</span>
					<input type="email" name="u_email" id="u_email" value=${uvo.u_email } readonly="readonly"/>
				</div>
				<div>
					<span>Name</span>
					<input type="text" name="u_name" id="u_name" value="${uvo.u_name }"/>
				</div>
				<div>
					<span>New Password</span>
					<input type="password" name="u_pwd" id="u_pwd" placeholder="Enter Your New PASSWORD"/>
				</div>
				<div>
					<span style="display:inline;">Confirm Password</span>&nbsp;<span id="confirmPwdMsg" style="display:inline;"></span>
					<input type="password" name="pwconfirm" id="pwdconfirm" placeholder="Confirm Your PASSWORD"/>					 
				</div>
				<div>
					<span style="display:inline;">Current Password</span>&nbsp;<span id="crtPwdMsg" style="display:inline;"></span>
					<input type="password" name="chkpwd" id="chkpwd"/>
				</div>
			</div>
			<input type="submit" id="regBtn" value="EDIT"/>
		</form>
	</div>
</div>
<!---->
<script>
$(document).ready(function(){	
	$("#editBtn").on("click", function(){
		if($("#u_email").val()=='' || $("#u_name").val()==''||$("#u_pwd").val()==''||$("#pwdconfirm").val()==''||$("#chkpwd").val()==''){
			alert("you must enter all blanks");
			return false;
		}
		if($("#checkCrtPwd").val()=='n'){
			alert("Check your current password");
			return false;
		}
		if($("#isConfirmed").val()=='n'){
			alert("Check your new password");
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
	$("#chkpwd").keyup(function(){
		if($("#chkpwd").val() != '${uvo.u_pwd}'){
			$("#crtPwdMsg").text('');
			$("#crtPwdMsg").css("color","red").html("Password is incorrect");
			$("#checkCrtPwd").val('n');
		}else{
			$("#crtPwdMsg").text('');
			$("#crtPwdMsg").css("color","blue").html("Password is correct");
			$("#checkCrtPwd").val('y');
		}
	});
});
</script>
<%@include file="../include/footer.jsp" %>