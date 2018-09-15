<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src='https://www.google.com/recaptcha/api.js'></script>

<c:import url="/WEB-INF/views/common/_header.jsp">
   <c:param value="정보수정" name="pageTitle" />
</c:import>
<style>
tr {
   vertical-align: text-top;
}
th, td {
   padding: 15px;
}
li {
   margin: 0 0 0 0;
   padding: 0 0 0 0;
   border: 0;
   float: left;
}
ul {
   list-style: none;
   margin: 0;
   padding: 0;
}
</style>
<script>
   function infoValidate() {
      reg_Exp = /^[가-힣a-zA-Z0-9]{2,8}$/;
      NicknameResult = reg_Exp.test($('#transName').val());
      reg_Exp = /(01[016789])[-](\d{4}|\d{3})[-]\d{4}$/g;
      phoneResult = reg_Exp.test($('#myPhone').val());
      if (($('#Phone').css('display') == 'none')
            && ($('#nickname').css('display') != 'none')) {//닉네임만 보내주기
         console.log('s닉');
         if (($('#transName').val().trim() == null || $('#transName').val()
               .trim() == "")) {
            alert('바꿀 닉네임을 입력해주세요')
            return false;
            /*    }else if(!NicknameResult){
                  alert('닉네임 형식이 올바르지 않습니다.');
                  return false; */
         } else if (idck == 0) {
            alert('중복체크를 해주세요');
            return false;
         }
      } else if (($('#Phone').css('display') != 'none')
            && ($('#nickname').css('display') == 'none')) {//핸드폰만 보내주기
         console.log('폰');
         if (($('#myPhone').val().trim() == null || $('#myPhone').val()
               .trim() == "")) {
            alert('바꿀 비밀번호를 입력해주세요')
            return false;
         } else if (!phoneResult) {
            alert('핸드폰 형식이 올바르지 않습니다.');
            return false;
         }
      } else if (($('#Phone').css('display') != 'none') && ($('#nickname').css('display') != 'none')) {//둘다보내주기
         console.log('둘다');
         if (($('#transName').val().trim() == null || $('#transName').val()
               .trim() == "")) {
            alert('바꿀 닉네임을 입력해주세요')
            return false;
         } else if (idck == 0) {
            alert('중복체크를 해주세요');
            return false;
         } else if (($('#myPhone').val().trim() == null || $('#myPhone')
               .val().trim() == "")) {
            alert('바꿀 비밀번호를 입력해주세요')
            return false;
         } else if (!phoneResult) {
            alert('핸드폰 형식이 올바르지 않습니다.');
            return false;
         } else if (!NicknameResult) {
            alert('닉네임 형식이 올바르지 않습니다.');
            return false;
         }
      }
      return true;
   }
   $(function() {
      $("#imgFile").hide();
      $("#Photo").click(function() {
         $("#imgFile").click();
      });
   });
   function LoadImg(value, num) {
      if (value.files && value.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            switch (num) {
            case 1:
               $(".img-responsive").attr("src", e.target.result);
            }
            var formData = new FormData();
            formData.append("updateImg", $("#imgFile")[0].files[0]);
            $
                  .ajax({
                     url : "${pageContext.request.contextPath}/user/mypage/imgUpdate",
                     data : formData,
                     processData : false,
                     contentType : false,
                     type : 'POST',
                     success : function(result) {
                        alert("업로드 성공!!");
                     }
                  });
         };
      }
      reader.readAsDataURL(value.files[0]);
   }
