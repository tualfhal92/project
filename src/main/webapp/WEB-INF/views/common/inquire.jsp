<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="${pageContext.request.contextPath}/resources/css/chat.css" rel="stylesheet">
<script   src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<style>

</style>

<div class="quest" style="z-index: 1000;">
   <p>문의하기</p>
</div>

<div class="chat_container">
   <div class="row chat-window col-xs-9 col-sm-8 col-md-7 col-lg-6" id="chat_window_1"   style="margin-left: 10px;">
      <div class="col-xs-12 col-md-12">
         <div class="panel panel-default">
            <div class="panel-heading top-bar">
               <div class="col-md-8 col-xs-8">
                  <h3 class="panel-title">
                     <span class="glyphicon glyphicon-comment"></span> 1:1 문의
                  </h3>
               </div>
               <div class="col-md-4 col-xs-4" style="text-align: right;">
                  <span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"style="cursor: pointer;"></span>
                  <span class="glyphicon glyphicon-remove icon_close"   data-id="chat_window_1" style="cursor: pointer;"></span>
               </div>
            </div>
            <div class="panel-body msg_container_base">
               <div class="row msg_container base_receive">
                  <div class="col-md-2 col-xs-2 avatar">
                     <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
                        class=" img-responsive ">
                  </div>
                  <div class="col-xs-10 col-md-10">
                     <div class="messages msg_receive">
                        <p>Ask if you don't know in LAR.</p>
                        <time datetime="2009-11-13T20:00">LAR</time>
                     </div>
                  </div>
               </div>
               
            </div>
            <div class="panel-footer">
               <div style="display: table; border-collapse: separate;">
                  <textarea id="chat-area" class="form-control input-sm chat_input" placeholder="Write your message here..." style="resize: none;" rows="5"></textarea>
                  <span class="input-group-btn" style="padding-left: 20px;">
                     <button class="btn btn-primary btn-sm" id="btn-chat" style="border-radius: 5px; background-color: #337ab7; border-color: #2e6da4;">Send</button>
                  </span>
               </div>
               <div class="filebox bs3-primary preview-image" style="text-align: right;">
                  <input type="text" id="upload-name" class="upload-name" value="파일선택" readonly="readonly" style="width: 200px;">
                  <label for="input_file">업로드</label>
                  <input type="file" id="input_file" name="input_file" class="upload-hidden">
               </div>
            </div>
         </div>
      </div>
   </div>

