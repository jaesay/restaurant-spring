<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Admin</a></li>
		<li class="active">FAQ</li>
	</ol>
</div>
<section class="container">

<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
	<div class="a_title text-center" style="margin-bottom:-2em;"><h2><span>FAQ LIST</span></h2></div><br /><br />
	<div class="box-body" style="text-align:right;padding:0 5em 3em 0;">
		<select name="searchType">
			<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
			<option value="writer" <c:out value="${cri.searchType  eq 'writer' ? 'selected' : '' }"/>>Writer</option>
			<option value="question" <c:out value="${cri.searchType  eq 'question' ? 'selected' : '' }"/>>Question</option>	
			<option value="answer" <c:out value="${cri.searchType  eq 'answer' ? 'selected' : '' }"/>>Answer</option>						
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn" class="btn btn-default">Search</button>			
	</div>
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-1"><b>ITEM</b></div>
			<div class="col-md-2"><b>WRITER</b></div>
			<div class="col-md-3"><b>QUESTION</b></div>
			<div class="col-md-3"><b>UPATEDED DATE</b></div>
			<div class="col-md-3"><b>REGISTERED DATE</b></div>
		</div>
		<hr>
		<c:forEach var="vo" items="${faqList }">
			<div class="row text-center">
				<div class="col-md-1"><input type="checkbox" name="delId" value="${vo.f_id }"></div>
				<div class="col-md-2">${vo.f_writer }</div>
				<div class="col-md-3"><a href="/admin/editFAQ${pmk.makeSearch(pmk.cri.page)}&f_id=${vo.f_id }" style="text-decoration:none">${vo.f_question }</a></div>
				<div class="col-md-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.f_rdate }"/></div>
				<div class="col-md-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.f_udate }"/></div>
			</div>
			<hr>
		</c:forEach>
	</div>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pmk.prev }">
					<li><a href="listFAQ${pmk.makeQuery(pmk.startPage-1) }">&laquo;</a></li>
				</c:if>
						
				<c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
					<li <c:out value="${pmk.cri.page == idx? 'class=active' : '' }"/>>
						<a href="listFAQ${pmk.makeQuery(idx) }">${idx }</a>
					</li>
				</c:forEach>
						
				<c:if test="${pmk.next && pmk.endPage > 0}">
					<li><a href="listFAQ${pmk.makeQuery(pmk.endPage + 1) }">&raquo;</a></li>
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
				<button id="regBtn" class="btn btn-default">POST</button>
				<button id="delBtn" class="btn btn-default">DELETE</button>
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
		self.location = "listFAQ" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	});	
	
	$('#regBtn').on("click", function(event){
		self.location="postFAQ"+'${pmk.makeSearch(pmk.cri.page)}';
	});
	
	$('#delBtn').on("click", function(event){
		for(var i=0; i<$("input[name=delId]:checked").length; i++){
			checkboxArr[i]=$("input[name=delId]:checked")[i].value;
		}
		self.location="removeFAQs"+'${pmk.makeSearch(pmk.cri.page)}'+"&cbArr="+checkboxArr;
	});
});
var msg = '${msg}';
if(msg == 'success'){
	alert("Request is completed");
}
</script>
<%@include file="../include/adminFooter.jsp" %>