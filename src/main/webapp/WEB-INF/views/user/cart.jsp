<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="장바구니" name="pageTitle" />
</c:import>

</header>

<script>
	function btn_click(btn){
		if(btn == 'delete') {
			cartfm.action = "/lar/user/deleteCart";
		} else if(btn == 'select') {
			var checkarr = $('input[type=checkbox]');
			var checknum = 0;
			
			for(var i = 0; i < checkarr.length; i++) {
				if(checkarr[i].checked == true) checknum ++;
			}
			
			if(checknum == 0) {
				alert("선택된 영역이 존재하지 않습니다.");
			} else {
				cartfm.action = "/lar/user/purchase";
			}						
		} else if(btn == 'selectAll'){
			$('input[type=checkbox]').prop('checked',true);
			cartfm.action = "/lar/user/purchase";
		}
	}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10">
			<h3>장바구니</h3>
			<div class="cartList">
				<form name="cartfm" method="POST">
					<table class="table">
						<tr>
							<th></th>
							<th>강의정보</th>
							<th>가격</th>
						</tr>
						<c:set var="lecTotal" value="0" />
						<c:forEach items="${lecList}" var="l">
							<tr>
								<td class="deleteCkbox">
									<div class="ckbox">
										<input type="checkbox" class="CheckBox" id="checkbox${l.LECTURE_INDEX}" name="radio" value="${l.LECTURE_INDEX}"> 
										<label for="checkbox${l.LECTURE_INDEX}"></label>
									</div>
								</td>
								<td>
									<div class="media">
										<a href="/lar/lecture/lectureDetail?lecture_index=${l.LECTURE_INDEX}" class="pull-left"> 
											<img src="${l.LECTURE_THUMBNAIL}" class="media-photo" style="width:150px;">
										</a>
										<div class="media-body">
											<h4 class="title"><a href="/lar/lecture/lectureDetail?lecture_index=${l.LECTURE_INDEX}">${l.LECTURE_TITLE}</a></h4>
											<c:choose>
												<c:when test="${fn:length(l.LECTURE_INTRO) > 50}">
													<p><c:out value="${fn:substring(l.LECTURE_INTRO,0,49)}"/>....</p>
												</c:when>
												<c:otherwise>
													<p><c:out value="${l.LECTURE_INTRO}"/></p>
												</c:otherwise> 
											</c:choose>	
											<span>
												<i class="glyphicon glyphicon-star"></i> 
												<i class="glyphicon glyphicon-star"></i> 
												<i class="glyphicon glyphicon-star"></i> 
												<i class="glyphicon glyphicon-star"></i> 
												<i class="glyphicon glyphicon-star"></i>
											</span>
										</div>
									</div>
								</td>
								<td>${l.LECTURE_PRICE}</td>
							</tr>
							<c:set var="lecTotal" value="${lecTotal+l.LECTURE_PRICE}" />
						</c:forEach>

						<tr>
							<th colspan="2">총 금액</th>
							<th style="text-align: right;">${lecTotal} 원</th>
						</tr>
					</table>
					<div class="pull-right">
						<button type="submit" class="btn btn-danger deleteCartList" onclick="btn_click('delete')" style="border: none">
							<span class="glyphicon glyphicon-trash"></span>선택삭제
						</button>
						<button type="submit" class="btn btn-success selectPurchase" onclick="btn_click('select')" style="border: none;">
							<span class="glyphicon glyphicon-ok"></span>선택결제
						</button>
						<button type="submit" class="btn btn-success allPurchase" onclick="btn_click('selectAll')" style="border: none;">
							<span class="glyphicon glyphicon-ok"></span>모두결제
						</button>
					</div>
				</form>
				<br><br>
			</div>
		</div>

		<c:import url="/WEB-INF/views/common/_footer.jsp" />