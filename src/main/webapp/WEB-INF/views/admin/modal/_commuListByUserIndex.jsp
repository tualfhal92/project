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
	<h4><b>User's Community Write List</b></h4>
</div>

<div class="modal-body">
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-form navbar-right modal-search">
				<div class="form-group">
					<ul class="nav">
						<li class="active">
							<select class="form-control" name="filter">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="tag">태그</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search" name="text">
					<button id="search-btn" class="btn btn-default form-control" type="button" onclick="adminUsersListModal(${user_index}, 'commu', 1, $('select[name=filter]').val(), $('input[name=text]').val());">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<table class="table table-striped table-condensed">
		<tr>
			<th>Idx</th>
			<th>Title</th>
			<th>Nick</th>
			<th>Date</th>
			<th>Hits</th>
			<th>Is Deleted</th>
		</tr>
		<c:choose>
			<c:when test="${filter==null}">
				<c:forEach items="${commu_list}" var="cb">
					<tr>
						<td>${cb.commu_Index}</td>
						<td>
							<p><a role="button" onclick="adminUsersViewModal(${user_index}, 'commu', ${cb.commu_Index}, 'commu', ${pi.current_page})">${cb.commu_Title}</a></p>
							<c:forTokens items="${cb.commu_tags}" var="tag" delims=",">
								<a class="bg-warning labelinput badge badge-warning" style="background-color: #fed136; color: #4c0b5f; font-size: 10px;" onclick="adminUsersListModal(${user_index}, 'commu', 1, 'tag', '${tag}');">#${tag}</a>
							</c:forTokens>
						</td>
						<td>${cb.commu_Writer}</td>
						<td>${cb.commu_Upload_Date}</td>
						<td>${cb.commu_Hits}</td>
						<td>${cb.commu_Is_Deleted == 1 ? true : false}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${commu_list}" var="cb">
					<tr>
						<td>${cb.commu_Index}</td>
						<td>
							<p><a role="button" onclick="adminUsersViewModal(${user_index}, 'commu', ${cb.commu_Index}, 'commu', ${pi.current_page}, '${filter}', '${text}')">${cb.commu_Title}</a></p>
							<c:forTokens items="${cb.commu_tags}" var="tag" delims=",">
								<a class="bg-warning labelinput badge badge-warning" style="background-color: #fed136; color: #4c0b5f; font-size: 10px;" onclick="adminUsersListModal(${user_index}, 'commu', 1, 'tag', '${tag}');">#${tag}</a>
							</c:forTokens>
						</td>
						<td>${cb.commu_Writer}</td>
						<td>${cb.commu_Upload_Date}</td>
						<td>${cb.commu_Hits}</td>
						<td>${cb.commu_Is_Deleted == 1 ? true : false}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>

<div class="modal-footer">
	<nav class="text-center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${filter==null}">
					<% if (pi.getCurrent_page() != 1) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', 1)">&lt;&lt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.current_page-1})">&lt;</a></li>				
					<% } %>
						
					<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
						<% if (i == pi.getCurrent_page()) { %>
							<li class="active"><a><%=i%></a></li>
						<% } else if (i <= pi.getMax_page_count()) { %>
							<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', <%=i%>)"><%=i%></a></li>
						<% } %>
					<% } %>
					
					<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.current_page+1})">&gt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.max_page_count})">&gt;&gt;</a></li>
					<% } %>
				</c:when>
				<c:otherwise>
					<% if (pi.getCurrent_page() != 1) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', 1, '${filter}', '${text}')">&lt;&lt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.current_page-1}, '${filter}', '${text}')">&lt;</a></li>				
					<% } %>
						
					<% for (int i=pi.getStart_page(); i<=pi.getEnd_page(); i++) { %>
						<% if (i == pi.getCurrent_page()) { %>
							<li class="active"><a><%=i%></a></li>
						<% } else if (i <= pi.getMax_page_count()) { %>
							<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', <%=i%>, '${filter}', '${text}')"><%=i%></a></li>
						<% } %>
					<% } %>
					
					<% if (pi.getMax_page_count() > pi.getCurrent_page()) { %>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.current_page+1}, '${filter}', '${text}')">&gt;</a></li>
						<li><a role="button" onclick="adminUsersListModal(${user_index}, 'commu', ${pi.max_page_count}, '${filter}', '${text}')">&gt;&gt;</a></li>
					<% } %>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>