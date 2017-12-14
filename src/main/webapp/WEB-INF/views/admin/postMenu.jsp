<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/adminHeader.jsp" %>
<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li>Menu</li>
		<li class="active">Post Menu</li>
	</ol>
</div>
<section>
<form id="mform" action="/admin/postMenu" method="post" enctype="multipart/form-data">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	<div class="a_title text-center"><h2>MENU INFORMATION</h2></div><br />
	<div class="container a_article">
		<div class="hor_center">
		<div class="row">
			<div id="holder" class="col-md-5">
				<img src="" width="200" height="200" alt="Menu Picture"/>
			</div>
			<div class="col-md-7" style="margin-top:3em">
				<div class="row">
					<span class="col-md-5"><label for="m_category">CATEGORY</label></span>
					<span class="col-md-7">
						<select name="m_category" id="m_category">
						    <option value="Main">Main</option>
						    <option value="Special">Special</option>
						    <option value="Side">Side</option>
						    <option value="Extra">Extra</option>
						    <option value="Beverage">Beverage</option>
						</select>
					</span>
				</div>
				<div class="row">
					<span class="col-md-5"><label for="m_name">NAME</label></span>	
					<span class="col-md-7"><input type="text" name="m_name" id="m_name"></span>
				</div>
				<div class="row">
					<span class="col-md-5"><label for="m_price">PRICE</label></span>
					<span class="col-md-7"><input type="number" name="m_price" id="m_price"></span>
				</div>
				<div class="row">
					<span class="col-md-12"><input type="file" name="file" id="m_file"></span>
				</div>
			</div>
		</div>
		</div><hr />
		<div class="hor_center">
		<div class="row">
			<div>
				<h3><label for="m_content">DETAIL CONTENT</label></h3>
			</div>
			<div class="row">
				<span class="col-md-12">
					<textarea name="m_content" id="m_content" cols="100" rows="15"></textarea>
				</span>				
			</div>
		</div>
		</div>
		<hr />
		<div class="hor_center">
			<div class="btn-group">
				<input type="submit" value="POST" class="btn btn-default" id="regBtn">
				<a href="javascript:history.go(-1)" class="btn btn-default">CANCEL</a>
			</div>
		</div>
	</div>
</form>
</section><br><br><br>
<script>
var upload = document.getElementsByTagName('input')[6];
var holder = document.getElementById('holder');

$("#regBtn").on("click",function(){
	if($("#m_name").val()==""||$("#m_price").val()==""||$("#m_content").val()==""||$("#m_file").val()==""){
		alert("you must write something in the blanks!");
		return false;
	}	
});

upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0];
  var reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    if (img.width > 200) {
      img.width = 200;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  if(file == null) {
	  holder.innerHTML = '<img src="" width="200" height="200" alt="Menu Picture"/>';
  }else{
  	  reader.readAsDataURL(file);
  }
  	return false;
};
</script>
<%@include file="../include/adminFooter.jsp" %>