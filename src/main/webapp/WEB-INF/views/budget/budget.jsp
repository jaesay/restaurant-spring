<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<%@include file="../include/header.jsp" %>

<div class="grid_3 grid_5">
	<ol class="breadcrumb">
		<li><a href="/" style="margin-left:7.5em;">Home</a></li>
		<li class="active">Budget</li>
	</ol>
</div>
<div class="container" style="margin-bottom: 7em;">
	<div style="margin:2em 0em 0em 14em;color:#ff5d56;">
		<h3>MENU BOARD</h3>	
	</div>
	
	
	<div>
		<div class="col-md-2">
		</div>
		<div class="col-md-2" style="padding-top:10px;border-top-right-radius: 0.7em;border: 1px solid black;height:350px;box-shadow: 15px 0 15px -15px #333;">
			<div style="text-align:center;">
				<b>Category</b><hr style="border-top: 1px solid;">		
			</div>
			<button type="button" id="mainBtn" class="btn-link" style="text-decoration:none">Main</button><br>
			<button type="button" id="specialBtn" class="btn-link" style="text-decoration:none">Special</button><br>
			<button type="button" id="sideBtn" class="btn-link" style="text-decoration:none">Side</button><br>
			<button type="button" id="extraBtn" class="btn-link" style="text-decoration:none">Extra</button><br>
			<button type="button" id="beverageBtn" class="btn-link" style="text-decoration:none">Beverage</button><br>
		</div>
		<div class="col-md-6" style="padding:10px 0 0 40px;border-top-left-radius: 0.7em;box-shadow: -15px 0 15px -15px #333;height:350px;border-top: 1px solid black;border-bottom: 1px solid black;border-right: 1px solid black;">
			<div class="row text-center">
				<div class="col-md-2"><b>SEL</b></div>
				<div class="col-md-4"><b>MENU</b></div>
				<div class="col-md-2"><b>PRICE($)</b></div>
				<div class="col-md-2"><b>QTY</b></div>
				<div class="col-md-2"><b>RATING</b></div><br><hr style="border-top: 1px solid;width: 30em;padding-right:5em;">
			</div>
				<c:forEach var="vo" items="${mList }" varStatus="status">
				<div class="row text-center">
					<div class="col-md-2"><input type="checkbox"  id="selId${status.index }" name="selId${status.index }" value="${vo.m_id },${vo.m_name },${vo.m_price }"></div>
					<div class="col-md-4" id="name${status.index }">${vo.m_name }</div>
					<div class="col-md-2" id="price${status.index }">${vo.m_price }</div>
					<div class="col-md-2" >
						<input type="number" name="qty" id="qty${status.index }" value="1" min="1" max="9" maxlength="1" oninput="maxLengthCheck(this)">
					</div>
					<div class="col-md-2">${vo.m_rating }</div>
				</div>
				<hr>
				</c:forEach>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div style="clear:both;">
		<h4 style="margin:2em 0em 0em 11em;">Calculate My Budget</h4>
		<div class="col-md-2">
		</div>
		<div class="col-md-8" style="border: 1px solid black;">
			<div style="text-align:center">
				<div class="col-md-5"><b>MENU</b></div>
				<div class="col-md-1"><b></b></div>
				<div class="col-md-2"><b>PRICE($)</b></div>
				<div class="col-md-2"><b>QTY</b></div>
				<div class="col-md-2"><b>SUM</b></div><hr style="border-top: 1px solid;width: 45em;padding-right:5em;">
			</div>
			<div style="text-align:center;margin-top:-2em;" id="calDiv">
			
			</div>
		</div>
		<div class="col-md-2">
		</div>	
	</div>
	<div style="clear:both;">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="text-align:right;">
			<span style="font-size:17px;color:#ff5d56;">BUDGET: </span><b id="budget"style="font-size:17px;color:red">0</b>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<script id="template" type="text/x-handlebars-template">
