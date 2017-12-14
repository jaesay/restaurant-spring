<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Admin</a></li>
		<li class="active">Member</li>
	</ol>
</div>
<section class="container">

<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
	<div class="a_title text-center" style="margin-bottom:-2em;"><h2><span>MEMBER LIST</span></h2></div><br /><br />
	<div class="box-body" style="text-align:right;padding:0 5em 3em 0;">
		<select name="searchType">
			<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
			<option value="email" <c:out value="${cri.searchType  eq 'email' ? 'selected' : '' }"/>>email</option>
			<option value="name" <c:out value="${cri.searchType  eq 'name' ? 'selected' : '' }"/>>Name</option>						
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn" class="btn btn-default">Search</button>			
	</div>
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-1"><b>ITEM</b></div>
			<div class="col-md-4"><b>EMAIL</b></div>
			<div class="col-md-3"><b>NAME</b></div>
			<div class="col-md-4"><b>REGISTERED DATE</b></div>
		</div>
		<hr>
		<c:forEach var="vo" items="${userList }">
			<div class="row text-center">
				<div class="col-md-1"><input type="checkbox" name="delId" value="${vo.u_email }"></div>
				<div class="col-md-4"><a href="/admin/ummodify${pmk.makeSearch(pmk.cri.page)}&u_email=${vo.u_email }" style="text-decoration:none">${vo.u_email }</a></div>
				<div class="col-md-3">${vo.u_name }</div>
				<div class="col-md-4"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.u_rdate }"/></div>
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
			<div class="btn-group">
				<button id="delBtn" class="btn btn-default">DELETE</button>
				<button id="regBtn" class="btn btn-default">REGISTER</button>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<br><br><br>
</section>
<script type="text/javascript">
$(document).ready(function(){
	var checkboxArr = ['','','','','','','','','',''];
	
	$('#searchBtn').on("click", function(event){
		self.location = "umlistPage" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	});	
	
	$('#regBtn').on("click", function(event){
		self.location="umregister"+'${pmk.makeSearch(pmk.cri.page)}';
	});
	
	$('#delBtn').on("click", function(event){
		for(var i=0; i<$("input[name=delId]:checked").length; i++){
			checkboxArr[i]=$("input[name=delId]:checked")[i].value;
		}
		self.location="umremove"+'${pmk.makeSearch(pmk.cri.page)}'+"&cbArr="+checkboxArr;
	});
});
var msg = '${msg}';
if(msg == 'success'){
	alert("Request is completed");
}
</script>
<%@include file="../include/adminFooter.jsp" %>