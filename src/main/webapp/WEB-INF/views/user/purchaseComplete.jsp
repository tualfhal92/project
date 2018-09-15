<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="결제완료" name="pageTitle" />
</c:import>

</header>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10" style="margin-bottom: 50px;">
			<h1>${msg}</h1>
		</div>
		
		
<c:import url="/WEB-INF/views/common/_footer.jsp" />