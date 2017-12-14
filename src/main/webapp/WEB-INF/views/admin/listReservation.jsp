<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>
<section class="container">
<div class="row">
		<!-- left column -->
		<div class="col-md-12"><div>
	<div class="a_title text-center"><h2><span>RESERVATION LIST</span></h2></div><br /><br />
	<div class="box-body" style="text-align:right;padding:0 5em 3em 0;">
		<select name="searchType">
			<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
			<option value="name" <c:out value="${cri.searchType  eq 'name' ? 'selected' : '' }"/>>Name</option>
			<option value="phone" <c:out value="${cri.searchType  eq 'phone' ? 'selected' : '' }"/>>Phone</option>	
			<option value="email" <c:out value="${cri.searchType  eq 'email' ? 'selected' : '' }"/>>E-mail</option>					
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn" class="btn btn-default">Search</button>			
	</div><br><br>
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-1"><b>ITEM</b></div>
			<div class="col-md-1"><b>ID</b></div>
			<div class="col-md-2"><b>NAME</b></div>
			<div class="col-md-2"><b>E-MAIL</b></div>
			<div class="col-md-2"><b>PHONE</b></div>
			<div class="col-md-1"><b>PEOPLE</b></div>
			<div class="col-md-2"><b>DATE</b></div>
			<div class="col-md-1"><b>STATE</b></div>
		</div>
		<hr>
		<c:forEach var="rvo" items="${reservationList }">
			<div class="row text-center">
				<div class="col-md-1"><input type="checkbox" name="delId" value="${rvo.r_id }"></div>
				<div class="col-md-1"><a href="#readModal" data-toggle="modal" style="text-decoration:none">${rvo.r_id }</a></div>
				<div class="col-md-2">${rvo.r_name }</div>
				<div class="col-md-2">${rvo.r_email }</div>
				<div class="col-md-2">${rvo.r_phone }</div>
				<div class="col-md-1">${rvo.r_people }</div>
				<div class="col-md-2">${rvo.r_date }&nbsp;<fmt:formatNumber value="${rvo.r_time/60 }" pattern="##"/>:<fmt:formatNumber value="${rvo.r_time%60 }" pattern="00"/></div>
				<c:catch>
					<c:choose>
						<c:when test="${rvo.r_date > date}"><div class="col-md-1">expired</div></c:when>
						<c:when test="${rvo.r_date < date}"><div class="col-md-1">completed</div></c:when>
						<c:when test="${rvo.r_date eq date}">
							<c:catch>
								<c:choose>
									<c:when test="${rvo.r_time > time }"><div class="col-md-1">completed</div></c:when>
									<c:when test="${rvo.r_time <= time }"><div class="col-md-1">expired</div></c:when>
								</c:choose>
							</c:catch>
						</c:when>
					</c:choose>
				</c:catch>
				<div id="readModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title">RESERVATION DETAIL</h3>
							</div>
							<div class="modal-body">
								<div class="row">
									<span class="col-md-5">ID</span>	
									<span class="col-md-7">${rvo.r_id }</span>
								</div>
								<div class="row">
									<span class="col-md-5">E-MAIL</span>	
									<span class="col-md-7">${rvo.r_email }</span>
								</div>
								<div class="row">
									<span class="col-md-5">NAME</span>	
									<span class="col-md-7">${rvo.r_name }</span>
								</div>
								<div class="row">
									<span class="col-md-5">PHONE</span>	
									<span class="col-md-7">${rvo.r_phone }</span>
								</div>
								<div class="row">
									<span class="col-md-5">PEOPLE</span>	
									<span class="col-md-7">${rvo.r_people }</span>
								</div>
								<div class="row">
									<span class="col-md-5">DATE</span>	
									<span class="col-md-7">${rvo.r_date } ${rvo.r_time }</span>
								</div><hr>
								<div class="row">
									<span class="col-md-12">MESSAGE</span><br>	
									<span class="col-md-12">${rvo.r_message }</span>
								</div><hr>
								<div class="ver_center">
									<div class="btn-group">
										<a href="/admin/deleteReservation${pmk.makeSearch(pmk.cri.page)}&r_id=${rvo.r_id }" class="btn btn-default">DELETE</a>
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
			</div>
		</div>
	</div>
	<!-- /.row -->
</section><br><br><br>
<script type="text/javascript">
$(document).ready(function(){
	var checkboxArr = ['','','','','','','','','',''];
	
	$('#searchBtn').on("click", function(event){
		self.location = "listReservation" +'${pmk.makeQuery(1)}'
		+"&searchType=" +$("select option:selected").val()
		+"&keyword="+$('#keywordInput').val();
	})		
	
	$('#delBtn').on("click", function(event){
		var delCount = $("input[name=delId]:checked").length
		for(var i=0; i< delCount; i++){
			checkboxArr[i]=$("input[name=delId]:checked")[i].value;
		}
		self.location="removeReservations"+'${pmk.makeSearch(pmk.cri.page)}'+"&cbArr="+checkboxArr;
	});
})
</script>


<%@include file="../include/adminFooter.jsp" %>