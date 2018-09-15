<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<html>
	<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/lar.min.js"></script>   
	
	
    <title>LAR: 강의 동영상</title>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Bootstrap Core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link
	href="${pageContext.request.contextPath}/resources/css/lar-board.min.css"
	rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/portfolio-item.min.css" rel="stylesheet">
 
    <style>
    .youtubeWrap {
		  position: relative;
		  width: 100%;
		  /* padding-bottom: 56.25%; */
	}
	
	 .youtubeWrap iframe {
	  /* position: absolute; */
	  width: 100%;
	  height: 100%;
	}
    
    body{    
		background-image: url("${pageContext.request.contextPath}/resources/images/videoBackground.png");
 		min-height: 100%;
    	background-position: center;
    	background-size: cover;
    }
    
    #prevBtn, #nextBtn {
    	
    }
    
    </style>
    </head>
    <body>
	    <c:if test="${checkApply >0 or session_user.user_level >1000 or session_user.user_type eq 'admin' }">
 
    <div class="container">
    	<div class="row" style="margin-bottom: 15px;">
		      <h1 class="col col-md-12" style="text-align: center;">${bLecture.lecture_board_title }</h1>
		</div>
		      
		<hr style="color:rightgray;">
		
		<div class="row">			
			<div class="col col-md-1">
				<button type="button" id="prevBtn" class="btn btn-defualt" style="top:50%; position:absolute;">  &lt; </button>
			</div>
			<div class="col-md-10 youtubeWrap">
				${bLecture.lecture_board_content} <br><br>
			</div>
			
			<div class="col col-md-1"> 
				<button type="button" id="nextBtn" class="btn btn-default" style="top:50%; position:absolute;"> &gt; </button>
			</div>
		</div>
		
		<hr style="border: 0.5px solid white;">
		
		<div class="row">		                
			<div class="col-md-12" style="margin-top : 10px;"> 
				<h3> 강좌 교육 과정</h3>	<br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
            	<table class="table">
	                <tbody>
						<c:forEach items="${blist}" var="bl">                                          
	                        <c:if test="${!empty bl.LECTURE_BOARD_CHAPTER }">                                              
	                        <tr class="lecture_section" scope="col">                     
	                        	<td colspan="6"><h3>${bl.LECTURE_BOARD_CHAPTER } </h3></td>
	                    	</tr>                    	
	                    	</c:if>  	                  
	                    	                           	
	                    	<tr class="boardList_tr ${bl.LECTURE_BOARD_INDEX}">
	                 			<td class="play_icons"><img src="${pageContext.request.contextPath}/resources/images/play-icon.png">
	                            <td class="play_title"><a class="lectureView">${bl.LECTURE_BOARD_TITLE}</a>
	                           <input type="hidden"  value="${bl.LECTURE_BOARD_INDEX}" class="my_boardLecture_index"/>
	                           <input type="hidden" value="${lecture_index}"  class="my_lecture_index"/></td> 
	                           <td class="preview"> <img src="${pageContext.request.contextPath}/resources/images/free.png"></td>  
	                           <td class="time" >${bl.LECTURE_BOARD_UPLOAD_DATE }</td>
	                           <td class="attachment">
	                           <c:if test="${bl.LECTURE_ATTACH_RENAMEDFILENAME ne null}">
	                              <a href="${pageContext.request.contextPath}/resources/uploadFiles/BoardLecture/${bl.LECTURE_ATTACH_RENAMEDFILENAME}" download><img src="${pageContext.request.contextPath}/resources/images/attachment.png"></a>
	                           </c:if>
	                    		                                     	                    
	                           	<c:set var="name" value="${bl.LECTURE_INSTRUCTOR_INDEX}" />
	                          	<c:set var="name2" value="${session_user.user_index}"/>
	                          	<c:if test="${ name eq name2 or session_user.user_level >1000 or session_user.user_type eq 'admin'}">
	                          	<input type="hidden" value="${lecture_index}" class="my_lecture_index" />
	                          	<input type="hidden"  value="${bl.LECTURE_BOARD_INDEX}" class="my_boardLecture_index"/>
	                      
	                            <button class="btn btn-warning pull-right lectureBoardUpdate">수정하기</button>
	                         
	                            </c:if>
	                           </td>
	                       	 	<c:if test="${bl.hcheck == 0 || bl.hcheck == null }">                      
	                           <td><button class="btn btn-sm btn-warning checkBoardHistory">check</button>
	                           			<input type="hidden" value="${lecture_index}" class="my_lecture_index" />
	                          	<input type="hidden"  value="${bl.LECTURE_BOARD_INDEX}" class="my_boardLecture_index"/>
	                           </td>
	        					</c:if>
	        					<c:if test="${bl.hcheck == 1 }">           
	                           <td> <button  type="button"class="btn btn-sm btn-primary" >수강 완료</button></td>
	                        	</c:if>
	                       </tr> 
	                    </c:forEach>
	                </tbody>
            	</table>
            </div>
		</div>   
	</div>
</c:if>
<script>
	$(function(){
    	var currentPage = $('.${bLecture.lecture_board_index}').index();
    	  
		if(currentPage == 1) {
			$('#prevBtn').attr('disabled', '');
		}    	      	  
    	  
		if((currentPage + 1) - $('.lecture_section').length == $('.boardList_tr').length) {
			$('#nextBtn').attr('disabled', '');
		}
		
		var prevPage = $('tr').eq(currentPage-1).children().children('.lectureView');
		var nextPage = $('tr').eq(currentPage+1).children().children('.lectureView');
    	  
		if(prevPage.length == 0) prevPage = $('tr').eq(currentPage-2).children().children('.lectureView');
		
		if(nextPage.length == 0) nextPage = $('tr').eq(currentPage+2).children().children('.lectureView');
    	  
		$('#nextBtn').on('click', function(){
			nextPage.click();
		});
		
		$('#prevBtn').on('click', function(){
			prevPage.click();
		});
	});
      
</script>
      </body>   
    </html>
