$(document).ready(function() {
	
	if (window.matchMedia("(min-width: 768px)").matches) {
		$('#lecture-dropdown').attr('data-toggle', '');
		$('.mega-dropdown .caret').css('display', 'none');
		$('.mega-dropdown').removeClass('open');
		
	} else {
		$('#lecture-dropdown').attr('data-toggle', 'dropdown');
		$('.mega-dropdown .caret').css('display', '');
		$('.mega-dropdown').addClass('open');
	
	}
	
	$(window).resize(function() {
		if (window.matchMedia("(min-width: 768px)").matches) {
			$('#lecture-dropdown').attr('data-toggle', '');
			$('.mega-dropdown .caret').css('display', 'none');
			$('.mega-dropdown').removeClass('open');
			
		} else {
			$('#lecture-dropdown').attr('data-toggle', 'dropdown');
			$('.mega-dropdown .caret').css('display', '');
			$('.mega-dropdown').addClass('open');
			
		}
	});
	
	// reset tab info
	$(document).on('click','.resetTab',function(){
		localStorage['tab'] = 0;
		localStorage['panel'] = 0;
	});
	
	//home.jsp
	$(document).on('click','#thumb_empty_heart', function(){
		$.ajax({
			url : "/lar/user/mypage/inputWishList/"+$(this).siblings('input[name=lecture_index]').val(),
			success : function(result) {
				alert("위시리스트에 추가되었습니다 !");
				location.reload();
			}, error : function(error) {
				if (error.status == 400)
					alert("로그인 후에 이용하세요!");
			}
		});
	});
	
	$(document).on('click','#thumb_heart', function(){
		$.ajax({
			url : "/lar/user/mypage/deleteWishList/"+$(this).siblings('input[name=lecture_index]').val(),
			success : function(result) {
				alert("위시리스트에서 삭제되었습니다 !");
				location.reload();
			}, error : function(error) {
				if (error.status == 400)
					alert("로그인 후에 이용하세요!");
			}
		});
	});
	
	$(document).on('click','#thumb-cart', function(){
		var lecture_index =  $(this).siblings('input[name=lecture_index]').val();
		var txt;
	    var r = confirm("장바구니에 담으시겠습니까 ?");
	    if (r == true) {
	    	$.ajax({
				url : "/lar/user/mypage/checkcart/" + lecture_index,
				success : function(result) {
					if(result > 0) {
						alert("장바구니에 이미 존재하는 강의입니다 !");
					} else {
						$.ajax({
							url : "/lar/user/mypage/addTocart/" + lecture_index,
							success : function(result) {
								alert("장바구에 추가 되었습니다 !");
								location.reload();
							}
						});						
					}
				}, error : function(error) {
					if (error.status == 400)
						alert("로그인 후에 이용하세요!");
				}
			}); 
	    }
	});
	// mypage.jsp
	$(document).on('click', '.cancel_lecture', function(){
		var lecture_index =  $(this).siblings('#lecture_index').val();
		var r = confirm("수강을 취소하시겠습니까 ?");
	    if (r == true) {
	    	$.ajax({
				url : "/lar/user/mypage/cancel_lecture/" + lecture_index,
				success : function(result) {
					alert("삭제되었습니다 !");
					location.reload();
				}, error : function(error) {
					if (error.status == 400)
						alert("로그인 후에 이용하세요!");
				}
			}); 
	    }
	});
	
	$('.star').on('click', function() {
		$(this).toggleClass('star-checked');
	});

	$('.ckbox label').on('click', function() {
		$(this).parent('tr').toggleClass('selected');
	});

	$(".myTab a").click(function(e) {
		e.preventDefault();
		$(this).tab("show");
	});
	
	$('.deleteWishList').on('click', function() {
		$('.deleteCkbox').css('display', '');
		$('.deleteWishList').css('display', 'none');
		$('.cancelDeleteWishList').css('display', '');
	});
			
	$('.cancelDeleteWishList').on('click', function() {
		$('.deleteCkbox').css('display', 'none');
		$('.deleteWishList').css('display', '');
		$('.cancelDeleteWishList').css('display', 'none');
	});
	
	//dk
	// lecture.jsp
	 $(".lectureView2").on("click", function(){
       var bindex =$(this).siblings(".my_boardLecture_index").val();
       var index =$(this).siblings(".my_lecture_index").val();


       window.open('about:blank').location.href = "/lar/lectureBoardView?index="+index+"&bindex="+bindex;
	 });
	 
	 $(".lectureView").on("click", function(){
	       var bindex =$(this).siblings(".my_boardLecture_index").val();
	       var index =$(this).siblings(".my_lecture_index").val();


	      location.href = "/lar/lectureBoardView?index="+index+"&bindex="+bindex;
	 });
	 
	 $("#lectureInsert").on("click", function(){
		 location.href = "/lar/lectureInsert";
	 });
    
	 $("#lectureBoardInsert").on("click", function(){
		 var index = $('#my_lecture_index').val();
		 location.href = "/lar/lectureBoardInsert?index="+index;
	 });
    
	 $(".lecturedelete").on('click', function(){
		 var index = $(this).siblings('.index').val();
		 location.href = "/lar/lectureDelete?index="+index;
	 });
	 
	 $(".lectureUpdate").on("click", function(){
		 var index = $(this).parent().siblings('.col-md-6').children('.index').val();
		 location.href = "/lar/lectureUpdate?index="+index;
	 });
	 
	 $(".lectureBoardUpdate").on("click",function(){
		 var bindex = $(this).siblings('.my_boardLecture_index').val();
		 var index = $(this).siblings('.my_lecture_index').val(); 
		 location.href = "/lar/lectureBoardUpdate?index="+index+"&bindex="+bindex;
		 
	 });
	 
	 $(".lectureBoardDelete").on("click",function(){
		 var bindex = $(this).siblings('.lecture_board_index').val();
		 var index = $(this).siblings('.my_lecture_index').val();
		 location.href = "/lar/lectureBoardDelete?index="+index+"&bindex="+bindex;
	 });
	 
	 $(".deleteReview").on("click",function(){
		 var rindex =$("#orgin").children().find('#lecture_review_index').val();
		 var index =$("#orgin").children('#lecture_review_lecture_index').val();
		 location.href = "/lar/deleteReview?index="+index+"&rindex="+rindex;
	 });
	 
	 $(document).on('click','#applyLecture',function(){
		 var price =$("#lecturePrice").text();
		 var index =$(this).siblings('#lecture_index_applyLecture').val();
		 var user_index = $("#user_index").val();
		 
		 price = price.trim();
		 
		 if(price == 'Free' || price == null){
		    var r = confirm("수강 신청을 하시겠습니까?");
		    if (r == true) {		    	
			   	 $.ajax({
					 url : "/lar/updateHistory?index="+index+"&user_index="+user_index,
					 success: function(result){
						 alert("수강신청 완료");
						 location.reload();
					 },error :function(error){
						 if(error.status == 400)
							 alert("로그인 후에 이용하세요!");
					 }
			   	 });
		    } 
		}
		 else {
		    	var j  = confirm("강의 신청을 위해 장바구니 페이지로 이동하겠습니까?");
			
		    	if( j== true){
					$.ajax({
						url : "/lar/user/mypage/checkcart/" + index,
						success : function(result) {
							if(result > 0) {
								alert("장바구니에 이미 존재하는 강의입니다 !");
							} else {
								$.ajax({
									url : "/lar/user/mypage/addTocart/" + index,
									success : function(result) {
										location.href="/lar/user/cart"; 
									}
								});						
							}
						}, error : function(error) {
							if (error.status == 400)
								alert("로그인 후에 이용하세요!");
						}
					}); 
		 } }});
	 
	 $(document).on('click','#applyLectureCancel',function(){
		 var price =$("#lecturePrice").text();
		 var lecture_index =$("#orgin").children('#lecture_review_lecture_index').val();
		/* var user_index = $("#user_index").val();*/
		 var bindex = $(".my_boardLecture_index").eq(1).val();
		 price = price.trim();
		 
		 if(price=='Free' || price == null){
		    var r = confirm("강의를 취소하시겠습니까?");
		 }else{
			 confirm("강의 취소를 위해 이동합니다");
		 } 
		    if (r == true) {
		    	
		   	 $.ajax({
				 url : "/lar/deleteHistory/"+lecture_index,
				 success: function(result){
					 alert("수강 취소 완료");
					 location.reload();
				 },error :function(error){
					 if(error.status == 400)
						 alert("로그인 후에 이용하세요!");
				 }
		   	 });
		       
		    } else {
		    	console.log("cancel");
		    }
	 });
	 $(document).on('click','.checkBoardHistory',function(){
		 	var bindex = $(this).siblings('.my_boardLecture_index').val();
		 	var index = $(this).siblings('.my_lecture_index').val(); 
	
		 	
		 	var thiss = $(this);
		 
		    var r = confirm("동영상을 다보셨나요?");
		   
		    if (r == true) {
		    	
		    $.ajax({
				 url : "/lar/updateBoardHistory/"+index+"/"+bindex,
				 async: false,
				 success: function(result){
					 thiss.html('clear');
				 location.reload();
				 },error :function(error){
					 if(error.status == 400)
						 alert("로그인 후에 이용하세요!");
				 }
		   	 });
		       
		    } else {
		    	alert("좀더 분발하세요!");
		    }
	 });	 
	 
});