<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="QnA" name="pageTitle" />
</c:import>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
</header>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<div class="row">
				<div id="postlist">
					<div class="panel">
						<div class="panel-heading" style="border-bottom: 1px solid gray;">
							<div class="text-left">							
								<h3>${ lectureQ.lecture_q_title }</h3>
								<small>by. ${ lectureQ.user_nickname }</small>
							</div>
						</div>

						<div class="panel-body">
							${lectureQ.lecture_q_content}
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>작성일 : ${ lectureQ.lecture_q_upload_date } 
							<c:if test="${lectureQ.lecture_q_update_date ne lectureQ.lecture_q_upload_date}">
							/ 수정일 : ${ lectureQ.lecture_q_update_date }
							</c:if> 
							</small>
						</div>
					</div>
					
					<div style="text-align: right;">
						<a type="button" class="btn btn-default gotoListbtn" href="/lar/lecture/lectureDetail?lecture_index=${ lectureQ.lecture_q_lecture_index }">목록으로</a>
						<c:if test="${session_user.user_index eq lectureQ.lecture_q_writer_index}">
						<a type="button" class="btn btn-default gotoListbtn" href="/lar/lecture/QnA/updateQ/${ lectureQ.lecture_q_index }">수정하기</a>
						<a type="button" class="btn btn-default gotoListbtn" href="/lar/lecture/QnA/deleteQ/${lectureQ.lecture_q_lecture_index}/${ lectureQ.lecture_q_index }">삭제하기</a>
						</c:if>
						<button type="button" class="btn btn-default reply_btn" style="margin-top:10px; margin-bottom:10px;">답글작성</button>
						<button type="button" class="btn btn-default reply_cancel_btn" style="margin-top:10px; margin-bottom:10px; display:none;">작성취소</button>
					</div>
					<c:forEach items="${ lectureA }" var="a">
					<div class="panel lecture_a_${a.lecture_a_index}">
						<div class="panel-heading" style="border-bottom: 1px solid gray;">
							<div class="text-left">							
								<h2 style="display: inline-block;">↳</h2>&nbsp;<small>by. ${ a.user_nickname }</small>
							</div>
						</div>

						<div class="panel-body lecture_a_content">
							${ a.lecture_a_content }
						</div>

						<div class="panel-footer" style="text-align: right;">
							<small>작성일 : ${ a.lecture_a_upload_date }
							<c:if test="${a.lecture_a_update_date ne a.lecture_a_upload_date}">
							/ 수정일 : ${ a.lecture_a_update_date }
							</c:if>
							</small>
						</div>
						
						<input type="hidden" id="lecture_a_index" value="${a.lecture_a_index}"/>
						<c:if test="${session_user.user_index eq a.lecture_a_writer_index}">
							<button type="button" class="btn btn-default pull-right modify_a" style="margin-top: 5px;">수정하기</button>
							<a type="button" class="btn btn-default pull-right" style="margin-top: 5px; margin-right:5px;">삭제하기</a>
						</c:if>
					</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="row write_reply" style="display: none; margin-top: 50px">
				<form action="/lar/lecture/QnA/insertA">
					<div id="summernote"></div>
					<input type="hidden" id="lecture_a_lecture_q_index" name="lecture_a_lecture_q_index" value="${ lectureQ.lecture_q_index }"/>
					<input type="hidden" id="lecture_a_content" name="lecture_a_content"/>
					<input type="hidden" id="lecture_a_check" name="lecture_a_index" value="0"/>
					<button type="submit" class="btn btn-default pull-right" style="margin-top: 10px" onclick="inputcontent();">작성완료</button>
					<button type="button" class="btn btn-default pull-right cancel_modify" style="display:none; margin-top: 10px; margin-right:5px;">취소하기</button>
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
			
			$('.reply_btn').on('click', function(){
				$('.write_reply').css('display','');
				$('.reply_cancel_btn').css('display','');
				$('.reply_btn').css('display', 'none');
			});
			 
			$('.reply_cancel_btn').on('click', function(){
				$('.write_reply').css('display','none');
				$('.reply_cancel_btn').css('display','none');
				$('.reply_btn').css('display', '');
				$('#summernote').summernote('reset');
			});
			
			$(document).on('click', '.modify_a', function(){
				var lecture_a_index = $(this).siblings('#lecture_a_index').val();
				$('.lecture_a_'+lecture_a_index).siblings().css('display', '');
				$('.lecture_a_'+lecture_a_index).css('display', 'none');
				$('.write_reply').css('display','');
				$('.cancel_modify').css('display','');
				$('#lecture_a_check').val(lecture_a_index);
				$('#summernote').summernote('code', $(this).siblings('.lecture_a_content').text());
			});
			
			$('.cancel_modify').on('click', function(){
				var lecture_a_index = $('#lecture_a_check').val();
				$('.lecture_a_'+lecture_a_index).css('display', '');
				$('.write_reply').css('display','none');
				$('#lecture_a_check').val(0);
				$(this).css('display','none');
			})
			 
			function inputcontent(){
				document.getElementById("lecture_a_content").value=$('#summernote').summernote('code');
			}
		</script>
			<c:import url="/WEB-INF/views/common/_footer.jsp" />