<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
%>

<script>
$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
});
</script>

<div class="modal-header">
	<h4><b>User's Coupon List</b></h4>
</div>

<div class="modal-body">
	<table class="table table-striped table-condensed">
		<tr>
			<th>Idx</th>
			<th>Name</th>
			<th>Discount</th>
			<th>Given Date</th>
			<th>Is Deleted</th>
			<th>Used Date</th>
		</tr>
		<c:forEach items="${coupon_list}" var="coupon">
		<tr>
			<td>${coupon.USER_COUPON_INDEX}</td>
			<td>${coupon.COUPON_NAME}</td>
			<td>${coupon.COUPON_DISCOUNT_INF}</td>
			<td>${coupon.USER_COUPON_GIVEN_DATE}</td>
			<td>${coupon.USER_COUPON_USED_DATE == null ? false : true}</td>
			<td>${coupon.USER_COUPON_USED_DATE}</td>
		</tr>
		</c:forEach>
	</table>
</div>

<div class="modal-footer">
	<div class="row">
		<div class="pull-right"><a class="btn btn-primary" role="button" onclick="adminGiveCouponFormView(${user_index}, 'coupon', ${pi.current_page})">추가</a></div>
	</div>
	<nav class="text-center">
		<ul class="pagination">
			<% if (pi.getCurrent_page() != 1) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'coupon', 1)">&lt;&lt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'coupon', ${pi.current_page-1})">&lt;</a></li>				
			<% } %>
				
			<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
				<% if (i == pi.getCurrent_page()) { %>
					<li class="active"><a><%=i%></a></li>
				<% } else if (i <= pi.getMax_page_count()) { %>
					<li><a role="button" onclick="adminUsersListModal(${user_index}, 'coupon', <%=i%>)"><%=i%></a></li>
				<% } %>
			<% } %>
			
			<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'coupon', ${pi.current_page+1})">&gt;</a></li>
				<li><a role="button" onclick="adminUsersListModal(${user_index}, 'coupon', ${pi.max_page_count})">&gt;&gt;</a></li>
			<% } %>
		</ul>
	</nav>
</div>