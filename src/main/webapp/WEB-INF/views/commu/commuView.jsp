<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
   <c:param value="커뮤니티" name="pageTitle" />
</c:import>
</header>

<script
   src="${pageContext.request.contextPath}/resources/js/tagInput.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/tagInput.css" />

<style>
span {
   font-size: 15pt;
}
.commuTitle {
   font-size: 30pt;
}
.commuContent {
   font-size: 15pt;
}
textarea {
   resize: none;
}
.commentHelp{
   color: gray;
}
.commentHelp{
   color: gray;
}
</style>
<script>
   $(function() {
      /* $('#accordion').html(${commu.commu_Content}); */
      
      $('#commuDelete').click(function() {
                     
                     //location.href = "${pageContext.request.contextPath}/commu/commuDelete/${commu.commu_Index}";
                  });
      $('#commuModify').click(function() {
         location.href = "${pageContext.request.contextPath}/commu/commuForm/${commu.commu_Category_Index}/${commu.commu_Index}";
      });
      $('#commuReply')
            .click(
                  function() {
                     /* $.ajax({
                        method : "POST",
                        url : "${pageContext.request.contextPath}/commu/commuReply",
                        dataType : "JSON",
                        data : {replyWriter:${m.user_Index},replyContent:$('#replyComment').val()},
                        error : function(){alert('error');}
                        
                     }); */
                     if ($('#replyComment').val().trim() == null
                           || $('#replyComment').val().trim() == "") {
                        alert('내용을 입력하세요');
                     }else if('${session_user.user_index}'==''){
                        alert('로그인을 먼저 해주세요');
                     } else
                        location.href = "${pageContext.request.contextPath}/commu/commuReply?replyWriter="
                              + ${session_user.user_index}
                     +"&replyContent=" + $('#replyComment').val()
                           + "&commuIndex=" + ${commu.commu_Index}
                     ;
                  });
      function replyDelete(s) {
         location.href = "${pageContext.request.contextPath}/commu/commuReplyDelete?commu_Reply_Index="
               + s;
         alert(s);
      }
   });
   function validate() {
      if('${session_user.user_index}'==''){
         alert('로그인을 먼저 해주세요');
         return false;
      }
      return true;
   }
   function realDeleteCommu(){
      location.href = "${pageContext.request.contextPath}/commu/commuDelete/${commu.commu_Index}";
      }
   function fileDownload(oName, rName) {
      //한글파일명이 있을 수 있으므로, 명시적으로 encoding
      oName = encodeURIComponent(oName);
      location.href = "${pageContext.request.contextPath}/commu/fileDownload?oName="
            + oName + "&rName=" + rName;
   }
</script>


