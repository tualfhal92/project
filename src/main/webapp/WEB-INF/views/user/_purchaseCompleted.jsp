<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="결제완료" name="pageTitle" />
</c:import>

</header>

<style>
.btn.outline:hover, .btn.outline:focus, .btn.outline:active, .btn.outline.active{
	color: white;
	border-color: #ffe484;
}
th, td {
	text-align: center;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10" style="margin-top: 5%; margin-bottom: 50px; text-align: center;">
			<h1><span class="glyphicon glyphicon-ok-circle" style="color:#4C0B5F;"></span></h1><h2 style="margin-bottom: 5%;">결제가 완료되었습니다.</h2>
			
			<table class="table table-bordered" style="width:60%; margin-left: auto; margin-right: auto; margin-bottom: 40px;">
				<tr>
					<th style="width: 20%">결제일</th>
					<td>${pc.PURCHASE_DATE}</td>
				</tr>
				<tr>
					<th style="width: 20%">신청강의</th>
					<td>${pc.PURCHASE_LECTURE_LIST}</td>
				</tr>
				<tr>
					<th style="width: 20%">사용쿠폰</th>
					<td>${pc.COUPON_NAME}</td>
				</tr>
				<tr>
					<th style="width: 20%">결제금액</th>
					<td>${pc.PAID_AMOUNT}</td>
				</tr>
			</table>
			
			<button class="btn btn outline" style="background-color: #4C0B5F; color:white" onclick="location.href='/lar/'">홈으로</button>
			<button class="btn btn outline" style="background-color: #4C0B5F; color:white" onclick="location.href='/lar/user/cart'">장바구니</button>
		</div>
		
		
<c:import url="/WEB-INF/views/common/_footer.jsp" />