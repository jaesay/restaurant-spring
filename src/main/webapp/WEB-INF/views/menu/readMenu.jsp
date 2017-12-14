<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li><a href="/">${mvo.m_category }</a></li>
		<li class="active">Menu Details</li>
	</ol>
</div>

<!---->
<div class="product">
	<div class="container">
		<div class="col-md-3 product-price">
			<div class=" rsidebar span_1_of_left">
				<div class="of-left">
					<h3 class="cate">CATEGORIES</h3>
				</div>
		 		<ul class="menu">
					<li class="item1"><a href="/menu/main">Main </a></li>
					<li class="item2"><a href="/menu/special">Special </a></li>
					<li class="item3"><a href="/menu/side">Side</a></li>
					<li class="item4"><a href="/menu/extra">Extra</a></li>
					<li class="item5"><a href="/menu/beverage">Beverage</a></li>
				</ul>
			</div>
		</div>

		<div class="col-md-9 product-price1">
			<div class="col-md-5 single-top">
				<div class="thumbnail_container">
					<div class="thumbnail">
				    	<img src="${mvo.m_img }" class="img-responsive" alt="menu-img"/>
					</div>
				</div> 	
				<%-- <img class="img-responsive" src="${mvo.m_img }" alt="menu-img" style="border:1px solid #c3c3c3;width:70%;">	 --%>
			</div>
			<div class="col-md-7 single-top-in simpleCart_shelfItem">
				<%-- <div class='square-box'>
				    <div class='square-content'>
				    	<div>
				    		<span>
				    			[${mvo.m_category }] ${mvo.m_name }<br>
				    			<font style="color:#ff5d56;">
				    				$ ${mvo.m_price }
				    			</font>
				    		</span>
				    	</div>
				    </div>
					<div class="star-rating" style="margin-top:-7em;">
						<p id="newStar" style="width:${mvo.m_rating*20}%;"><span id="newRating">${mvo.m_rating }</span></p>
					</div>
				</div> --%>
				<div class="single-para ">
						<h4>[${mvo.m_category }] ${mvo.m_name }</h4>
							<div class="star-on">
			
								<div class="star-rating">
						<p id="newStar" style="width:${mvo.m_rating*20}%;"><span id="newRating">${mvo.m_rating }</span></p>
					</div>
							<div class="clearfix"> </div>
							</div>
							
							<h5 class="item_price">$ ${mvo.m_price }</h5>
							<div class="available" style="font-size:20px;word-break:break-all;">
									${mvo.m_content }								
								
								<div class="clearfix"> </div>
							</div>
							<ul class="tag-info">
								<li><span>For</span>
								<span class="info1">: 1 Person,</span></li>
								<li><span>Packing</span>
								<span class="info2">: Available</span></li>
							</ul>
							
						</div>
			<!---->
			</div>
			<div class="clearfix"> </div><br><br>
			<div class="cd-tabs">
			<%-- <nav>
				<ul class="cd-tabs-navigation">
					<li><a data-content="fashion"  href="#0">Description </a></li>
					<li><a data-content="television" href="#0" class="selected ">Extra Service</a></li>
				</ul> 
			</nav>
			<ul class="cd-tabs-content">
				<li data-content="fashion" >
					<div class="facts">
						${mvo.m_content }	       
					</div>
				</li>
				<li data-content="television" class="selected">
					nothing
				</li>
			</ul> --%>
				<div class="row">
					<div class="comments-top-top">
						<div class="top-comment-left">
							<img class="img-responsive" src="/resources/bootstrap/images/review-icon1.png" alt="review-icon">
						</div>
						<div class="top-add-comment-right">
							<textarea rows="5" cols="87" placeholder="REPLY TEXT" id="newReplyText"></textarea>
						</div>
						<div class="clearfix"> </div>
						<div style="text-align:right;margin-right:4.5em;">
							<form>
							<div class="stars">
								<input type="radio" name="rating" class="star-1" id="star-1" value="0.5"/>
								<label class="star-1" for="star-1"></label>
								<input type="radio" name="rating" class="star-2" id="star-2" value="1"/>
								<label class="star-2" for="star-2"></label>
								<input type="radio" name="rating" class="star-3" id="star-3" value="1.5"/>
								<label class="star-3" for="star-3"></label>
								<input type="radio" name="rating" class="star-4" id="star-4" value="2"/>
								<label class="star-4" for="star-4"></label>
								<input type="radio" name="rating" class="star-5" id="star-5" value="2.5"/>
								<label class="star-5" for="star-5"></label>
								<input type="radio" name="rating" class="star-6" id="star-6" value="3"/>
								<label class="star-6" for="star-6"></label>
								<input type="radio" name="rating" class="star-7" id="star-7" value="3.5"/>
								<label class="star-7" for="star-7"></label>
								<input type="radio" name="rating" class="star-8" id="star-8" value="4"/>
								<label class="star-8" for="star-8"></label>
								<input type="radio" name="rating" class="star-9" id="star-9" value="4.5"/>
								<label class="star-9" for="star-9"></label>
								<input type="radio" name="rating" class="star-10" id="star-10" value="5"/>
								<label class="star-10" for="star-10"></label>
								<span></span>
							</div>
							
							</form>
							
							
							
							
							<span id="newReplyWriter" >${login.u_email}</span>&nbsp;<button type="submit" id="replyAddBtn" >REGISTER</button>
						</div>
					</div>
					<hr>				
					<ul class="timeline">
						<li class="time-label" id="repliesDiv">
						<h4 class="btn-link" style="text-decoration:none">All REVIEWS<small id="replycntSmall">[${mvo.replycnt}]</small></h4></li>
					</ul>
					<div class="text-center">
						<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
					</div>
					<!-- modal division Begin-->
					<div id="modifyModal" class="modal modal-primary fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title"></h4>
					      </div>
					      <div class="modal-body" data-rno>
					      <form>
					      	<div class="stars1">
								<input type="radio" name="mrating" class="star-11" id="star-11" value="0.5"/>
								<label class="star-11" for="star-11"></label>
								<input type="radio" name="mrating" class="star-12" id="star-12" value="1"/>
								<label class="star-12" for="star-12"></label>
								<input type="radio" name="mrating" class="star-13" id="star-13" value="1.5"/>
								<label class="star-13" for="star-13"></label>
								<input type="radio" name="mrating" class="star-14" id="star-14" value="2"/>
								<label class="star-14" for="star-14"></label>
								<input type="radio" name="mrating" class="star-15" id="star-15" value="2.5"/>
								<label class="star-15" for="star-15"></label>
								<input type="radio" name="mrating" class="star-16" id="star-16" value="3"/>
								<label class="star-16" for="star-16"></label>
								<input type="radio" name="mrating" class="star-17" id="star-17" value="3.5"/>
								<label class="star-17" for="star-17"></label>
								<input type="radio" name="mrating" class="star-18" id="star-18" value="4"/>
								<label class="star-18" for="star-18"></label>
								<input type="radio" name="mrating" class="star-19" id="star-19" value="4.5"/>
								<label class="star-19" for="star-19"></label>
								<input type="radio" name="mrating" class="star-20" id="star-20" value="5"/>
								<label class="star-20" for="star-20"></label>
								<span></span>
							</div>
					      	</form> 
					        <p><input type="text" id="replytext" class="form-control"></p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" id="replyModBtn">MODIFY</button>
					        <button type="button" class="btn btn-default" id="replyDelBtn">DELETE</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">ClOSE</button>
					      </div>
					    </div>
					  </div>
					</div> 
					
					<div id="loginModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title text-center">LOGIN MESSAGE</h4>
								</div>
								<div class="modal-body text-center">
									<h3>You must log in this website to write a review. </h3><br />
								</div>
								<div class="modal-footer">
									<div class="btn-group">
										<a class="btn btn-default" id="loginBtn">LOGIN</a>
										<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
									</div>	
		      					</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Reply Division JS Begin-->	
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
	<div class="comments-top-top">
		<div class="top-comment-left">
			<img class="img-responsive" src="/resources/bootstrap/images/review-icon.png" alt="review-icon">
		</div>
		<div class="top-comment-right">
			<h6><a href="#">{{replyer}}</a> - {{prettifyDate regdate}}</h6>
			<p>{{replytext}}</p>
			<div class="star-rating" style="margin-top:-7em;">
				<p id="newStar" style="width:{{calStar rating}}%;"><span id="newRating">{{rating}}</span></p>
			</div>
			{{#isReplier replyer}}
				<div style="text-align:right;">
					<a class="btn btn-default btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
				</div>
			{{else}}
			{{/isReplier}}
		</div>
		<div class="clearfix"> </div>
	</div>
</li>
{{/each}}
</script>

<script>
	var showReviews = false;
	var email = '${login.u_email}';
	
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("isReplier", function(replier, options){
		if(email==replier){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	
	Handlebars.registerHelper("calStar", function(rating, options){
		var result = rating * 20;
		return result;
	});
	
	

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		console.log(replyArr);
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}
	
var m_id = ${mvo.m_id};
	
	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pmk, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("["+data.pmk.totalCount +"]");
			$("#newRating").html(''+data.reviewScore);
			$("#newStar").css('width', data.reviewScore*20 +"%")
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};
	
	$("#repliesDiv").on("click", function() {
		if(showReviews == false){
			showReviews = true;
			if ($(".timeline li").lengh > 1) {
				return;
			}
			getPage("/replies/" + m_id + "/1");
		}else{
			showReviews = false;
			$('.timeline .replyLi').remove();
			$('#pagination li').remove();
		}

	});
	
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+m_id+"/"+replyPage);
		
	});
	
	$("#replyAddBtn").on("click",function(){
		if($("#newReplyWriter").html()=="" ){
			$("#loginModal").modal();
			return false;
		}
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.html();
		 var replytext = replytextObj.val();
		 var rating = $('input:radio[name="rating"]:checked').val();
		  
		 if(rating == null){
			 rating = 0;
		 }
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({m_id:m_id, replyer:replyer, replytext:replytext, rating: rating}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("Wrote your review");
						replyPage = 1;
						getPage("/replies/"+m_id+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
   					    $('input:radio[name="rating"]').prop('checked',false);
					}
			}});
	});
	
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  var rating = $('input:radio[name="mrating"]:checked').val();
		  
		  if(rating == null){
				 rating = 0;
		  }
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({m_id:m_id,replytext:replytext, rating:rating}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("Edited your review");
						getPage("/replies/"+m_id+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("Deleted your review");
						getPage("/replies/"+m_id+"/"+replyPage );
						$('#pagination li').remove();
					}
			}});
	});
</script>

<script>
	$('#newReplyText').on("click", function(){
		if($("#newReplyWriter").html()=="" ){
			$("#loginModal").modal();		
		}
	});
	$("#loginBtn").attr("href", "/user/login?go=" + location.href);

</script>

<script>
	$('.rating').click(function(){
		$('#replyAddBtn').focus();
	});
</script>

<%@include file="../include/footer.jsp" %>