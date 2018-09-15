<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의  소개" name="pageTitle" />
</c:import>
<link
   href="${pageContext.request.contextPath}/resources/css/lar-board.min.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/blog-post.min.css" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
<style>
.youtubeWrap {
	position: relative;
	width: 100%;
	height: auto;
	padding-bottom: 10%;
}

.youtubeWrap iframe {
	/* position: absolute; */
	width: 100%;
}

* {
	box-sizing: border-box;
}

body {
	font-family: Arial;
}

.heading {
	font-size: 25px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.checked {
	color: orange;
}

/* Three column layout */
.side {
	float: left;
	width: 15%;
	margin-top: 10px;
}

.middle {
	margin-top: 10px;
	float: left;
	width: 70%;
}

/* Place text to the right */
.right {
	text-align: right;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* The bar container */
.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
}

/* Individual bars */
.bar-10 {
	width: 100%;
	height: 18px;
	background-color: #4CAF50;
}

.bar-9 {
	width: 90%;
	height: 18px;
	background-color: #4CAF50;
}

.bar-8 {
	width: 80%;
	height: 18px;
	background-color: #4CAF50;
}

.bar-7 {
	width: 70%;
	height: 18px;
	background-color: #ff9800;
}

.bar-6 {
	width: 60%;
	height: 18px;
	background-color: #2196F3;
}

.bar-5 {
	width: 50%;
	height: 18px;
	background-color: #2196F3;
}

.bar-4 {
	width: 40%;
	height: 18px;
	background-color: #00bcd4;
}

.bar-3 {
	width: 30%;
	height: 18px;
	background-color: #00bcd4;
}

.bar-2 {
	width: 20%;
	height: 18px;
	background-color: #ff9800;
}

.bar-1 {
	width: 10%;
	height: 18px;
	background-color: #f44336;
}

.bar-0 {
	width: 0%;
	height: 18px;
	background-color: #f44336;
}
/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media ( max-width : 400px) {
	.side, .middle {
		width: 100%;
	}
	.right {
		display: none;
	}
}

.list-unstyled li {
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	border-bottom: 1px solid #efefef;
	font-size: 12px;
}

.list-unstyled li:last-child {
	border-bottom: 0px;
}
</style>
<script>
	var locked = 0;
	function show(star) {
		if (locked)
			return;
		var i;
		var image;
		var el;
		for (i = 1; i <= star; i++) {
			image = "image" + i
			el = document.getElementById(image);
			el.className = "fa fa-star checked"
		}
	}
	function noshow(star) {
		if (locked)
			return;
		var i;
		var image;
		var el;
		for (i = 1; i <= star; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.className = "fa fa-star"
		}
	}
	function lock(star) {
		locked = 0;
		noshow(5);
		show(star);
		locked = 1;
	}
	function mark(star) {
		lock(star);
		/* alert("별점"+star+"점");  */
		document.cmtform.lecture_review_score.value = star;
	}

	function make_button_active(tab, panel) {
		var siblings = tab.siblings();
		var panSiblings = panel.siblings();

		siblings.each(function() {
			$(this).removeClass('active');
		});
	
		panSiblings.each(function() {
			$(this).removeClass('active');
		});
	
		tab.addClass('active');
		panel.addClass('active');
	}
	
	//Attach events to menu
	$(document).ready(
		function() {
			if (localStorage.getItem('tab') != 'undefined'
					&& localStorage.getItem('tab') != null
					&& (localStorage.getItem('panel') != 'undefined' && localStorage
							.getItem('panel') != null)) {
				var ind = localStorage['tab'];
				console.log('tabindex : ' + ind);
				var ind2 = localStorage['panel'];
				console.log('panel index : ' + ind2);
				make_button_active($('.lecturedetail li').eq(ind),
						$('.tab-pane').eq(ind2));
			} else {
				make_button_active($("#lectureTab"),
						$(".lecturepanel"));
			}

			$(".lecturedetail li").click(
					function() {
						if (localStorage) {
							localStorage['tab'] = $(this).index();
							var panel = $(this).children().attr(
									'data-target');
							localStorage['panel'] = $(panel)
									.index();
						}
					});
		});
</script>

</header>
<div class="container">
   <div class="row">
      <div class="col-md-10 col-sm-10">
         <div class="tabs lectureTab" >
            <ul class="nav nav-tabs lecturedetail" role="tablist" >
               <li role="presentation" id="lectureTab Tabs" ><a class="atab" data-toggle="tab" data-target="#lectureList">강좌소개</a></li>
               <li role="presentation" id="qaTab Tabs"><a class="atab" data-toggle="tab" data-target="#QnA">질의응답</a></li>
            </ul>
         </div>

         <!-- Page Content -->

         <div class="row">
            <div class="col-md-9 tab-content">
               <div class="tab-pane lecturepanel" id="lectureList">
                  <h1 class="mt-4">${lecture.lecture_title}</h1>
                  <p class="lead">
                     by <a href="#">${lecture.user_nickname}</a> 
					<span>
					<c:if test="${applyCount == 0}">                  
							<button class="btn btn-sm btn btn-success pull-right" id="applyLecture">수강신청</button>
							<input type="hidden" id="lecture_index_applyLecture" value="${lecture.lecture_index}"/>
					</c:if>                   
                   <c:if test="${applyCount >0}">
                  			<button class="btn btn-sm btn-warning pull-right" id="applyLectureCancel">수강 취소</button>
                  	</c:if>
                  </span>
                  </p>
                  <hr />
                  <span>업로드 날짜:${lecture.lecture_upload_date }</span>
                  <input  id="user_index" type="hidden" value="${session_user.user_index}" />
                  <hr>
                  <!-- Preview Image -->
                  <div class="col-sm-12 youtubeWrap ">
                     ${lecture.lecture_content }<br> <br>
                  </div>
                  <div class="col-sm-12" id="lectureList">
                  <!-- User Rating -->
                  <c:if test="${lectureTotalScore.lecture_total_score <= 0}">
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <h5>(등록된 수강평이 없습니다.)</h5>
                  </c:if>
                  <c:if test="${lectureTotalScore.lecture_total_score == 1}">
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star"></span>
                  </c:if>
                  <c:if test="${lectureTotalScore.lecture_total_score == 2}">
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star"></span>
                  </c:if>
                  <c:if test="${lectureTotalScore.lecture_total_score == 3}">
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star "></span>
                     <span class="fa fa-star"></span>
                  </c:if>
                  <c:if test="${lectureTotalScore.lecture_total_score == 4}">
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star"></span>
                  </c:if>
                  <c:if test="${lectureTotalScore.lecture_total_score == 5}">
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                     <span class="fa fa-star checked"></span>
                  </c:if>
                  </div>
                  <h5>${lectureTotalScore.lecture_review_count }개의수강평</h5> 
										
					<c:set var="five" value="0"/>
					<c:set var="four" value="0"/>
					<c:set var="three" value="0"/>
					<c:set var="two" value="0"/>
					<c:set var="one" value="0"/>					
					
					<c:set var="fiveCNT" value="0"/>
					<c:set var="fourCNT" value="0"/>
					<c:set var="threeCNT" value="0"/>
					<c:set var="twoCNT" value="0"/>
					<c:set var="oneCNT" value="0"/>
					
					<c:forEach items="${barmap}" var="barmap">
						<c:if test="${barmap.LECTURE_REVIEW_SCORE eq 5}">
							<c:set var="five" value="${barmap.BARAVG}"/>
							<c:set var="fiveCNT" value="${barmap.BARCNT}"/>
						</c:if>
						<c:if test="${barmap.LECTURE_REVIEW_SCORE eq 4}">
							<c:set var="four" value="${barmap.BARAVG}"/>
							<c:set var="fourCNT" value="${barmap.BARCNT}"/>
						</c:if>
						<c:if test="${barmap.LECTURE_REVIEW_SCORE eq 3}">
							<c:set var="three" value="${barmap.BARAVG}"/>
							<c:set var="threeCNT" value="${barmap.BARCNT}"/>
						</c:if>
						<c:if test="${barmap.LECTURE_REVIEW_SCORE eq 2}">
							<c:set var="two" value="${barmap.BARAVG}"/>
							<c:set var="twoCNT" value="${barmap.BARCNT}"/>
						</c:if>
						<c:if test="${barmap.LECTURE_REVIEW_SCORE eq 1}">
							<c:set var="one" value="${barmap.BARAVG}"/>
							<c:set var="oneCNT" value="${barmap.BARCNT}"/>
						</c:if>												
					</c:forEach>
				
                  <div class="row">
                  
                     <div class="side">
                        <div>
                           <h3>
                              <span class="fa fa-star checked">*5</span>
                           </h3>
                        </div>
                     </div>
                     <div class="middle">
                        <div class="bar-container">
                           <div class="bar-${five}"></div>
                        </div>
                     </div>
                     <div class="side right">
                        <div>${fiveCNT}</div>
                     </div>
                     <div class="side">
                        <div>
                           <h3>
                              <span class="fa fa-star checked">*4</span>
                           </h3>
                        </div>
                     </div>
                     <div class="middle">
                        <div class="bar-container">
                           <div class="bar-${four}"></div>
                        </div>
                     </div>
                     <div class="side right">
                        <div>${fourCNT}</div>
                     </div>
                     <div class="side">
                        <div>
                           <h3>
                              <span class="fa fa-star checked">*3</span>
                           </h3>
                        </div>
                     </div>
                     <div class="middle">
                        <div class="bar-container">
                           <div class="bar-${three}"></div>
                        </div>
                     </div>
                     <div class="side right">
                        <div>${threeCNT}</div>
                     </div>
                     <div class="side">
                        <div>
                           <h3>
                              <span class="fa fa-star checked">*2</span>
                           </h3>
                        </div>
                     </div>
                     <div class="middle">
                        <div class="bar-container">
                           <div class="bar-${two}"></div>
                        </div>
                     </div>
                     <div class="side right">
                        <div>${twoCNT}</div>
                     </div>
                     <div class="side">
                        <div>
                           <h3>
                              <span class="fa fa-star checked">*1</span>
                           </h3>
                        </div>
                     </div>
                     <div class="middle">
                        <div class="bar-container">
                           <div class="bar-${one}"></div>
                        </div>
                     </div>
                     <div class="side right">
                        <div>${oneCNT}</div>
                     </div>                     
                  </div>
                  
                  
                  
                  <hr style="border: 3px solid #f1f1f1">
                  
                  <br /><br />
                  
                  <div class="card my-4"> 
                  
                     <c:if test="${(session_user.user_index != null and applyCount >0) or session_user.user_level >1000 or session_user.user_type eq 'admin'  }">
                        <form method="get" name="cmtform"
                           action="${pageContext.request.contextPath}/lecture/lectureReview"
                           onsubmit="return validate();" id="orgin">
                           <input type="hidden" value="${lecture.lecture_index}"
                              name="lecture_review_lecture_index" id="lecture_review_lecture_index"/> 
                              <input type="hidden"  value="${session_user.user_index}" name="lecture_review_writer_index" id="review_writer" />
                           <h5 class="card-header headrmody">수강 후기</h5>
                           <div class="star-rating"
                              style="display: inline-block; margin-left: 15px; margin-top: 7px; cursor: pointer;">
                              <label class="col-form-label" id="updaetName">닉네임 :
                                 ${session_user.user_nickname}</label>
                              <div class="form-inline">
                                 <label class="col-form-label">제목 : &nbsp;&nbsp;&nbsp;</label>
                                 <input type="text" class="form-control mb-2 mr-sm-1"
                                    id="reviewTitle" name="lecture_review_title" />
                                 <input type="hidden" class="lecture_review_index" name="lecture_review_index" id="lecture_review_index" value=""/>   
                              </div>
                              <span id="image1" class="fa fa-star " onmouseover="show(1);"
                                 onclick="mark(1);" onmouseout="noshow(1);"></span> <span
                                 id="image2" class="fa fa-star " onmouseover="show(2);"
                                 onclick="mark(2);" onmouseout="noshow(2);"></span> <span
                                 id="image3" class="fa fa-star " onmouseover="show(3);"
                                 onclick="mark(3);" onmouseout="noshow(3);"></span> <span
                                 id="image4" class="fa fa-star " onmouseover="show(4);"
                                 onclick="mark(4);" onmouseout="noshow(4);"></span> <span
                                 id="image5" class="fa fa-star " onmouseover="show(5);"
                                 onclick="mark(5);" onmouseout="noshow(5);"></span>
                           </div>                          
                           <input type="hidden" name="lecture_review_score" id="starScore" class="lecture_review_score"  value=""/>
                           <div class="card-body">
                              <div class="form-group">
                                 <textarea class="form-control" rows="3"
                                    name="lecture_review_content" placeholder="수강후기"
                                    id="lecture_review_content"></textarea>                              
                              </div>
                              
                              <c:if test="${chk}">
                                 <button type="submit" class="btn btn-primary ">등록</button>
                              </c:if>
                              <c:if test="${!chk}">
                                 <button type="submit" class="btn btn-primary hiddenTag" style="display:none">완료</button>
                                 <button type="button" class="btn btn-danger deleteReview hiddenTag"   style="display:none">삭제</button>
                              </c:if>
                           </div>
                        </form>
                     </c:if>
                     <c:if test="${((session_user.user_level <1001 or session_user.user_type ne 'admin' )and applyCount == 0 ) or session_user.user_index == null  }">
                        <form method="get" name="cmtform"
                           action="${pageContext.request.contextPath}/lecture/lectureReview"
                           onsubmit="return validate();" id="orgin">

                           <h5 class="card-header">수강 후기</h5>
                           <div class="star-rating"
                              style="display: inline-block; margin-left: 15px; margin-top: 7px; cursor: pointer;">
                              <label class="col-form-label">닉네임 :
                                 ${session_user.user_nickname}</label>
                              <div class="form-inline">
                                 <label class="col-form-label" >제목 : &nbsp;&nbsp;&nbsp;</label>
                                 <input type="text" class="form-control mb-2 mr-sm-1"
                                    id="reviewTitle" name="lecture_review_title" disabled  placeholder="수강신청 후  사용해 주세요"/>
                                 <input type="hidden" class="lecture_review_index" name="lecture_review_index" id="lecture_review_index" value=""/>   
                              </div>
                                 <span class="fa fa-star checked"></span>
                                 <span class="fa fa-star checked"></span>
                                 <span class="fa fa-star checked"></span>
                                 <span class="fa fa-star checked"></span>
                                 <span class="fa fa-star checked"></span>
                           </div>
                           
                      
                           <div class="card-body">
                              <div class="form-group">
                                 <textarea class="form-control" rows="3"
                                    name="lecture_review_content" placeholder="수강신청 후  사용해 주세요"
                                    id="lecture_review_content" disabled></textarea>                              
                              </div>
                           </div>
                        </form>
                     </c:if>
                     
                     
                     
                  </div>
				
					
				<br /><br />
                  <c:forEach items="${rlist}" var="r">
                     <!-- Single Comment -->
                     <div class="media mb-2">
                      <!--   <img class="d-flex mr-3 rounded-circle"
                           src="http://placehold.it/50x50" alt=""> -->
                    <c:if test="${r.user_thumbnail ne null}">
                     <img
                        src="${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${r.user_thumbnail}"
                        id="profile-image1" class="d-flex mr-3 rounded-circle"
                        alt="User Pic" style="width: 50px; height: 50px"/>
                  </c:if>
                  <c:if test="${r.user_thumbnail eq null}">
                     <img
                        src="${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/defaultThumbnail.png"
                        id="profile-image1" class="d-flex mr-3 rounded-circle"
                        alt="User Pic" style="width: 50px; height: 50px"/>
                  </c:if>
                        <div class="media-body">
                           <span>${r.user_nickname } </span>
	                      
                           <c:if test="${r.lecture_review_score == '1'}">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                           </c:if>
                           <c:if test="${r.lecture_review_score eq 2}">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                           </c:if>
                           <c:if test="${r.lecture_review_score == '3'}">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                              <span class="fa fa-star "></span>
                           </c:if>
                           <c:if test="${r.lecture_review_score eq 4}">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star "></span>
                           </c:if>
                           <c:if test="${r.lecture_review_score eq 5}">
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                              <span class="fa fa-star checked"></span>
                           </c:if>
                        
                           <h4 class="title">${r.lecture_review_title }</h4>
                           <h5 class="content">${r.lecture_review_content }</h5>
                           <input type="hidden" name="lecture_review_index"
                              class="lecture_review_index"
                              value="${r.lecture_review_index }" /> <input type="hidden"
                              value="${lecture.lecture_index} " class="lecture_index"
                              name="lecture_index" /> <input type="hidden"
                              value="${r.lecture_review_score }" class="score" />
                          <input type="hidden" class="uindex" value="${r.lecture_review_writer_index }"/>
                          <input type="hidden" class="nickname" value="${r.user_nickname }"/>
                              
                           <c:if test="${ r.user_nickname eq  session_user.user_nickname  or session_user.user_level >1000 or session_user.user_type eq 'admin'  }">
                           <button type="button"
                              class="btn btn-sm btn-primary pull-right modiy">수정</button>
                           </c:if>
                        </div>
                     </div>
                     <hr />
                  </c:forEach>
			
	
                  <!-- Comment with nested comments -->
                  <div class="">
                     <h1>강좌 교육 과정</h1>
                     <table class="table">
                        <tbody>
                           <c:forEach items="${blist}" var="bl">
                              <tr>
                                 <c:if test="${!empty bl.LECTURE_BOARD_CHAPTER }">
                                    <tr class="lecture_section" scope="col">
                                       <td colspan="6"><h3>${bl.LECTURE_BOARD_CHAPTER }</h3></td>
                                    </tr>
                                 </c:if>                            
                                 <td class="play_icons">
                                    <!-- <a class="lectureView"> --> <img
                                    src="${pageContext.request.contextPath}/resources/images/play-icon.png">
                                 </td>
                           
                                 <td class="play_title"><c:if test="${session_user.user_index != null and applyCount > 0 or lecture.lecture_instructor_index eq session_user.user_index or session_user.user_type eq 'admin'  }"><a class="lectureView2"></c:if>${bl.LECTURE_BOARD_TITLE}</a>
                                    <input type="hidden" value="${bl.LECTURE_BOARD_INDEX}"
                                    class="my_boardLecture_index"  /> <input type="hidden"
                                    value="${lecture.lecture_index}" class="my_lecture_index" /></td>
                                 <td class="preview"><img
                                    src="${pageContext.request.contextPath}/resources/images/free.png"></td>
                                 <td class="time">${bl.LECTURE_BOARD_UPLOAD_DATE }</td>
                                 <td class="attachment"><c:if
                                       test="${bl.LECTURE_ATTACH_RENAMEDFILENAME ne null}">
                                       <a
                                          href="${pageContext.request.contextPath}/resources/uploadFiles/BoardLecture/${bl.LECTURE_ATTACH_RENAMEDFILENAME}"
                                          download> <img
                                          src="${pageContext.request.contextPath}/resources/images/attachment.png"></a>
                                    </c:if> <c:set var="name" value="${bl.LECTURE_INSTRUCTOR_INDEX}" />
                                    <c:set var="name2" value="${session_user.user_index}" /> <c:if
                                       test="${ name eq name2}">

                                    </c:if></td>
                              </tr>   
                              <c:set var="count" value="${count + 1}" />                           
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>

                  <input type="hidden" id="my_lecture_index"
                     value="${lecture.lecture_index}" />
                  <c:if
                     test="${session_user.user_index eq lecture.lecture_instructor_index  or session_user.user_level >1000 or session_user.user_type eq 'admin' }">
                     <button class="btn btn-sm btn-warning pull-right"
                        id="lectureBoardInsert">등록하기</button>&nbsp;
               </c:if>
               </div>
               

               <div class="QnA tab-pane" id="QnA">
                  <table class="table table-striped">
                     <thead>
                        <tr>
                           <th style="width: 10%">번호</th>
                           <th style="width: 40%">제목</th>
                           <th style="width: 15%">작성자</th>
                           <th style="width: 25%">날짜</th>
                           <th style="width: 10%">조회수</th>
                        </tr>
                     </thead>
                     <c:forEach items="${qlist}" var="q">
                     <tbody>
                        <tr>
                           <td>${ q.LECTURE_Q_INDEX }</td>
                           <td><a href="/lar/lecture/QnA/detail/${q.LECTURE_Q_INDEX}">${ q.LECTURE_Q_TITLE }</a></td>
                           <td>${ q.USER_NICKNAME }</td>
                           <td>${ q.LECTURE_Q_UPLOAD_DATE }</td>
                           <td>${ q.LECTURE_Q_HITS }</td>
                        </tr>
                     </tbody>
                     </c:forEach>
                  </table>
                  <a class="btn btn-primary pull-right"
                     href="/lar/lecture/QnA/writeForm/${lecture.lecture_index}">글쓰기</a>
                  <div class="pagingArea" style="text-align: center">
                     <%
                        int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
                        int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
                        String cPageTemp = request.getParameter("cPage");
                        int cPage = 1;
                        try {
                           cPage = Integer.parseInt(cPageTemp);
                        } catch (NumberFormatException e) {
                        }
                     %>
                     <%=com.misoot.lar.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "/lar/lecture/QnA")%>
                  </div>
               </div>
            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-3">
               <!-- Categories Widget -->
               <div class="card ">
                  <div class="card-header" style="">강좌 정보</div>
                  <div class="card-body">
                     <div class="text-center">
                     <c:if test="${lecture.user_thumbnail eq null}">                                         	                     
                     	<img src="${pageContext.request.contextPath}/resources/images/play-icon.png" class="rounded-circle" width="125" height="125">
                     </c:if>
                     <c:if test="${lecture.user_thumbnail ne null}">                                         	
                     	<img src="${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${lecture.user_thumbnail}" class="rounded-circle" width="125" height="125">
                     </c:if>
                        <p>${lecture.user_nickname}</p>
                        <ul class="list-group list-group-flush">
                           <li class="list-group-item" id="lecturePrice"><c:if test="${lecture.lecture_price == 0}">Free</c:if>
                           <c:if test="${lecture.lecture_price > 0}">${lecture.lecture_price}원</c:if>
                           </li>
                           <li class="list-group-item">${lecture.lecture_level }</li>
                           <li class="list-group-item"><c:out value="${count}"/>개의 강의</li>
                           <input type="hidden" value="${lecutre.lecture_index }" />
                        </ul>
                     </div>
                  </div>
               </div>
               <br />
               <!-- Side Widget -->
               <div class="card my-3">
                  <h6 class="card-header">다른 강좌 보기 : ${lecture.user_nickname}</h6>
                  <div class="card-body">
                     <ul class="list-group list-group-flush">
                        <li class="list-group-item">추천 강좌 넣으세요</li>
                        <li class="list-group-item">Dapibus ac 추천 강좌 넣으세요 in</li>
                        <li class="list-group-item">추천 강좌 넣으세요 at eros</li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <br> <br> <br>
      <script>
         function validate() {         
            if ($("#reviewTitle").val() == ''
                  || $("#reviewTitle").val() == 'null') {
               alert("제목을 작성하세요");
               return false;
            }
            if ($("#starScore").val() == 0) {
               alert("별점을 등록하세요");
               return false;
            }
            if ($("#lecture_review_content").val() == 0) {
               alert("내용을 작성하세요");
               return false;
            }
            
         }
         var toggle = 0;
         $(".modiy").on("click",function() {
        	 
        	 if( toggle== 0){
            var index = $(this).siblings(".lecture_index").val();
            var title = $(this).siblings(".title").text();
            var content = $(this).siblings('.content').text();
            var rindex = $(this).siblings('.lecture_review_index').val();
            var score = $(this).siblings('.score').val();
            var uindex = $(this).siblings('.uindex').val();
            var nickname = $(this).siblings('.nickname').val();

            $(".hiddenTag").each(function(index, item){
               $(item).css('display','inline');
            });
            $("#orgin").children().find('#reviewTitle').val(title);
            $("#orgin").children().find('#lecture_review_content').val(content).focus();
            $("#orgin").children().find('#lecture_review_index').val(rindex);         
            $('.lecture_review_score').val(score);
            $('#review_writer').val(uindex);
            $('#updaetName').text( "닉네임 :" +nickname);
            $('.headrmody').text("수강후기 수정");
             toggle = 1;
        	 }else {
        		 location.reload();
        	 }
         });
     
               
      </script>
      <c:import url="/WEB-INF/views/common/_footer.jsp" />