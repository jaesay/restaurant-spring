<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>


<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">FAQ</li>
	</ol>
</div>

<section class="container">

<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
		<br><br>
			<div class="a_title text-center" style="margin-bottom:-5.8em;color:#ff5d56;"><h2><span>FAQ</span></h2></div><br /><br />
			<div class="box-body" style="text-align:right;padding:0 5em 3em 0;">
				<select name="searchType">
					<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
					<option value="question" <c:out value="${cri.searchType  eq 'question' ? 'selected' : '' }"/>>Question</option>	
					<option value="answer" <c:out value="${cri.searchType  eq 'answer' ? 'selected' : '' }"/>>Answer</option>						
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				<button id="searchBtn" class="btn btn-default">Search</button>			
			</div>
			<div class="container a_article">
				<c:forEach var="vo" items="${faqList }">
				<div class="row text-center">
					<ul>
				        <li class="faq-menu">
				            <a style="text-decoration:none"><span style="font-size:250%">${vo.f_question }</span></a>
				            <ul class="hide">
				                <li><span style="font-size:200%">${vo.f_answer }</span></li>
				            </ul>
				        </li>
				    </ul>
				</div>
				</c:forEach>
			</div><br>
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
	</div>
	<!-- /.row -->
	<br><br><br>
</section>
<script>
$(document).ready(function(){	
	$('#searchBtn').on("click", function(event){
		self.location = "/faq" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	});	
	 $(".faq-menu>a").click(function(){
         $(this).next("ul").toggleClass("hide");
     });
});
</script>

<%@include file="../include/footer.jsp" %>