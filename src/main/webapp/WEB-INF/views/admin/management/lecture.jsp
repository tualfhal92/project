<%@page import="com.misoot.lar.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/admin/common/_header.jsp">
	<c:param value="Lectures" name="pageTitle" />
</c:import>

<script
	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>

<div class="col-lg-12">
	<div class="row">
		<h1 class="page-header">Management</h1>
		<ol class="breadcrumb">
			<li class="active"><i class="fa fa-cogs"></i> Management</li>
			<li class="active"><i class="fa fa-bookmark-o"></i> Lecture</li>
			<li class="active"><i class="fa fa-plus-square-o"></i> Add</li>
		</ol>
	</div>

	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="container">
				<form id="defaultForm" method="post" class="form-horizontal" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/admin/management/lecture/add" onsubmit="return validate();">
					<div class="form-group">
						<div class="col-sm-8">
							<div class="form-row">
								<input type="text" class="form-control md-6 mb-3" placeholder="강의명" name="lecture_title" required /> 
								<input type="hidden" class="form-control"> 
								<input type="hidden" id="lecture_instructor_index" name="lecture_instructor_index" value="${session_user.user_index}" required />
							</div>
							<br />
							<div class="form-inline">
								<label for="staticEmail" class=" col-form-label">카테고리 :</label>&nbsp;&nbsp;
								<select class="form-control form-control mb-2 mr-sm-2" name="lecture_category_index" required>
									<c:forEach items="${category_list_option}" var="c">
										<option value="${c.CATEGORY_INDEX}">${c.CATEGORY_NAME}</option>
									</c:forEach>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<label for="staticEmail" class=" col-form-label">난이도 :</label>&nbsp;&nbsp;
								<select class="form-control form-control mb-2 mr-sm-2" name="lecture_level" required>
									<option>상</option>
									<option>중</option>
									<option>하</option>
								</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
								<label for="staticEmail" class=" col-form-label">가격 :</label>&nbsp;&nbsp;
								<input type="number" class="form-control mb-2 mr-sm-2" name="lecture_price" required />
							</div>
							<br />
							<div class="form-inline">
								<label for="staticEmail" class=" col-form-label">유저 아이디:</label>&nbsp;&nbsp;
								<input type="email" class="form-control mb-1 mr-sm-1" id="user_id" name="user_id" value="" required />
							</div>

							<label for="exampleFormControlTextarea1">intro</label> 
							<input type="hidden" id="lecture_intro" name="lecture_intro" />
							<textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>

							<br />

							<div id="summernote">
								<h3>
									1. 소개글<br>
								</h3>
								<h3>
									2. 강의특징<br>
								</h3>
								<h3>
									3. 참고자료<br>
								</h3>
							</div>
							<input type="hidden" id="lecture_content" name="lecture_content" value="" required />
							<button type="submit" class="btn btn-wanrming pull-right" onclick="funcNote();">제출하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$('#summernote').summernote({
			height : 300, // 기본 높이값
			minHeight : null, // 최소 높이값(null은 제한 없음)
			maxHeight : null, // 최대 높이값(null은 제한 없음)
			focus : true, // 페이지가 열릴때 포커스를 지정함
			lang : 'ko-KR' // 한국어 지정(기본값은 en-US)
		});
	});
  
	function funcNote(){
		$('#lecture_intro').val($('#exampleFormControlTextarea1').val());
		document.getElementById("lecture_content").value=$('#summernote').summernote('code');
	}
   
	function validate() {
		var intro = $("#lecture_intro").val();
		if (intro.trim().length == 0) {
			alert("intro 내용을 입력하세요");
			return false;
		}
     
		var content = $('#summernote').summernote('code');
        
		if(content.indexOf('<iframe') == -1 ){
			alert("동영상을 등록해주세요");
			return false;
		}
		return true;
	} 
</script>

<c:import url="/WEB-INF/views/admin/common/_footer.jsp">
</c:import>