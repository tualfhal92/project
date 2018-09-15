<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Community" name="pageTitle" />
</c:import>

<div class="col-lg-12 col-md-12">
	<div class="row">
		<h1 class="page-header">
			Community
		</h1>
		<ol class="breadcrumb">
			<li><i class="fa fa-globe"></i> Community</li>
			<li class="active"><i class="fa fa-trash"></i> Trash</li>
			<li class="active"><i class="fa fa-eye"></i> View</li>
			<li class="active"><i class="fa fa-hashtag"></i> ${view_commu.commu_Index}</li>
		</ol>
	</div>
	
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
				<p style="color: #2a6496; font-size: auto;">${view_commu.commu_Writer}(Index : ${view_commu.commu_Writer_Index})</p>
				<p style="color: #959595; font-size: auto;">${view_commu.commu_Upload_Date}</p>
			</div>
			<div class="panel-body">
				<div style="padding: 10px;">
					<div>
						<label style="color: #959595; font-size: auto;"><i class="fa fa-fw fa-hashtag" aria-hidden="true"></i>${view_commu.commu_Index} </label>
						<c:forTokens items="${view_commu.commu_tags}" var="tag" delims=",">
							<a class="bg-warning labelinput badge badge-warning item-tag" style="background-color: #fed136; color: #4c0b5f;" href="/lar/admin/commu/trash/search/tag/${tag}/list/1">${tag}</a>
						</c:forTokens>
						<h1 class="panel-title" style="font-size: 32px;">${view_commu.commu_Title}</h1><br />
					</div>
					
					<div class="row" style="font-size: 24px; border-top: 1px solid #ddd; padding-top: 15px;">
						${view_commu.commu_Content}
					</div>
				</div>
			</div>
			<div class="panel-footer" style="text-align: right;">
				<a role="button" class="btn btn-success" href="/lar/admin/commu/trash/restore/${view_commu.commu_Index}">복원</a>
			</div>
		</div>
		
		<div class="row" style="padding: 15px;">
			댓글 [총 ${fn:length(view_commu_reply)} 개]
		</div>
	</div>
	
	<div class="row">
		<c:forEach items="${view_commu_reply}" var="cr">
			${cr}
		</c:forEach>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>