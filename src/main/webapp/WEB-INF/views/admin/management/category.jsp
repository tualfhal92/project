<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Lectures" name="pageTitle" />
</c:import>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">
			Management
		</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cogs"></i> Management</li>
			<li class="active"><i class="fa fa-bookmark-o"></i> Category</li>
			<li class="active"><a href="/lar/admin/management/category/list/1"><i class="fa fa-list"></i> List</a></li>
			<li class="active"><i class="fa fa-hashtag"></i> ${pi.current_page}</li>
		</ol>
	</div>
	
	<div class="row table-responsive">
		<table class="table table-striped table-condensed">
			<tr>
				<th>Idx</th>
				<th>Name</th>
			</tr>
			<c:forEach items="${category_list}" var="category">
				<tr>
					<td>${category.CATEGORY_INDEX}</td>
					<td>${category.CATEGORY_NAME}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="row">
		<div class="pull-right"><a class="btn btn-primary" role="button" href="/lar/admin/management/category/form">추가</a></div>
	</div>

	<div class="row">
		<nav class="text-center">
			<ul class="pagination">
				<% if (pi.getCurrent_page() != 1) { %>
					<li><a href="/lar/admin/lectures/list/1">&lt;&lt;</a></li>
					<li><a href="/lar/admin/lectures/list/${pi.current_page -1}">&lt;</a></li>				
				<% } %>
				<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
					<% if (i == pi.getCurrent_page()) { %>
						<li class="active"><a href="/lar/admin/lectures/list/<%=i%>" onclick="return false;"><%=i%></a></li>
					<% } else if (i <= pi.getMax_page_count()) { %>
						<li><a href="/lar/admin/lectures/list/<%=i%>"><%=i%></a></li>
					<% } %>
				<% } %>
				
				<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
					<li><a href="/lar/admin/lectures/list/${pi.current_page + 1}">&gt;</a></li>
					<li><a href="/lar/admin/lectures/list/${pi.max_page_count}">&gt;&gt;</a></li>
				<% } %>
			</ul>
		</nav>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>