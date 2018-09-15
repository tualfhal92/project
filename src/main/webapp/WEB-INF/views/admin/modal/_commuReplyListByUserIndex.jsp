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
var filter = '${filter}';
var text = '${text}';

$(function() {
	$('#dynamicModal').on('hidden.bs.modal', function() {
		location.reload();
	});
	
	if (filter != null || filter != '') {
		$('select[name=filter]').children('option').each(function() {
			if ($(this).val() == filter) {
				$(this).attr('selected', 'true');
			}
			
			$('input[name=text]').val(text);
			$('input[name=text]').focus();
		});
	}
	
	$('input[name=text]').keypress(function(event) {
		if (event.keyCode == 13) {
			$('#search-btn').click();
		}
	});
});
</script>

<div class="modal-header">
	<h4><b>User's Community Reply Write List</b></h4>
</div>

<div class="modal-body">
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-form navbar-right modal-search">
				<div class="form-group">
					<ul class="nav">
						<li class="active">
							<select class="form-control" name="filter">
								<option value="content">내용</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="text">
					<button id="search-btn" class="btn btn-default form-control" type="button" onclick="adminUsersListModal(${user_index}, 'commuReply', 1, $('select[name=filter]').val(), $('input[name=text]').val());">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<table class="table table-striped table-condensed">
		<tr>
			<th>Parent Idx</th>
			<th>Content</th>
			<th>Nick</th>
			<th>Date</th>
		</tr>
		<c:forEach items="${commuReply_list}" var="cr">
			<tr>
				<td>${cr.commu_Reply_Commu_Index}</td>
				<td>
					<c:choose>
						<c:when test="${filter==null or filter==''}">
							<p><a role="button" onclick="adminUsersViewModal(${user_index}, 'commu', ${cr.commu_Reply_Commu_Index}, 'commuReply', ${pi.current_page})">${cr.commu_Reply_Content}</a></p>
						</c:when>
						<c:otherwise>
							<p><a role="button" onclick="adminUsersViewModal(${user_index}, 'commu', ${cr.commu_Reply_Commu_Index}, 'commuReply', ${pi.current_page}, '${filter}', '${text}')">${cr.commu_Reply_Content}</a></p>
						</c:otherwise>
					</c:choose>
					
				</td>
				<td>${cr.commu_Reply_Writer}</td>
				<td>${cr.commu_Reply_Upload_Date}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="modal-footer">
	<nav class="text-center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${filter==null}">
					<% if (pi.getCurrent_page() != 1) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', 1)">&lt;&lt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page-1})">&lt;</a></li>				
					<% } %>
						
					<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
						<% if (i == pi.getCurrent_page()) { %>
							<li class="active"><a><%=i%></a></li>
						<% } else if (i <= pi.getMax_page_count()) { %>
							<li><a role="button" onclick="adminUsersListModal('${user_index}', 'commuReply', <%=i%>)"><%=i%></a></li>
						<% } %>
					<% } %>
					
					<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page+1})">&gt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.max_page_count})">&gt;&gt;</a></li>
					<% } %>
				</c:when>
				<c:otherwise>
					<% if (pi.getCurrent_page() != 1) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', 1, '${filter}', '${text}')">&lt;&lt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page-1}, '${filter}', '${text}')">&lt;</a></li>				
					<% } %>
						
					<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
						<% if (i == pi.getCurrent_page()) { %>
							<li class="active"><a><%=i%></a></li>
						<% } else if (i <= pi.getMax_page_count()) { %>
							<li><a role="button" onclick="adminUsersListModal('${user_index}', 'commuReply', <%=i%>, '${filter}', '${text}')"><%=i%></a></li>
						<% } %>
					<% } %>
					
					<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.current_page+1}, '${filter}', '${text}')">&gt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commuReply', ${pi.max_page_count}, '${filter}', '${text}')">&gt;&gt;</a></li>
					<% } %>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>