</script>
</header>
<div class="container-fluid" style="margin-left: 5%;">
   <div class="">
      <div class="col-lg-10 col-md-10 col-sm-10">
         <!-- UserBox01 Start -->
         <h3 class="">회원 정보</h3>
         <div class="tabs" style="width: 100%;">
            <ul class="nav mypageTab nav-tabs" role="tablist"
               style="width: 100%;">
               <li role="presentation" class="active"><a class=""
                  href="#Info" id="myLecture" data-toggle="tab">
                     &nbsp;&nbsp;&nbsp;내 정보&nbsp;&nbsp;&nbsp; </a></li>
               <li role="presentation"><a class="" href="#Profile_C"
                  id="QnAList" data-toggle="tab"> &nbsp;&nbsp;&nbsp;회원정보
                     변경&nbsp;&nbsp;&nbsp; </a></li>
               <li role="presentation"><a class="" href="#Password_C"
                  id="wishList" data-toggle="tab"> &nbsp;&nbsp;&nbsp;비밀번호
                     변경&nbsp;&nbsp;&nbsp; </a></li>
               <li role="presentation" class="pull-right"><a class=""
                  href="#secession" id="paymentList" data-toggle="tab">
                     &nbsp;&nbsp;&nbsp;화원 탈퇴&nbsp;&nbsp;&nbsp; </a></li>
            </ul>
         </div>
         <div class="mypageBody tab-content">
            <div class="tab-pane active col-lg-12 col-md-12 col-sm-12" id="Info"
               style="width: 100%;">
               <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                  <c:if test="${empty session_user.user_thumbnail}">
                     <img
                        src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
                        id="profile-image1" class="img-circle img-responsive"
                        alt="User Pic" style="width: 613px; height: 233px">
                  </c:if>
                  <c:if test="${!empty session_user.user_thumbnail}">
                     <img
                        src="${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${session_user.user_thumbnail}"
                        id="profile-image1" class="img-circle img-responsive"
                        alt="User Pic" style="width: 613px; height: 233px">
                  </c:if>
               </div>

               <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                  <ul class="container details"
                     style="list-style: none; font-size: 25px;">
                     <li><label> <span class="glyphicon glyphicon-user"></span>
                           닉네임
                     </label></li>
                     <li style="padding-left: 200px;">${session_user.user_nickname}</li>
                  </ul>

                  <hr style="border: 0.03em solid #cbbde2">
                  <ul class="container details"
                     style="list-style: none; font-size: 25px;">
                     <li><label> <span
                           class="glyphicon glyphicon-envelope"></span> 이메일
                     </label></li>
                     <li style="padding-left: 200px;">${session_user.user_id}</li>
                  </ul>
                  <hr style="border: 0.03em solid #cbbde2">
                  <ul class="container details"
                     style="list-style: none; font-size: 25px;">
                     <li><label> <span class="glyphicon glyphicon-phone"></span>
                           핸드폰
                     </label></li>
                     <li style="padding-left: 200px;">${session_user.user_phone}</li>
                  </ul>
               </div>
            </div>


            <div class="tab-pane col-lg-12 col-md-12 col-sm-12" id="Profile_C"
               style="width: 100%;">

               <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                  <c:if test="${empty session_user.user_thumbnail}">
                     <img
                        src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
                        id="profile-image1" class="img-circle img-responsive"
                        alt="User Pic" style="width: 613px; height: 233px">
                  </c:if>
                  <c:if test="${!empty session_user.user_thumbnail}">
                     <img
                        src="${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${session_user.user_thumbnail}"
                        id="profile-image1" class="img-circle img-responsive"
                        alt="User Pic" style="width: 613px; height: 233px">
                  </c:if>
                  <div style="text-align: center; padding-top: 20px;">
                     <button type="button" class="btn-primary btn-lg" id="Photo">이미지
                        변경</button>
                     <input type="file" id="imgFile" name="imgFile"
                        onchange="LoadImg(this,1)">
                  </div>
               </div>
               <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                  <form action="${pageContext.request.contextPath}/user/mypage/C_Info" onsubmit="return infoValidate();">
                     <input type="hidden" value="${session_user.user_index}" name="userindex" />
                     <table style="width:100%;"cellspacing='0' cellpadding="0" >
                        <tr>
                           <th><h5>닉네임</h5></th>
                           <td>${session_user.user_nickname}</td>
                           <td><button type="button" class="btn btn-primary mb-2"
                                 id="nicknameBtn">닉네임 수정</button></td>
                        </tr>

                        <tr>
                           <td><h5>이메일</h5></td>
                           <td colspan="2">${session_user.user_id}</td>
                        </tr>

                        <tr>
                           <td><h5>핸드폰</h5></td>
                           <td>${session_user.user_phone}</td>
                           <td><button type="button" class="btn btn-primary mb-2"
                                 id="phoneBtn">휴대전화 수정</button></td>
                        </tr>

                        <tr style="display: none" id="nickname">
                           <td><h5>Nickname</h5></td>
                           <td><input type="text" id="transName" name="transName"
                              class="form-control" placeholder="한,영,숫자로 2~8 글자를 입력"></td>
                           <td><button type="button" class="btn btn-primary mb-2"
                                 style="text-align: right;" id="transNameBtn">중복체크</button></td>
                        </tr>

                        <tr style="display: none" id="Phone">
                           <td><h5>Phone</h5></td>
                           <td><input type="text" class="form-control" name="myPhone"
                              id="myPhone" placeholder="\-\-\ 문자를 포함해서 입력"></td>
                        </tr>

                        <tr style="display: none" id="submitline">
                        
                           <td colspan="3" style="text-align:center;"><button type="submit" class="btn btn-primary btn-lg">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <button type="cancel" class="btn btn-primary btn-lg">취소</button></td>
                           
                        </tr>
                     </table>
                  </form>
                  <script>
                     $('#phoneBtn').on('click', function() {
                        $('#Phone').toggle();
                        hideSubmitBtn();
                     });
                     $('#nicknameBtn').on('click', function() {
                        $('#nickname').toggle();
                        hideSubmitBtn();
                     });
                     function hideSubmitBtn() {
                        if ($('#Phone').css('display') != 'none'
                              || $('#nickname').css('display') != 'none') {
                           $('#submitline').show();
                        } else {
                           $('#submitline').hide();
                        }
                     }
                  </script>

               </div>
            </div>
            <div class="tab-pane" id="Password_C"
               style="text-align: -webkit-center; width =: 340px; margin: auto; width: 100%;">
               <form action="resetpasswrod" method="post">
                  <!-- onsubmit="return input_check_func()" -->
                  <table>
                     <tr>
                        <th>현재 비밀번호</th>
                        <td class="tleft"><input type="password" class="medium"
                           title="현재 비밀번호를 입력하세요" id="now_pw" name="now_pw"
                           style="width: 300px;"></td>
                     </tr>
                     <tr>
                        <th>새 비밀번호</th>
                        <td class="tleft">
                           <div>
                              <input type="password" class="medium" title="새 비밀번호를 입력하세요"
                                 style="width: 300px;" id="change_pw" name="change_pw">
                           </div> <!-- <span style="color:red;" class="infomation">영어 대문자, 소문자, 숫자, 특수문자가 한개 이상 들어간 8~20 글자를 입력하세요.</span> -->
                        </td>
                     </tr>
                     <tr>
                        <th>새 비밀번호 확인</th>
                        <td class="tleft">
                           <div>
                              <input type="password" class="medium" title="새 비밀번호 다시 입력하세요"
                                 style="width: 300px;" id="change_pw_check"
                                 name="change_pw_check">
                           </div>
                           <div style="margin-top: 20px;">
                              <span style="color: red;" class="infomation">* 확인을 위해
                                 입력하신 비밀번호를 다시 한번 입력해 주세요.</span>
                           </div>
                        </td>
                     </tr>
                     <tr class="end">
                        <th style="vertical-align: middle;">자동입력방지</th>
                        <td class="tleft">
                           <div class="g-recaptcha"
                              data-sitekey="6Le6gGYUAAAAAM3qcpKGxZWRl_fNrmCWf0HTOydu"></div>
                        </td>
                     </tr>
                  </table>
               </form>

               <div style="padding-top: 50px;">
                  <button type="submit" class="btn btn-primary"
                     style="height: 50px; width: 100px;" id="PasswordSubmit">저장</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="cancel" class="btn btn-primary"
                     style="height: 50px; width: 100px;">취소</button>
               </div>

            </div>
            <div class="tab-pane" id="secession">

               <div class="contents-box border-box m_b40">
                  <div>
                     <!-- !inner-contents Start -->
                     <p>회원탈퇴 시 주의사항</p>
                     <ul class="">
                        <li class="listSubject"><span style="color: #7a1b18;">회원탈퇴
                              시 LAR 서비스 내 모든 정보가 삭제되며, 이후 복구가 불가능합니다.</span></li>
                        <li>- 회원탈퇴시 홈페이지 및 유료컨텐츠의 제한됩니다.</li>
                        <li>- 회원가입 시 입력하신 개인정보 및 결제정보 등은 즉시 파기되며 복구하실 수 없습니다.</li>
                        <!--            <li>- 즉시회원탈퇴를 하더라도 사용 중인 소환사명을 즉시 재 생성하실 수 없으며, 최대 10일 정도 기간이 소요될 수 있습니다.</li>-->
                     </ul>
                     <!-- 회원탈퇴 버튼 클릭시 보여주기 -->

                     <div id="out" style="display: none; margin-top: 100px;">
                        <!-- UserBox01 Start -->
                        <form>
                           <fieldset>
                              <legend>
                                 <h3>회원탈퇴를 위한 계정을 확인 해주세요.</h3>
                              </legend>
                              <div class="bg-contents withdraw_table">
                                 <table cellspacing="0" class="request member-info">
                                    <caption>즉시 회원탈퇴를 위한 계정 정보</caption>
                                    <colgroup>
                                       <col style="width: 20%">
                                       <col style="width: 20%">
                                       <col style="width: 20%">
                                       <col style="width: 20%">
                                       <col style="width: 20%">
                                    </colgroup>
                                    <thead>
                                       <tr>
                                          <th scope="col">계정명</th>
                                          <th scope="col">성명</th>
                                          <th scope="col">가입일자</th>
                                          <th scope="col" class="last">구매 강의 갯수</th>
                                          <th scope="col">&nbsp;</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td class="tcenter">${session_user.user_id}</td>
                                          <td class="tcenter">${session_user.user_nickname}</td>
                                          <td class="tcenter">${session_user.user_enrolled_date}</td>
                                          <td class="tcenter last" style="text-align: center;">${history}</td>
                                          <th scope="col"><button type="button"
                                                data-toggle="modal" data-target="#userSecession"
                                                class="btn btn-primary">즉시 탈퇴</button></th>
                                       </tr>
                                    </tbody>
                                    
                                 </table>
                                 <div class="modal fade" id="userSecession" role="dialog">
                                    <div class="modal-dialog">

                                       <!-- Modal content-->
                                       <div class="modal-content">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">×</button>
                                             <h4 class="modal-title" style="text-align: left;">회원탈퇴</h4>
                                          </div>
                                          <div class="modal-body">
                                          <p>회원 탈퇴시 복구 불가능 입니다.</p>
                                          <p>마지막으로 비밀번호를 입력해주세요.</p>
                                  <input type="password" placeholder="비밀번호를 입력해주세요"
                                                id="pass_word">
                                          </div>
                                          <div class="modal-footer">
                                             <span style="float: right;">
                                                <button type="button"
                                                   class="btn btn-primary btn pull-right"
                                                   data-dismiss="modal">취소</button>
                                                <button type="button" id="getout" onclick="getout();"
                                                   class="btn btn-primary btn pull-right"
                                                   style="margin-right: 15px;">확인</button>
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                    </div>
                              </div>
                           </fieldset>
                        </form>

                     </div>
                     <!--   //회원탈퇴 버튼 -->
                     <div class="btnbox tright">
                        <span class="btn-border type02"><input type="button"
                           value="탈퇴 정보" title="탈퇴 정보" class="btn btn-primary" id="nSend"></span>
                     </div>
                  </div>
                  <!--  !inner-contents End -->
                  <script>
                     $('#nSend').on('click', function() {
                        $('#out').toggle();
                        $('#nSend').toggle();
                     });
                     
                     $('#getout').on('click',function() {
                         location.href = "${pageContext.request.contextPath}/user/mypage/getout?userindex="+ ${session_user.user_index};})
                  </script>
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript">
         $(function() {
            //PasswordSubmit 버튼을 클릭 했을 때 
            var userIndex = ${session_user.user_index};
            $("#PasswordSubmit").click(function() {
                           if (grecaptcha.getResponse() == "") {
                              alert("자동입력 방지를 체크해야 합니다.");
                              return false;
                           } else {
                              var userpassword = $('#now_pw').val();
                              var change_pw = $('#change_pw').val();
                              var change_pw_check = $('#change_pw_check').val();
                              var pwCheck = false;
                              reg_Exp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/g;
                              pjCheck = reg_Exp.test($('#change_pw').val());
                        
                              console.log("1"+pjCheck);
                              console.log("2"+change_pw);
                              console.log("3"+change_pw_check);
                              console.log("4"+userpassword);
                              /* 새로운 비밀번호1 가 같은지2 확인 하고 같다면 값을 넘겨주고 같지 않다면 같은 비밀번호를 입력 하라고 보여주기 */
                              if (userpassword == "") {
                                 alert("비밀번호를 입력해주세요");
                              }else if(!pjCheck){
                                 alert("영어 대문자, 소문자, 숫자, 특수문자가 한개 이상 들어간 8~20 글자를 입력하세요.");
                              }else if(change_pw != change_pw_check){
                                 alert("새 비밀번호가 서로다릅니다.");
                              }else {
                                    $.ajax({
                                          async : false,
                                          type : 'POST',
                                          data : {
                                             "userpassword" : userpassword,
                                             "userindex" : userIndex
                                          },
                                          url : "${pageContext.request.contextPath}/user/mypage/PasswordCheck",
                                          dataType : "json",
                                          success : function(data) {
                                             if (data == 0) {
                                                alert("비밀번호가 같지 않습니다. 확인하시고 이용해주세요");
                                                pwCheck = false;
                                             } else{
                                                pwCheck = true;
                                             }
                                          },
                                          error : function(error) {
                                             alert("error : "
                                                   + error);
                                          }
                                       });
                              }
                              console.log(pwCheck);
                              if (pwCheck) {
                                 if (change_pw == change_pw_check) {
                                          $.ajax({
                                             async : false,
                                             type : 'POST',
                                             data : {
                                                "change_pw" : change_pw,
                                                "userindex" : userIndex
                                             },
                                             url : "${pageContext.request.contextPath}/user/mypage/PasswordChange",
                                             dataType : "json",
                                             success : function(
                                                   data) {
                                                if (data == 0) {
                                                   alert("비밀번호 변경 실패!");
                                                   
                                                } else {
                                                   alert("비밀번호 변경 성공!");
                                                   location.href='${pageContext.request.contextPath}/user/mypage/infoPage/${session_user.user_index}';
                                                }
                                             },
                                             error : function(
                                                   error) {
                                                alert("error : "
                                                      + error);
                                             }
                                          });
                                 } else {
                                    alert("비밀번호가 같지 않습니다.");
                                 }
                              }
                           }
                           ;
                        });
         });
      </script>
      <script type="text/javascript">
         function email_change() {
            if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
               document.join.email2.disabled = false;
               document.join.email2.value = "";
               document.join.email2.focus();
            } else {
               document.join.email2.disabled = true;
               document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
            }
         }
      </script>
      <script type="text/javascript">
         //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
         var idck = 0;
         $(function() {
            //idck 버튼을 클릭했을 때 
            $("#transNameBtn")
                  .click(
                        function() {
                           
                           //userid 를 param.
                           var userid = $("#transName").val();
                           reg_Exp = /^[가-힣a-zA-Z0-9]{2,8}$/;
                           NicknameResult = reg_Exp.test($(
                                 '#transName').val());
                              $.ajax({
                                    async : false,
                                    type : 'POST',
                                    data : {
                                       "userid" : userid
                                    },
                                    url : "${pageContext.request.contextPath}/user/mypage/infoTrans",
                                    dataType : "json",
                                    success : function(data) {
                                       if (data.cnt > 0) {
                                          alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                                       } else if (!NicknameResult) {
                                          alert('닉네임 형식이 올바르지 않습니다.');
                                          return false;
                                       } else {
                                          alert("사용가능한 아이디입니다.");
                                          idck = 1;
                                       }
                                    },
                                    error : function(error) {
                                       alert("error : " + error);
                                    }
                                 });
                        });
         });
      </script>

      <c:import url="/WEB-INF/views/common/_footer.jsp" />