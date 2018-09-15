<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="QnA작성" name="pageTitle" />
</c:import>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
</header>

<div class="container">
	<div class="row">
		<div class="col-md-10 col-sm-10" style="margin-top: 10px; width:75%;">			
			<div class="row">
				<h2 class="pull-left">Q&A 글 작성</h2>
				<form action="/lar/lecture/QnA/insertQ">
					<input type="text" class="form-control" name="lecture_q_title" placeholder="Title" style="margin-bottom:10px"/>
					<div id="summernote"></div>
					<input type="hidden" id="lecture_q_content" name="lecture_q_content"/>
					<input type="hidden" name="lecture_q_lecture_index" value="${lecture_index}"/>
					<button type="submit" class="btn btn-default pull-right" onclick="inputcontent();" style="margin-top: 10px">작성완료</button>
				</form>
			</div>
		</div> 
		
		<script>
			$(function() {
				$('#summernote').summernote({
					height : 400, // 기본 높이값
					minHeight : null, // 최소 높이값(null은 제한 없음)
					maxHeight : null, // 최대 높이값(null은 제한 없음)
					focus : true, // 페이지가 열릴때 포커스를 지정함
					lang : 'ko-KR', // 한국어 지정(기본값은 en-US)
					disableResizeEditor: true
				});
				
				$('.note-statusbar').hide();
			});
			
			function inputcontent(){
				document.getElementById("lecture_q_content").value=$('#summernote').summernote('code');
			}
		</script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />