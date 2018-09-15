<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- "_header.jsp" include the div[class=wrapper] tag start point. -->
<!-- page title, LAR : ${pageTitle} -->
<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="asdf" name="pageTitle" />
</c:import>

<!-- !important. header tag have margin! please don't delete -->
</header>


<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-10 col-sm-10">
			<!-- 
				this is left area. with out advertising area. 
				if you wanna add like section, use to div[class=row]
			-->
			<div class="row">
				<!-- like this. -->
			</div>

			<!-- 
			<div class="row">
			
			</div>
			-->
		</div> <!-- end div[class=col-md-10 col-sm-10] : left area end -->
<!-- "_footer.jsp" include the advertising area. -->
<c:import url="/WEB-INF/views/common/_footer.jsp" />