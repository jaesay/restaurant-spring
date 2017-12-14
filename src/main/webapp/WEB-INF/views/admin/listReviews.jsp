<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Admin</a></li>
		<li class="active">Review List</li>
	</ol>
</div>
<section class="container">
<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
	<div class="a_title text-center"><h2><span>REVIEW LIST</span></h2></div><br /><br />
	<div class="box-body" style="text-align:right;padding:0 7em 3em 0;">
		<select name="searchType">
			<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
			<option value="menuId" <c:out value="${cri.searchType  eq 'menuId' ? 'selected' : '' }"/>>Menu id</option>	
			<option value="writer" <c:out value="${cri.searchType  eq 'writer' ? 'selected' : '' }"/>>Writer</option>					
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn" class="btn btn-default">Search</button>			
	</div>
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-1"></div>
			<div class="col-md-1"><b>ITEM</b></div>
			<div class="col-md-1"><b>MENU ID</b></div>
			<div class="col-md-1"><b>IMAGE</b></div>
			<div class="col-md-1"><b>NAME</b></div>
			<div class="col-md-1"><b>CATEGORY</b></div>
			<div class="col-md-1"><b>REVIEW</b></div>
			<div class="col-md-2"><b>WRITER</b></div>
			<div class="col-md-2"><b>UPDATED DATE</b></div>
			<div class="col-md-1"></div>
		</div>
		<hr>
		<c:forEach var="rvo" items="${reviewList }">
			<c:set var="mvo" value="${rvo.mvo }"/>
			<div class="row text-center">
				<div class="col-md-1"></div>
				<div class="col-md-1"><input type="checkbox" name="delId" value="${rvo.rno }"></div>
				<div class="col-md-1">${rvo.m_id }</div>
				<div class="col-md-1"><a href="#readModal" data-toggle="modal"><img src="${mvo.m_img }" alt="img" class="img-responsive"/></a></div>
				<div class="col-md-1"><a href="#readModal" data-toggle="modal" style="text-decoration:none">${mvo.m_name }</a></div>
				<div class="col-md-1">${mvo.m_category }</div>
				<div class="col-md-1">${rvo.rating }</div>
				<div class="col-md-2">${rvo.replyer }</div>
				<div class="col-md-2"><fmt:formatDate pattern="yyyy-MM-dd" value="${rvo.updatedate }"/></div>
				<div class="col-md-1"></div>
				<div id="readModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title">REVIEW INFO</h3>
							</div>
							<div class="modal-body">
								<div class="row">
									<span class="col-md-5">REPLY ID</span>	
									<span class="col-md-7">${rvo.rno }</span>
								</div>
								<div class="row">
									<span class="col-md-5">MENU ID</span>	
									<span class="col-md-7">${rvo.m_id }</span>
								</div>
								<div class="row">
									<span class="col-md-5">WRITER</span>	
									<span class="col-md-7">${rvo.replyer }</span>
								</div>
								<div class="row">
									<span class="col-md-5">RATING</span>	
									<span class="col-md-7">${rvo.rating }</span>
								</div>
								<div class="row">
									<span class="col-md-5">UPDATED DATE</span>	
									<span class="col-md-7">${rvo.updatedate }</span>
								</div>
								<div class="row">
									<span class="col-md-5">REGISTERED DATE</span>	
									<span class="col-md-7">${rvo.regdate }</span>
								</div><hr>
								<div class="row">
									<span class="col-md-12">CONTENT</span><br>	
									<span class="col-md-12">${rvo.replytext }</span>
								</div><hr>
								<div class="ver_center">
									<div class="btn-group">
										<a href="/admin/deleteReply${pmk.makeSearch(pmk.cri.page)}&rno=${rvo.rno }" class="btn btn-default">DELETE</a>
										<button type="button" class="btn btn-default" data-dismiss="modal">BACK</button>
									</div>
								</div>		
							</div>
						</div>
					</div>
				</div>			
			</div>
			<hr>
		</c:forEach>
	</div>
	<div class="box-footer">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pmk.prev }">
					<li><a href="listReviews${pmk.makeQuery(pmk.startPage-1) }">&laquo;</a></li>
				</c:if>
						
				<c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
					<li <c:out value="${pmk.cri.page == idx? 'class=active' : '' }"/>>
						<a href="listReviews${pmk.makeQuery(idx) }">${idx }</a>
					</li>
				</c:forEach>
						
				<c:if test="${pmk.next && pmk.endPage > 0}">
					<li><a href="listReviews${pmk.makeQuery(pmk.endPage + 1) }">&raquo;</a></li>
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
			</div>
		</div>
	</div>
	<!-- /.row -->
</section><br><br><br>
<script type="text/javascript">
$(document).ready(function(){
	var checkboxArr = ['','','','','','','','','',''];
	
	$('#searchBtn').on("click", function(event){
		self.location = "listReviews" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	});		
	
	$('#delBtn').on("click", function(event){
		var delCount = $("input[name=delId]:checked").length
		for(var i=0; i< delCount; i++){
			checkboxArr[i]=$("input[name=delId]:checked")[i].value;
		}
		self.location="removeReplies"+'${pmk.makeSearch(pmk.cri.page)}'+"&cbArr="+checkboxArr+"&delCount="+delCount;
	});
})
</script>


<%@include file="../include/adminFooter.jsp" %>