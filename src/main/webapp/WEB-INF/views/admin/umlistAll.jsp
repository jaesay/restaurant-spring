<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<section class="container">
	<div class="a_title text-center"><h2><span>MEMBER LIST</span></h2></div><br /><br />
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-3"><span>EMAIL</span></div>
			<div class="col-md-3"><span>FIRST NAME</span></div>
			<div class="col-md-3"><span>LAST NAME</span></div>
			<div class="col-md-3"><span>REGISTERED DATE</span></div>
		</div>
		<hr>
		<c:forEach var="vo" items="${userList }">
			<div class="row text-center">
				<div class="col-md-3"><a href="${basePath }/umDetailCtrl?email=${vo.u_email }" class="btn btn-default">${vo.u_email }</a></div>
				<div class="col-md-3">${vo.u_fname }</div>
				<div class="col-md-3">${vo.u_lname }</div>
				<div class="col-md-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.u_rdate }"/></div>
			</div>
			<hr>
		</c:forEach>
	</div>
</section>

<%@include file="../include/adminFooter.jsp" %>