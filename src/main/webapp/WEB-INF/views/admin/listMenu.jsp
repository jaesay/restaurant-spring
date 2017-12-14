<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Admin</a></li>
		<li class="active">Menu List</li>
	</ol>
</div>

<section class="container">
<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
	<div class="a_title text-center"><h2><span>MENU LIST</span></h2></div><br />
	<div class="box-body" style="text-align:right;padding:0 7em 3em 0;">
		<select name="searchType">
			<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
			<option value="category" <c:out value="${cri.searchType  eq 'category' ? 'selected' : '' }"/>>Category</option>
			<option value="name" <c:out value="${cri.searchType  eq 'name' ? 'selected' : '' }"/>>Name</option>						
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn" class="btn btn-default">Search</button>			
	</div>
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-1"></div>
			<div class="col-md-1"><b>ID</b></div>
			<div class="col-md-1"><b>IMAGE</b></div>
			<div class="col-md-2"><b>NAME</b></div>
			<div class="col-md-2"><b>CATEGORY</b></div>
			<div class="col-md-1"><b>RATING</b></div>
			<div class="col-md-1"><b>PRICE</b></div>
			<div class="col-md-2"><b>REGISTERED DATE</b></div>
			<div class="col-md-1"></div>
		</div>
		<hr>
		<c:forEach var="vo" items="${menuList }">
			<div class="row text-center">
				<div class="col-md-1"></div>
				<div class="col-md-1">${vo.m_id }</div>
				<div class="col-md-1"><a href="/admin/readMenu${pmk.makeSearch(pmk.cri.page)}&m_id=${vo.m_id }"><img src="${vo.m_img }" alt="img" class="img-responsive"/></a></div>
				<div class="col-md-2"><a href="/admin/readMenu${pmk.makeSearch(pmk.cri.page)}&m_id=${vo.m_id }" style="text-decoration:none">${vo.m_name }</a></div>
				<div class="col-md-2">${vo.m_category }</div>
				<div class="col-md-1">${vo.m_rating }</div>
				<div class="col-md-1">${vo.m_price }</div>
				<div class="col-md-2"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.m_rdate }"/></div>
				<div class="col-md-1"></div>
			</div>
			<hr>
		</c:forEach>
	</div>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pmk.prev }">
					<li><a href="umlistPage${pmk.makeQuery(pmk.startPage-1) }">&laquo;</a></li>
				</c:if>
						
				<c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
					<li <c:out value="${pmk.cri.page == idx? 'class=active' : '' }"/>>
						<a href="umlistPage${pmk.makeQuery(idx) }">${idx }</a>
					</li>
				</c:forEach>
						
				<c:if test="${pmk.next && pmk.endPage > 0}">
					<li><a href="umlistPage${pmk.makeQuery(pmk.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
<form id="jobForm">
	<input type="hidden" name="page" value="${pmk.cri.page}">
	<input type="hidden" name="perPageNum" value="${pmk.cri.perPageNum}">
</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
		<div style="text-align:right;padding-right:7em;">
			<a href="/admin/postMenu${pmk.makeSearch(pmk.cri.page)}" class="btn btn-default">POST</a>		
		</div>
	</div>
	<!-- /.row -->
</section><br><br><br>
<script type="text/javascript">
$(document).ready(function(){
	$('#searchBtn').on("click", function(event){
		self.location = "listMenu" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	})		
})
</script>


<%@include file="../include/adminFooter.jsp" %>