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
		<c:choose>
			<c:when test="${filter == null or filter == ''}">
				<li><a class="pre" role="button" onclick="adminUsersListModal(${view_commu.commu_Writer_Index}, '${pre_list}', ${pre_page})">이전 목록</a></li>
			</c:when>
			<c:otherwise>
				<li><a class="pre" role="button" onclick="adminUsersListModal(${view_commu.commu_Writer_Index}, '${pre_list}', ${pre_page}, '${filter}', '${text}')">이전 목록</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>

<div class="modal-body">
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
							<a class="bg-warning labelinput badge badge-warning item-tag" style="background-color: #fed136; color: #4c0b5f;" onclick="adminUsersListModal(${user_index}, 'commu', 1, 'tag', '${tag}');">${tag}</a>
						</c:forTokens>
						<h1 class="panel-title" style="font-size: 32px;">${view_commu.commu_Title}</h1><br />
					</div>
					
					<div class="row" style="font-size: 24px; border-top: 1px solid #ddd; padding-top: 15px;">
						${view_commu.commu_Content}
					</div>
				</div>
			</div>
			<div class="panel-footer" style="text-align: right;">
				<c:choose>
					<c:when test="${filter == null or filter == ''}">
						<c:choose>
							<c:when test="${view_commu.commu_Is_Deleted == 0}">
								<button type="button" class="btn btn-danger" onclick="adminActionModal('delete', ${view_commu.commu_Writer_Index}, 'commu', ${view_commu.commu_Index}, '${pre_list}', ${pre_page})">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success" onclick="adminActionModal('restore', ${view_commu.commu_Writer_Index}, 'commu', ${view_commu.commu_Index}, '${pre_list}', ${pre_page})">복원</button>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${view_commu.commu_Is_Deleted == 0}">
								<button type="button" class="btn btn-danger" onclick="adminActionModal('delete', ${view_commu.commu_Writer_Index}, 'commu', ${view_commu.commu_Index}, '${pre_list}', ${pre_page}, '${filter}', '${text}')">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success" onclick="adminActionModal('restore', ${view_commu.commu_Writer_Index}, 'commu', ${view_commu.commu_Index}, '${pre_list}', ${pre_page}, '${filter}', '${text}')">복원</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<div class="row">
		댓글 [총 ${fn:length(view_commu_reply)} 개]
	</div>
</div>

<div class="modal-footer" style="text-align: left;">
	<div class="panel panel-default">
		<c:forEach items="${view_commu_reply}" var="reply">
			<div class="panel-body">
				<p style="color: #2a6496; font-size: auto;">${reply.commu_Reply_Writer}(Index : ${reply.commu_Reply_Writer_Index})</p>
				<p style="color: #959595; font-size: auto;">${reply.commu_Reply_Upload_Date}</p>
				<div style="padding: 10px;">
					${reply.commu_Reply_Content}
				</div>
				<div class="row" style="padding: 10px; text-align: right;">
					<c:choose>
						<c:when test="${filter == null or filter == ''}">
							<c:choose>
								<c:when test="${reply.commu_Reply_Is_Deleted == 0}">
									<button type="button" class="btn btn-danger" onclick="adminActionModal('delete', ${reply.commu_Reply_Writer_Index}, 'commuReply', ${reply.commu_Reply_Index}, '${pre_list}', ${pre_page})">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-success" onclick="adminActionModal('restore', ${reply.commu_Reply_Writer_Index}, 'commuReply', ${reply.commu_Reply_Index}, '${pre_list}', ${pre_page})">복원</button>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${reply.commu_Reply_Is_Deleted == 0}">
									<button type="button" class="btn btn-danger" onclick="adminActionModal('delete', ${reply.commu_Reply_Writer_Index}, 'commuReply', ${reply.commu_Reply_Index}, '${pre_list}', ${pre_page}, '${filter}', '${text}')">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-success" onclick="adminActionModal('restore', ${reply.commu_Reply_Writer_Index}, 'commuReply', ${reply.commu_Reply_Index}, '${pre_list}', ${pre_page}, '${filter}', '${text}')">복원</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</div>
</div>