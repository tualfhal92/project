<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<title> 강의 등록 하기</title>
<c:import url="/WEB-INF/views/common/_header.jsp">
</c:import>
<script
	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">
</header>
<div class=container>
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<div class="container">
				<h1 class="">강의 동영상 수정하기</h1>
				<form id="defaultForm" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return validate();" action="${pageContext.request.contextPath}/lecture/lectureBoardUpdateEnd">
					<div class="form-group">
						<br /><br /><br />
						<div class="col-sm-9">
							<div class="form-row">
							
							<input type="text" class="form-control md-6 mb-3" placeholder="강의명" name="lecture_board_title" value="${b.LECTURE_BOARD_TITLE}" required/>
							<input type="hidden" class="form-control" >
						
							<br />
							<div class="form-inline">
  							  <input type="text" class="form-control mb-2 mr-sm-2" placeHolder="chapter" name="lecture_board_chapter" value="${b.LECTURE_BOARD_CHAPTER}" required>
  							
  							  <input type="file" class="form-control mb-2 mr-sm-2 pull-right" id="inlineFormInputName2" placeholder="파일 업로드" name="upFile"  multiple>
							 <input type="hidden" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="강의넘버" name="lecture_board_lecture_index" value="${b.LECTURE_BOARD_LECTURE_INDEX }" required> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							</div>
							<br />	
								
							<div id="summernote">${b.LECTURE_BOARD_CONTENT}</div>
							<br /><br />
							
							<input type="hidden"  id="lecture_board_content" name="lecture_board_content" required />
							<input type="hidden"  value="${param.index}" class="my_lecture_index"/>
							<input type="hidden"  class="lecture_board_index" name="lecture_board_index" value="${b.LECTURE_BOARD_INDEX }" required/>
							<button type="submit" class="btn btn-wanrming pull-right" onclick="funcNote();">수정하기 </button>
							<button type="button" class="btn btn-warning pull-right lectureBoardDelete">삭제하기</button>
						</div>
					</div>
				</form>
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
         document.getElementById("lecture_board_content").value=$('#summernote').summernote('code');
         //alert(document.getElementById("commu_Content").value);
     }
	 function validate() {
			var content = $('#summernote').summernote('code');
			
			if(content.indexOf('<iframe') == -1 ){
				alert("동영상을 등록해주세요");
				return false;
			}
			
		/* 	if ($('#lecture_instructor_index').val() == ""
					|| $('#lecture_instructor_index').val() == null) {
				alert('로그인 먼저해주세요^^');
				return false;
			} */
			return true;
		}
	 
</script>
<c:import url="/WEB-INF/views/common/_footer.jsp" />