<div class="row text-center">
	<div class="col-md-2"><b>SEL</b></div>
	<div class="col-md-4"><b>MENU</b></div>
	<div class="col-md-2"><b>PRICE</b></div>
	<div class="col-md-2"><b>QTY</b></div>
	<div class="col-md-2"><b>RATING</b></div><br><hr style="border-top: 1px solid;width: 30em;padding-right:5em;">
</div>
{{#each .}}
<div class="row text-center">
	<div class="col-md-2"><input type="checkbox" id="selId{{@index}}" name="selId{{@index}}" value="{{m_id }}"></div>
	<div class="col-md-4" id="name{{@index}}">{{m_name }}</div>
	<div class="col-md-2" id="price{{@index}}">{{m_price }}</div>
	<div class="col-md-2">
		<input type="number" name="qty" id="qty{{@index}}" value="1" min="1" max="9" maxlength="1" oninput="maxLengthCheck(this)">
	</div>
	<div class="col-md-2">{{m_rating }}</div>
</div><hr>
{{/each}}
</script>

<script id="template1" type="text/x-handlebars-template">
{{#info}}
	<div class="col-md-5" name={{name}}>{{name }}</div>
	<div class="col-md-1" name={{name}}></div>
	<div class="col-md-2" name={{name}}>{{price }}</div>
	<div class="col-md-2" name={{name}}>{{qty}}</div>
	<div class="col-md-2 sum" name={{name}}>{{sum}}</div>
{{/info}}
</script>

<script>
var budget = 0;
	$(document).on('keyup mouseup', "#qty0", function(){
		if($('input:checkbox[id="selId0"]').is(":checked") == true){
			var name = $('#name0').text();
			var price = $('#price0').text();
			var qty = $('#qty0').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	/* $('#selId0').on("change",function () { */
	$(document).on('click', '#selId0', function(){
		if($('input:checkbox[id="selId0"]').is(":checked") == true){
			var name = $('#name0').text();
			var price = $('#price0').text();
			var qty = $('#qty0').val();
			var sum = qty*price;		

			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
			
			/* var budget =0;
			console.log($('.sum').length);
			for(var i=0;i<$('.sum').length;i++){
				var j =  $('.sum:eq(i)').text();
				j *=1;
				budget = budget + j;
			}
			
			$('#budget').text(budget); */
		}else{
			var name = $('#name0').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	
	$(document).on('keyup mouseup', "#qty1", function(){
		if($('input:checkbox[id="selId1"]').is(":checked") == true){
			var name = $('#name1').text();
			var price = $('#price1').text();
			var qty = $('#qty1').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId1', function(){
		if($('input:checkbox[id="selId1"]').is(":checked") == true){
			var name = $('#name1').text();
			var price = $('#price1').text();
			var qty = $('#qty1').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget=0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name1').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty2", function(){
		if($('input:checkbox[id="selId2"]').is(":checked") == true){
			var name = $('#name2').text();
			var price = $('#price2').text();
			var qty = $('#qty2').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId2', function(){
		if($('input:checkbox[id="selId2"]').is(":checked") == true){
			var name = $('#name2').text();
			var price = $('#price2').text();
			var qty = $('#qty2').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name2').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty3", function(){
		if($('input:checkbox[id="selId3"]').is(":checked") == true){
			var name = $('#name3').text();
			var price = $('#price3').text();
			var qty = $('#qty3').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId3', function(){
		if($('input:checkbox[id="selId3"]').is(":checked") == true){
			var name = $('#name3').text();
			var price = $('#price3').text();
			var qty = $('#qty3').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name3').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty4", function(){
		if($('input:checkbox[id="selId4"]').is(":checked") == true){
			var name = $('#name4').text();
			var price = $('#price4').text();
			var qty = $('#qty4').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId4', function(){
		if($('input:checkbox[id="selId4"]').is(":checked") == true){
			var name = $('#name4').text();
			var price = $('#price4').text();
			var qty = $('#qty4').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name4').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty5", function(){
		if($('input:checkbox[id="selId5"]').is(":checked") == true){
			var name = $('#name5').text();
			var price = $('#price5').text();
			var qty = $('#qty5').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId5', function(){
		if($('input:checkbox[id="selId5"]').is(":checked") == true){
			var name = $('#name5').text();
			var price = $('#price5').text();
			var qty = $('#qty5').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name5').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty6", function(){
		if($('input:checkbox[id="selId6"]').is(":checked") == true){
			var name = $('#name0').text();
			var price = $('#price6').text();
			var qty = $('#qty6').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId6', function(){
		if($('input:checkbox[id="selId6"]').is(":checked") == true){
			var name = $('#name6').text();
			var price = $('#price6').text();
			var qty = $('#qty6').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name6').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty7", function(){
		if($('input:checkbox[id="selId7"]').is(":checked") == true){
			var name = $('#name7').text();
			var price = $('#price7').text();
			var qty = $('#qty7').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId7', function(){
		if($('input:checkbox[id="selId7"]').is(":checked") == true){
			var name = $('#name7').text();
			var price = $('#price7').text();
			var qty = $('#qty7').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name7').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty8", function(){
		if($('input:checkbox[id="selId8"]').is(":checked") == true){
			var name = $('#name8').text();
			var price = $('#price8').text();
			var qty = $('#qty8').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId8', function(){
		if($('input:checkbox[id="selId8"]').is(":checked") == true){
			var name = $('#name8').text();
			var price = $('#price8').text();
			var qty = $('#qty8').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name8').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	
	$(document).on('keyup mouseup', "#qty9", function(){
		if($('input:checkbox[id="selId9"]').is(":checked") == true){
			var name = $('#name9').text();
			var price = $('#price9').text();
			var qty = $('#qty9').val();
			var sum = qty*price;			
			
			$('[name="'+name+'"]').remove();
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	});
	
	$(document).on('click', '#selId9', function(){
		if($('input:checkbox[id="selId9"]').is(":checked") == true){
			var name = $('#name9').text();
			var price = $('#price9').text();
			var qty = $('#qty9').val();
			var sum = qty*price;			
			
			var source = $("#template1").html();
			var template = Handlebars.compile(source); 
			var data = {
			    	info: [
			            { name: name, price: price, qty:qty, sum:sum }
			        ]
			}; 
			var html = template(data);
			$('#calDiv').append(html);
			
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}else{
			var name = $('#name9').text();
			$('[name="'+name+'"]').remove();
			budget = 0;
			for(var i=0;i<$('.sum').length;i++){
				var j = $('.sum:eq('+i +')').text();
				j *= 1;
				budget = budget + j;
			}
			$('#budget').text(budget);
		}
	 });
	

	var printData = function(mList, target, templateObject) {
	
		var template = Handlebars.compile(templateObject.html());
		var html = template(mList);
		$(".col-md-6 div").remove();
		$(".col-md-6 hr").remove();
		target.html(html);
	
	}
	
	function getPage(pageInfo) {
	
		$.getJSON(pageInfo, function(data) {
			printData(data.mlist, $(".col-md-6"), $('#template'));
		});
	}
	
	$("#mainBtn").on("click", function(){
		var m_category = $("#mainBtn").text();
		
		getPage("/budget/" + m_category);
	});
	
	$("#specialBtn").on("click", function(){
		var m_category = $("#specialBtn").text();
		
		getPage("/budget/" + m_category);
	});
	
	$("#sideBtn").on("click", function(){
		var m_category = $("#sideBtn").text();
		
		getPage("/budget/" + m_category);
	});
	
	$("#extraBtn").on("click", function(){
		var m_category = $("#extraBtn").text();
		
		getPage("/budget/" + m_category);
	});
	
	$("#beverageBtn").on("click", function(){
		var m_category = $("#beverageBtn").text();
		
		getPage("/budget/" + m_category);
	});

</script>

<script type="text/javascript">
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
		object.value = object.value.slice(0, object.maxLength);
	}    
}
</script>

<%@include file="../include/footer.jsp" %>