<div class="container-fluid">
   <div class="row">

      <div class="container_fluid  col-lg-10 col-md-10 col-sm-10">
         <div class="blog-heading">
            <h3 class="text-capitalize">
               &nbsp;&nbsp;게시판 글보기

               <c:if test="${session_user.user_index eq commu.commu_Writer_Index}">
                  <div style="text-align:right;">
                  <button type="button" class="btn btn-success"
                     id="commuModify">글수정</button>
                  <button type="button" data-toggle="modal" data-target="#realDeleteCommu" 
                  class="btn btn-danger">글삭제</button>
                  </div>
               </c:if>
            </h3>

         </div>
         <br> <br> <br>
         <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="panel panel-default">
               <div class="panel-heading">
                  <div style="text-align: left;">
                     <p class="commuTitle">${commu.commu_Title}
                     <div class="pull-right">
                     <span style=>글쓴이${commu.commu_Writer}</span>
                           <span>업데이트날짜${commu.commu_Update_Date}</span>
                           <span>조회수${commu.commu_Hits}</span></div><br></p>
                     <c:forEach items="${attachmentList}" var="a" varStatus="vs">
                        <button type="button" style="width: auto; height: auto;"
                           class="btn btn-outline-success btn-warning pull-right"
                           onclick="fileDownload('${a.commu_Attach_Originfilename}','${a.commu_Attach_Renamedfilename }');">
                           첨부파일 - ${a.commu_Attach_Originfilename }</button>
                     </c:forEach>
                     
                     <!--  <div style="text-align: right;">
                 <br /><br />
                     <span class="bg-warning">${commu.commu_Writer}</span>&nbsp;&nbsp;
                 <span class="bg-warning">${commu.commu_Update_Date}</span>&nbsp;&nbsp;
                 <span class="bg-warning">${commu.commu_Hits}</span>
                 </div>
                -->
                     <ul style="list-style: none;">
                        <li style="text-align: left;">
                           <!-- Tag입니다. 건들지 마요 -_- -->
                           <div class="bootstrap-tagsinput form-group">
                              <div class="tags" id="tags">
                                 <c:forTokens items="${commu.commu_tags}" var="tag" delims=",">
                                    <a class="labelinput" style="color: green;">#${tag}</a>
                                 </c:forTokens>
                              </div>
                           </div> <!-- Tag입니다. 건들지 마요 -_- -->
                        </li>
                     
                     </ul>
                  </div>
               </div>

               <!-- .panel-heading -->
               <div class="panel-body" style="min-height: 300px;">
                  <div class="panel-group" id="accordion">
                     <p style="font-size: 15pt">${commu.commu_Content}</p>
                  </div>
               </div>
               <!-- .panel-body -->
            </div>
         </div>
         <br>
         <div class="col-lg-12 col-md-12 col-sm-12"
            style="padding: 100px 0 0 50px">
            <div class="row">
               <div class="col-md-10">
                  <textarea name="replyComment" id="replyComment"
                     class="form-control" rows="3" required="required"
                     placeholder="Type here message"></textarea>
               </div>
               <div class="col-md-2">
                  <button class="btn btn-primary" id="commuReply">댓글달기</button>
               </div>
            </div>
            <h3>
               <span style="color: red">${commuReply.size()}</span> 개의 Comment
            </h3>
            <c:forEach items="${commuReply}" var="cr">
               <form
                  action="${pageContext.request.contextPath}/commu/commuReplyReply"
                  method="POST" onsubmit="return validate();">
                  <div class="row">
                     <input type="hidden" name="commu_Reply_Parent_Index"
                        value="${cr.commu_Reply_Parent_Index}" /> <input type="hidden"
                        name="commu_Reply_Writer_Index"
                        value="${session_user.user_index}" /> <input type="hidden"
                        name="commu_Reply_Commu_Index"
                        value="${cr.commu_Reply_Commu_Index}" /> <input type="hidden"
                        name="commu_Reply_Order_Index"
                        value="${cr.commu_Reply_Order_Index}" /> <input type="hidden"
                        name="commu_Reply_Depth_Index"
                        value="${cr.commu_Reply_Depth_Index}" />
                     <div class="row" style="margin-bottom: 1%;">
                     <div class="col-md-8">
                        <c:set var="ReplyMargin" value="${cr.commu_Reply_Depth_Index*5}"/>
                        <c:if test="${ReplyMargin >20}">
                        <c:set var = "ReplyMargin" value="20"/>
                        </c:if>
                        <div class="panel panel-default"
                           style="margin-left:${ReplyMargin}%; word-break: break-all; ">
                           <c:if test="${cr.commu_Reply_Depth_Index!=1}">
                              <img
                                 src="${pageContext.request.contextPath}/resources/images/ARROW.PNG"
                                 style="width: 20px; height: 20px; display: inline-block;" />
                           </c:if> 
                           <c:choose>
                                    <c:when test="${fn:length(cr.commu_Reply_Content) > 65}">
                                       <span><c:out value="${fn:substring(cr.commu_Reply_Content,0,64)}"/>....</span>
                                    </c:when>
                                    <c:when test="${fn:length(cr.commu_Reply_Content) <= 64}">
                                       <span><c:out value="${cr.commu_Reply_Content}"/></span>
                                    </c:when>
                           </c:choose>
                           <%-- <p style="font-size: 16px">${cr.commu_Reply_Content}</p> --%>
                           <p class="commentHelp">&nbsp;&nbsp;&nbsp;${cr.commu_Reply_Writer}
                              | ${cr.commu_Reply_Update_Date } | 신고</p>
                        </div>
                     </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                        <c:if
                           test="${cr.commu_Reply_Writer_Index eq session_user.user_index}">
                           <c:if test="${cr.commu_Reply_Is_Deleted eq 0}">
                           <%-- <button class="btn btn-danger" data-toggle="collapse" data-target="#modify${cr.commu_Reply_Index}">수정</button> --%>
                           <button class="btn btn-danger" class="replyDelete"
                              onclick="location.href='${pageContext.request.contextPath}/commu/commuReplyDelete?commu_Reply_Index=${cr.commu_Reply_Index}'">삭제</button>
                           </c:if>
                        </c:if>
                        <c:if test="${cr.commu_Reply_Is_Deleted eq 0 }">
                           <button class="btn btn-primary" data-toggle="collapse"
                              data-target="#reply${cr.commu_Reply_Index}">댓글달기</button>
                        </c:if>
                     </div>
                  </div>
                  </div>
                  <div class="row">
                     <div id="reply${cr.commu_Reply_Index}" class="collapse">
                        <div class="col-md-8">
                        <c:set var="textWidth" value="${100-cr.commu_Reply_Depth_Index*5}"/>
                        <c:if test="${textWidth <80}">
                        <c:set var = "textWidth" value="80"/>
                        </c:if> 
                           <textarea name="commu_Reply_Content"
                              id="Commentreply${cr.commu_Reply_Index}" class="form-control"
                              rows="3" required="required" placeholder="Type here message"
                              style="margin-left:${ReplyMargin}%; width:${textWidth}%"></textarea>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                           <button type="submit" class="btn btn-primary commuReply_Reply">댓글등록</button>
                        </div>
                     </div>
                  </div>

                  <br>
               </form>
            </c:forEach>

         </div>
      </div>
      <div class="modal fade" id="realDeleteCommu" role="dialog">
                       <div class="modal-dialog">
                       
                         <!-- Modal content-->
                         <div class="modal-content">
                           <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal">×</button>
                             <h2 class="modal-title">게시글 삭제</h2>
                           </div>
                           
                           <div class="modal-body" >
                           <h4>정말 삭제하시겠습니까? 지우면 돌이킬수 없습니다.</h4>
                           
                           
                           </div>
                           <div class="modal-footer">
                            <button type="button" onclick="realDeleteCommu();" class="btn btn-primary">확인</button>
                           
                           <button type="button" class="btn btn-primary"  data-dismiss="modal">취소</button>
                           
                          
                           </div>
                         </div>
                         
                       </div>
                     </div>
      <c:import url="/WEB-INF/views/common/_footer.jsp" />