</div>
<script>
   var s;       // Socket
   var stompClient = null;
   var c;      // confirm
   var r;      // receiver
   var ext=null;   // extension
   var f;      // renamedfileName
   
   if('${session_user.user_level}'=='1001'){   
      $('.quest p').text("문의확인");
      $('.panel-footer').css('display', 'none');
      $('.preview-image').css('display', 'none');
      }

   $('.quest').on('click', function() {
      if ('${session_user}' == '' || '${session_user}' == null) {
         c = confirm("로그인 후에 이용 가능한 메뉴입니다. 로그인 하시겠습니까?");
         if (c == true) {
            $('.dynamicModal').modal('show');
            getModal('signin');
         } else   return;
      } else {
         if ($(this).css('display') != 'none') {
            $(this).css('display', 'none');
            $('.chat_container').css({
               'display' : 'block',
               'bottom' : '30px'});
         }
         if(s==null) connect();
      }
   });

   $('.icon_close').on('click', function() {
      if ($('.chat_container').css('display') != 'none') {
         $('.chat_container').css('display', 'none');
         $('.quest').css('display', 'block');
      }
   });

   $("#btn-chat").on("click", function() {
      if($('#upload-name').val()!='파일선택') {
           if(ext=="jpg"||ext=="JPG"||ext=="png"||ext=="PNG"||ext=="gif"||ext=="GIF")   {
              sendMsg();
               $('#chat-area').val(null);
               fileUpload();
               $('.upload-thumb-wrap').remove();
           } else {
                 alert("이미지 파일(jpg, png, gif)만 업로드 가능합니다.");
           }
       } else {
           if(ext==""||ext==null) {
               sendMsg();
               $('#chat-area').val(null);
            } 
        }
      
      $('.upload-name').val('파일선택');
      
      /* var check = confirm('Are you Server?');       */
   });

   
   // ctrl+Enter or shift+enter => enter & press enter => send message
   $('#chat-area').keydown(function(e) {
      if (e.keyCode == 13) {         
         if (e.ctrlKey)  $(this).val(function(i, val) {return val + "\n";});
         else if (e.shiftKey) return $(this).val();
         else {
            if($('#upload-name').val()!='파일선택') {
                 if(ext=="jpg"||ext=="JPG"||ext=="png"||ext=="PNG"||ext=="gif"||ext=="GIF")   {
                    sendMsg();
                     $('#chat-area').val(null);
                     fileUpload();
                     $('.upload-thumb-wrap').remove();
                 } else {
                       alert("이미지 파일(jpg, png, gif)만 업로드 가능합니다.");
                 }
             } else {
                 if(ext==""||ext==null) {
                     sendMsg();
                     $('#chat-area').val(null);
                  } 
              }
            
            $('.upload-name').val('파일선택');
            return false;
         }
      }
   });

   // socket 연결
   function connect() {
      s = new SockJS('/lar/inquire');
      stompClient = Stomp.over(s);
      stompClient.connect({}, function(frame) {
         console.log('Connected: ' + frame);
         stompClient.subscribe('/topic/greetings', function(msg) {
            showGreeting(JSON.parse(msg.body));
            });
         
      if('${session_user.user_level}'=='1001'){
         $.ajax({
            type : "POST",
            dataType : "json",
            url : "${pageContext.request.contextPath}/inquireAllView",
            success : function(data){       // for Admin
               $.each(data, function(i, v) {
                  var $msg_container_base = $('.msg_container_base');
                  var $inquire_container = $('<div class="inquire_container" style="margin-bottom: 20px;">');
                  var $base_sent = $('<div class="row msg_container base_sent">');
                  var $base_receive = $('<div class="row msg_container base_receive">');
                  var $col = $('<div class="col-xs-10 col-md-10">');
                  var $message = $('<div class="messages msg_sent" style="word-wrap: break-word; white-space:pre-line;">');
                  var $pre = $('<span style="word-wrap: break-word; white-space:pre-line;">');
                  var $timeData = $('<time>');
                  var $avatar = $('<div class="col-md-2 col-xs-2 avatar">');
                  var $img = $('<img class="img-responsive">');
                  var $div = $('<div class="inquire_option">');
                  
                  if('${session_user.user_index}'!= v.INQUIRE_SENDER_INDEX){
                  if(v.USER_THUMBNAIL==null || v.USER_THUMBNAIL== ''){
                     $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
                  }   else{
                     $img.attr('src', "${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/"+v.USER_THUMBNAIL);
                  }
                  $base_sent.append(
                        $col.append($message.append($pre.text(v.INQUIRE_CONTENT))
                              .append($timeData.text(v.INQUIRE_SENDER_INDEX + " : "+ new Date(v.INQUIRE_SENDDATE).toLocaleString())
                                    ))).append($avatar.append($img));
                  if(v.INQUIRE_ATTACH_ORIGINFILENAME==null) v.INQUIRE_ATTACH_ORIGINFILENAME="";
                  $div.html('<div style="display: block; color: skyblue;"><span style="float: left;" onclick="imgConfirm(\''+v.INQUIRE_ATTACH_RENAMEDFILENAME+'\');" data-toggle="modal" data-target="#imgConfirm">'+v.INQUIRE_ATTACH_ORIGINFILENAME+'</span><span style="float: right;" onclick="reply('+v.INQUIRE_SENDER_INDEX+')">답신</span></div>');
                  
                  $msg_container_base.append($inquire_container.append($base_sent).append($div));
                  }   else{
                     $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
                     
                     $base_receive.append(
                           $avatar.append($img)).append(
                                 $col.append(
                                       $message.append(
                                             $pre.text(v.INQUIRE_CONTENT)).append(
                                                   $timeData.text("LAR : "+ new Date(v.INQUIRE_SENDDATE).toLocaleString()))
                                       ));
                     $msg_container_base.append($inquire_container.append($base_receive));
                  }
                  scrollDown();
                  
               });
            }, error : function(data){
               console.log("Load list error");
            }
         });
      }      else{      // for user
         $.ajax({
         type : "POST",
         dataType : "json",
         url : "${pageContext.request.contextPath}/inquireUserView",
         data : { user : '${session_user.user_index}'},
         success : function(data){
            $.each(data, function(i, v) {
               var $msg_container_base = $('.msg_container_base');
               var $inquire_container = $('<div class="inquire_container" style="margin-bottom: 20px;">');
               var $base_sent = $('<div class="row msg_container base_sent">');
               var $base_receive = $('<div class="row msg_container base_receive">');
               var $col = $('<div class="col-xs-10 col-md-10">');
               var $message = $('<div class="messages msg_sent" style="word-wrap: break-word; white-space:pre-line;">');
               var $pre = $('<span style="word-wrap: break-word; white-space:pre-line;">');
               var $timeData = $('<time>');
               var $avatar = $('<div class="col-md-2 col-xs-2 avatar">');
               var $img = $('<img class="img-responsive">');
               var $div = $('<div class="inquire_option">');
               
                  if('${session_user.user_level}'!='1001' && v.INQUIRE_SENDER_INDEX =='${session_user.user_index}'){
                     if('${session_user.user_thumbnail}'==null || '${session_user.user_thumbnail}'== ''){
                        $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
                     }   else{
                        $img.attr('src', "${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${session_user.user_thumbnail}");
                     }
               $base_sent.append(
                     $col.append($message.append($pre.text(v.INQUIRE_CONTENT))
                           .append($timeData.text("${session_user.user_id}" + " : "+ new Date(v.INQUIRE_SENDDATE).toLocaleString())
                                 ))).append($avatar.append($img));

               if(v.INQUIRE_ATTACH_ORIGINFILENAME==null) v.INQUIRE_ATTACH_ORIGINFILENAME="";
               
               $div.html('<div style="display: block;  color: skyblue;"><span style="float: left;" onclick="imgConfirm(\''+v.INQUIRE_ATTACH_RENAMEDFILENAME+'\');" data-toggle="modal" data-target="#imgConfirm">'+v.INQUIRE_ATTACH_ORIGINFILENAME+'</span><span style="float: right;" onclick="deleteContent('+v.INQUIRE_NO+')">삭제</span></div>');
               
               $msg_container_base.append($inquire_container.append($base_sent).append($div));
               }   else {
                  $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
                  $base_receive.append(
                        $avatar.append($img)).append(
                              $col.append(
                                    $message.append(
                                          $pre.text(v.INQUIRE_CONTENT)).append(
                                                $timeData.text("LAR : "+ new Date(v.INQUIRE_SENDDATE).toLocaleString()))
                                    ));
                  $msg_container_base.append($inquire_container.append($base_receive));
               }
               scrollDown();
               
            });
         },   error : function(data){   console.log("에러입니다");   }
         
            });
         }
      });
   }

   function scrollDown() {      $('.msg_container_base').scrollTop($('.msg_container_base').prop('scrollHeight'));}

   // 메시지 전송
   function sendMsg() {
         if ($('#chat-area').val() != null && $('#chat-area').val().trim() != ''){
            if('${session_user.user_level}'!='1001'){       // user send
               if($('.upload-name').val()=="파일선택") $('.upload-name').val('');
            stompClient.send("/app/question", {}, JSON.stringify({
               'inquire_sender_index' : '${session_user.user_index}',
               'inquire_content' : $('#chat-area').val(),
               'inquire_attach_originfilename' : $('.upload-name').val(),
               'user_level' : '${session_user.user_level}',
               'user_thumbnail' : '${session_user.user_thumbnail}'
            }));
   
            }   else{                             // admin send
               stompClient.send("/app/question", {}, JSON.stringify({
                  'inquire_sender_index' : '${session_user.user_index}',
                  'inquire_receiver_index' : r,
                  'inquire_content' : $('#chat-area').val(),
                  'user_level' : '${session_user.user_level}'
               }));
               $('.panel-footer').css('display', 'none');
               $('.panel-title').text('1:1 문의');
               }
            }   else   alert("내용을 입력해주세요.");
         
      }


   // 보낸 메시지 화면 output
   function showGreeting(data) {
      var $msg_container_base = $('.msg_container_base');
      var $inquire_container = $('<div class="inquire_container" style="margin-bottom: 20px;">');
      var $base_sent = $('<div class="row msg_container base_sent">');
      var $base_receive = $('<div class="row msg_container base_receive">');
      var $col = $('<div class="col-xs-10 col-md-10">');
      var $message = $('<div class="messages msg_sent" style="word-wrap: break-word; white-space:pre-line;">');
      var $pre = $('<span style="word-wrap: break-word; white-space:pre-line;">');
      var $timeData = $('<time>');
      var $avatar = $('<div class="col-md-2 col-xs-2 avatar">');
      var $img = $('<img class="img-responsive">');
      var date = new Date(data.msg.inquire_sendDate).toLocaleString();
      var $div = $('<div class="inquire_option">');
   
      if(data.msg.inquire_sender_index=='${session_user.user_index}' && '${session_user.user_level}'!='1001'){   // user realtime View
         if('${session_user.user_thumbnail}'==null || '${session_user.user_thumbnail}'== ''){
            $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
         }   else{
            $img.attr('src', "${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/${session_user.user_thumbnail}");}
         
      $base_sent.append(
            $col.append($message.append($pre.text(data.msg.inquire_content))
                  .append($timeData.text("${session_user.user_id}" + " : "+ date)
                        ))).append($avatar.append($img));
      
      if(data.msg.inquire_attach_originfilename==null || data.msg.inquire_attach_originfilename=='파일선택') data.msg.inquire_attach_originfilename="";
      $div.html('<div style="display: inline; color: skyblue;"><span style="float: left;" onclick="imgConfirm(\''+f+'\');" data-toggle="modal" data-target="#imgConfirm">'+data.msg.inquire_attach_originfilename+'</span><span style="float: right;" onclick="deleteContent('+data.msg.inquire_no+')">삭제</span></div>');
      /* $inquire_container.append($base_sent).append($div); */
      $msg_container_base.append($inquire_container.append($base_sent).append($div));
      }   else if (data.msg.inquire_receiver_index=='${session_user.user_index}'){
         $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
         $base_receive.append(
               $avatar.append($img)).append(
                     $col.append(
                           $message.append(
                                 $pre.text(data.msg.inquire_content)).append(
                                       $timeData.text("LAR : "+date))));
         $msg_container_base.append($inquire_container.append($base_receive));
      }   else if('${session_user.user_level}'=='1001' && data.msg.inquire_sender_index!='${session_user.user_index}'){
         if(data.user_thumbnail=="" || data.user_thumbnail==null){
            $img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");
         }   else{
            $img.attr('src', "${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/"+data.user_thumbnail);
         }
         $base_sent.append(
               $col.append($message.append($pre.text(data.msg.inquire_content))
                     .append($timeData.text(data.msg.inquire_sender_index + " : "+ new Date(data.msg.inquire_sendDate).toLocaleString())
                           ))).append($avatar.append($img));
         if(data.msg.inquire_attach_originfilename==null || data.msg.inquire_attach_originfilename=='파일선택') data.msg.inquire_attach_originfilename="";
         $div.html('<div style="display: block; color: skyblue;"><span style="float: left;" onclick="imgConfirm(\''+f+'\');" data-toggle="modal" data-target="#imgConfirm">'+data.msg.inquire_attach_originfilename+'</span><span style="float: right;" onclick="reply('+data.msg.inquire_sender_index+')">답신</span></div>');
         
         $msg_container_base.append($inquire_container.append($base_sent).append($div));
         
      }   else if('${session_user.user_level}'=='1001' && data.msg.inquire_sender_index=='${session_user.user_index}'){
         if(data.user_thumbnail=="" || data.user_thumbnail==null){$img.attr('src', "http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg");}
         else {$img.attr('src', "${pageContext.request.contextPath}/resources/uploadFiles/userthumbnail/"+data.user_thumbnail);}
         $base_receive.append(
               $avatar.append($img)).append(
                     $col.append(
                           $message.append(
                                 $pre.text(data.msg.inquire_content)).append(
                                       $timeData.text("LAR : "+date))));
         $msg_container_base.append($inquire_container.append($base_receive));
      }
      scrollDown();
      
      // $("#greetings").append("<tr><td>" + data.sender+" : "+ data.content + " | " + new Date(data.sendDate).toLocaleString() + "</td></tr>");
   }
   
   // cursur css pointer
   $(document).on("mouseenter", '.inquire_option span', function(){   $(this).css('cursor', 'pointer');});
   
   function deleteContent(num){
      c = confirm("정말 삭제하시겠습니까?");
      if(c==true){
         $(document).on("click",".inquire_option span:last-child",function() {
            $(this).parents('.inquire_container').remove();
         });
         $.ajax({
            type : "POST",
            dataType : "json",
            url : "${pageContext.request.contextPath}/inquireDelete",
            data : { no : num },
            success : function(data){
                  console.log("SUCCESS");
            }, error : function(data){
               console.log("ERROR");
            }
         });
      }      else return;
      
   }
   
   function reply(num){
      $('.panel-footer').css('display', 'block');
      $('.panel-title').text("1:1 문의(To.유저 번호 : "+num+")");
      r=num;
   }
   
   $(document).on('click', '.panel-heading span.icon_minim', function(e) {
      var $this = $(this);
      if (!$this.hasClass('panel-collapsed')) {
         $this.parents('.panel').find('.panel-body').slideUp();
         $this.addClass('panel-collapsed');
         $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
      } else {
         $this.parents('.panel').find('.panel-body').slideDown();
         $this.removeClass('panel-collapsed');
         $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
      }
   });

   $(document).on('focus','.panel-footer input.chat_input',function(e) {
      var $this = $(this);
      if ($('#minim_chat_window').hasClass('panel-collapsed')) {
         $this.parents('.panel').find('.panel-body').slideDown();
         $('#minim_chat_window').removeClass('panel-collapsed');
         $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
      }
   });
   
   function fileUpload(){      /* fileUpload Function */
      var file = new FormData();
      console.log($('#input_file')[0].files[0]);
      
      /* file.append("inputfile", $('#input_file').prop('files')[0]); */
      file.append('input_file', $('#input_file')[0].files[0]);
   $.ajax({
      type : "POST",
      url : "${pageContext.request.contextPath}/inquireAttachment",
      data : file,
      processData: false,
        contentType: false,
        async : false,
      success : function(data){
         console.log(data.renamedFileName);
         f=data.renamedFileName;
         if(data.result == 1){
            console.log("file upload success");
/*             $('.upload-name').val('파일선택');
            $('.upload-thumb-wrap').remove(); */
         } else {
            console.log("Send the file is success, but return value is 0");
         }
      }, error : function(data){
         console.log(data);
         console.log("file upload fail");
      }
   });

   }
   
   function imgConfirm(fileName){
      $('#inquireAttachment').attr('src', '${pageContext.request.contextPath}/resources/uploadFiles/inquire/'+fileName);
   }
   
   
   /* file upload  */
   
      var fileTarget = $('.filebox .upload-hidden');

      fileTarget.on('change', function() {
         if (window.FileReader) {
         // 파일명 추출
         var filename = $(this)[0].files[0].name;
         } else {
         // Old IE 파일명 추출
         var filename = $(this).val().split('/').pop().split('\\').pop();
         };

         $('.upload-name').val(filename);
         
         ext = $('.upload-name').val().split(".")[1];         
      });
   
      //preview image 
      var imgTarget = $('.preview-image .upload-hidden');

      imgTarget.on('change', function() {
      var parent = $(this).parent();
      
      parent.children('.upload-display').remove();

      if (window.FileReader) {
      //image 파일만
      if (!$(this)[0].files[0].type.match(/image\//))
         return;

      var reader = new FileReader();
      reader.onload = function(e) {
      var src = e.target.result;

      parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
      }
      reader.readAsDataURL($(this)[0].files[0]);
      } else {

         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

         var img = $(this).siblings('.upload-display').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc + "\")";
      }
   });
</script>

<div class="modal fade" id="imgConfirm" role="dialog">
   <div class="modal-dialog" style="margin: 0 0 0 0;">
         <div class="modal-body">
            <img src="" id="inquireAttachment" style="width: 180%; height: 120%">
         </div>
   </div>
</div>



