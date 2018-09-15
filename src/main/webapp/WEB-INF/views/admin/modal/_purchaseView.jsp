<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
	.modal-footer .panel-body {
		padding: 15px;
		border: 1px solid #ddd;
	}
</style>

<script>
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
});
</script>

<div class="modal-header">
	<ul class="pager pull-left">
		<li><a class="pre" role="button" onclick="adminUsersListModal(${user_index}, '${pre_list}', ${pre_page})">이전 목록</a></li>
	</ul>
</div>

<div class="modal-body">
	<div class="row">
		<table class="table table-striped table-condensed" style="width: 100%">
			<tr style="border-bottom: 1px solid lightgray">
				<th style="width: 80%">Title</th>
				<th style="width: 20%">Price</th>
			</tr>
			<c:set var="lecTotal" value="0" />
			<c:forEach items="${purchase_lecture_list}" var="pl">
			<tr>
				<td style="padding: 4px;">				
					<a href="/lar/lecture/lectureDetail?lecture_index=${pl.LECTURE_INDEX}" class="pull-left"> 
						<img src="${pl.LECTURE_THUMBNAIL}" class="media-photo" style="width:100px; margin-right: 10px;">
					</a>					
					<h4 class="title"><a href="/lar/lecture/lectureDetail?lecture_index=${pl.LECTURE_INDEX}">${pl.LECTURE_TITLE}</a></h4>									
				</td>
				<td>${pl.LECTURE_PRICE}</td>
			</tr>
			<c:set var="lecTotal" value="${lecTotal+pl.LECTURE_PRICE}" />
			</c:forEach>
			<tr style="border-bottom: 1px solid lightgray">
				<td>총 금액 : </td>
				<td>${lecTotal}</td>
			</tr>
		</table>
	</div>
	
	<c:set var="discountAmount" value="${lecTotal - purchase.paid_amount}"/>
	
	<div class="row" style="margin-top: 20px;">
		<table class="table table-striped table-condensed" style="width:100%">
			<tr>
				<th>Coupon</th>
				<th>Discount</th>
				<th>Amount</th>
			</tr>
			<tr>
				<td>${purchase.coupon_name}</td>
				<td>${discountAmount}</td>
				<td>${purchase.paid_amount}</td>
			</tr>
		</table>
	</div>
	<div class="row" style="text-align: right;">
		
	</div>
</div>

<div class="modal-footer" style="text-align: left;">
	
</div>