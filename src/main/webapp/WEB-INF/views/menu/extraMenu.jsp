<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Extra Menu</li>
	</ol>
</div>

<!---->
<div class="product">
	<div class="container">
		<div class="col-md-3 product-price" style="margin-left:-0.6em;">
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

		<div class="col-md-9 product-price1" style="margin-bottom:13.3em;">
			<div class="product-right-top">
				<div class="top-product">
					<c:forEach var="mvo" items="${mList}">
						<div class="col-md-4 chain-grid simpleCart_shelfItem">
							<div class="grid-span-1">
		   		     			<a href="/menu/readMenu?m_id=${mvo.m_id }">
			   		     			<img class="img-responsive " src="${mvo.m_img }" alt="menu-img ">
									<div class="link">
			   		     				<ul >
											<li><i class="glyphicon glyphicon-search"> </i></li>	
										</ul>
			   		     			</div>
		   		     			</a>
		   		     		</div>
		   		     		<div class="grid-chain-bottom ">
		   		     			<a href="single.html">${mvo.m_name }</a>
		   		     			<div class="star-price">
									<div class="price-at-bottom ">
										<span class="item_price">$ ${mvo.m_price }</span>
									</div>
		   		     				<div class="clearfix"> </div>
		   		     			</div>
		   		     		</div><br><br>
		   		     	</div>
					</c:forEach>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

				
	<div class="clearfix"> </div>
</div><br>

<%@include file="../include/footer.jsp" %>