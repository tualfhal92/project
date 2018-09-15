<%@page import="com.misoot.lar.user.model.vo.User"%>
<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Users View" name="pageTitle" />
</c:import>

<%
	User view_user = (User)request.getAttribute("view_user");
%>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">Users</h1>
		<ol class="breadcrumb">
			<li class="active"><a href="/lar/admin/users/list/1"><i class="fa fa-address-book"></i> Users</a></li>
			<li class="active"><i class="fa fa-eye"></i> View</li>
			<li class="active"><i class="fa fa-hashtag"></i> ${user_index}</li>
		</ol>
	</div>
	<div class="row">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-target="#user_view" data-toggle="tab">유저 정보</a></li>
				<% if (view_user.getUser_type().equals("inst")) { %>
					<li><a data-target="#lectureLaunchedList" data-toggle="tab">강의 제공 내역</a></li>
				<% } %>
			</ul>
			<div class="panel-body tab-content">
				<form id="user_view" class="tab-pane active" action="/lar/admin/users/modify" method="post">
					<table class="table">
						<tr>
							<th>속성</th>
							<th>값</th>
							<th style="width:50%;">동작</th>
						</tr>
						<tr>
							<td><label class="control-label">번호</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_index" value="${view_user.user_index}" readonly/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">ID</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_id" value="${view_user.user_id}" readonly/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">닉네임</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_nickname" value="${view_user.user_nickname}"/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">가입일</label></td>
							<td>${view_user.user_enrolled_date}</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">핸드폰</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_phone" value="${view_user.user_phone}"/>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">타입</label></td>
							<td>
								<select class="form-control" name="user_type">
									<% if (view_user.getUser_type().equals("user")) { %>
										<option value="user" selected="true">user</option>
										<option value="inst">inst</option>
									<% } else { %>
										<option value="user">user</option>
										<option value="inst" selected="true">inst</option>
									<% } %>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">레벨</label></td>
							<td colspan="2">${view_user.user_level}</td>
						</tr>
						<tr>
							<td><label class="control-label">탈퇴 여부</label></td>
							<td>
								<div class="form-group">
									<select class="form-control" name="user_is_secession">
										<% if (view_user.isUser_is_secession()) { %>
											<option value="true" selected="true">true</option>
											<option value="false">false</option>
										<% } else { %>
											<option value="true">true</option>
											<option value="false" selected="true">false</option>
										<% } %>
									</select>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">추방 여부</label></td>
							<td>
								<div class="form-group">
									<select class="form-control" name="user_is_kicked">
										<% if (view_user.isUser_is_kicked()) { %>
											<option value="true" selected="true">true</option>
											<option value="false">false</option>
										<% } else { %>
											<option value="true">true</option>
											<option value="false" selected="true">false</option>
										<% } %>
									</select>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><label class="control-label">접속 시도</label></td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" name="user_try_signin_count" id="user_try_signin_count" value="${view_user.user_try_signin_count}" readonly/>
								</div>
							</td>
							<td>
								<button type="button" class="btn btn-default" onclick="$('#user_try_signin_count').val(0);">Reset</button>
							</td>
						</tr>
						<tr>
							<td><label class="control-label">쿠폰 내역</label></td>
							<td>총 ${coupon_count}개(미사용 : ${unused_coupon_count}개)</td>
							<td>
								<a class="btn btn-default" data-toggle="modal" data-target=".dynamicModal" onclick="adminUsersListModal('${view_user.user_index}', 'coupon', 1)">View</a>
							</td>
						</tr>
						<tr>
							<td><label class="control-label">결제 내역</label></td>
							<td>총 ${total_purchase_count}건(총 ${total_purchase_amount}원)</td>
							<td>
								<a class="btn btn-default" data-toggle="modal" data-target=".dynamicModal" onclick="adminUsersListModal('${view_user.user_index}', 'purchase', 1)">View</a>
							</td>
						</tr>
						<tr>
							<td><label class="control-label">작성한 글</label></td>
							<td>${commuList_count} 개</td>
							<td>
								<a class="btn btn-default" data-toggle="modal" data-target=".dynamicModal" onclick="adminUsersListModal('${view_user.user_index}', 'commu', 1)">View</a>
							</td>
						</tr>
						<tr>
							<td><label class="control-label">작성한 댓글</label></td>
							<td>${commuReplyList_count} 개</td>
							<td>
								<a class="btn btn-default" data-toggle="modal" data-target=".dynamicModal" onclick="adminUsersListModal('${view_user.user_index}', 'commuReply', 1)">View</a>
							</td>
						</tr>
					</table>
					<button class="btn btn-warning pull-right">수정</button>
				</form>
				<% if (view_user.getUser_type().equals("inst")) { %>
				<div id="lectureLaunchedList" class="tab-pane">
					 
				</div>
				<% } %>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>