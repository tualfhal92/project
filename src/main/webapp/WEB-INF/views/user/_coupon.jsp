<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>coupon</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<style>
	th, td { text-align: center; }
	a { text-decoration: none; }
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: rightgray; text-decoration: underline;}
</style>

</head>
<body>
	<table class="table">
        <thead>
			<tr style="text-align: center">
				<th style="width: 20%;">지급일</th>
				<th style="width: 50%;">쿠폰 명</th>
				<th style="width: 15%;">할인금액</th>
				<th style="width: 15%;"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${coupon}" var="clist">
			<c:if test="${clist.USER_COUPON_USED_DATE eq null}">
			<tr>
				<td>${clist.USER_COUPON_GIVEN_DATE}</td>
				<td>${clist.COUPON_NAME}</td>
				<td>${clist.COUPON_DISCOUNT_INF}</td>
				<td><button type="button" class="btn btn-primary btn-sm use_coupon_btn" 
					onclick="script:send_to_parent('${clist.COUPON_NAME}', '${clist.COUPON_INDEX}', '${clist.USER_COUPON_INDEX}','${clist.COUPON_DISCOUNT_INF}');">사용하기</button></td>
			</tr>
			</c:if>
			</c:forEach>
        </tbody>
    </table>
    
    <script>
   		function send_to_parent(name, idx, ucidx, inf){    		    		    		
    		opener.document.getElementById('coupon').value = name;
    		opener.document.getElementById('couponidx').value = idx;
    		opener.document.getElementById('usercouponidx').value = ucidx;
    		
    		var discount = 0;
    		
    		if(inf.substring(inf.length-1, inf.length) == '%') {
    			discount = opener.document.getElementById('totalprice').textContent * (inf.substring(0,inf.length-1)/100);
    		} else {
    			discount = inf.substring(0,inf.length-1);
    		}
    		opener.document.getElementById('discount').textContent = discount;
    		opener.document.getElementById('afterdiscount').textContent = opener.document.getElementById('totalprice').textContent - discount;
    		
    		$.ajax({
    			url:'${pageContext.request.contextPath}/purchase/priceInfSecurity',
    			type:'post',
    			dataType:'text',
    			async: true,
    			data: {
    				'couponinf': inf
    			}, success : function(){
    				window.close();	
    			}
    		});   		
    	}
    </script>
	
</body>
</html>