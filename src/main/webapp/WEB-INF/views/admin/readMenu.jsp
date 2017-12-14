<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Admin</a></li>
		<li>Menu List</li>
		<li class="active">Menu Detail</li>
	</ol>
</div>


<section>
	<div class="a_title text-center"><h2>MENU INFORMATION</h2></div><br />
	<form role="form" method="post">
		<input type="hidden" name="m_id" value="${mvo.m_id }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">					
	</form>
	<div class="container a_article">
		<div class="hor_center">
		<div class="row">
			<div class="col-md-5">
				<img src="${mvo.m_img }" alt="img" class="img-responsive" />
			</div>
			<div class="col-md-7" style="margin-top:1.5em">
				<div class="row">
					<span class="col-md-5">MENU ID</span>
					<span class="col-md-7">${mvo.m_id }</span>
				</div>
				<div class="row">
					<span class="col-md-5">CATEGORY</span>	
					<span class="col-md-7">${mvo.m_category }</span>
				</div>
				<div class="row">
					<span class="col-md-5">NAME</span>
					<span class="col-md-7">${mvo.m_name }</span>
				</div>
				<div class="row">
					<span class="col-md-5">PRICE</span>
					<span class="col-md-7"><strong>$${mvo.m_price }</strong></span>
				</div>
				<div class="row">
					<span class="col-md-5">RATING</span>
					<span class="col-md-7">${mvo.m_rating }</span>
				</div>
				<div class="row">
					<span class="col-md-5">REPLY</span>
					<span class="col-md-7">${mvo.replycnt }</span>
				</div>
				<div class="row">
					<span class="col-md-5">DATE</span>
					<span class="col-md-7"><fmt:formatDate pattern="yyyy-MM-dd" value="${mvo.m_rdate }"/></span>
				</div>
			</div>
		</div>
		</div><hr />
		<div class="hor_center">
		<div class="row">
			<div>
				<h3>DETAIL CONTENT</h3>
			</div>
			<div class="row">
				<span class="col-md-12">${mvo.m_content }</span>				
			</div>
		</div>
		</div>
		<hr />
		<hr />
		<div class="hor_center">
			<div class="btn-group">
				<button type="submit" class="btn btn-default" id="modifyBtn">MODIFY</button>
				<a href="#mmdModal" data-toggle="modal" class="btn btn-default">DELETE</a>
				<button type="submit" class="btn btn-default" id="listBtn">BACK</button>
			</div>
			<div id="mmdModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title text-center">COMFIRM DELETING</h3>
						</div>
						<div class="modal-body text-center">
							<h3>DELETE THIS MENU AND REVIEWS? CHECK ONCE MORE.</h3><br />
						</div>
						<div class="modal-footer">
							<div class="btn-group">
								<button type="submit" class="btn btn-default" id="removeBtn">REMOVE</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>	
      					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section><br><br><br>
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/admin/editMenu");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/admin/deleteMenu");
		formObj.submit();
	});
	
	$("#listBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/admin/listMenu");
		formObj.submit();
	});
});
</script>

<%@include file="../include/adminFooter.jsp" %>