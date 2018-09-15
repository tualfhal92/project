<%@page import="com.misoot.lar.common.util.UtilCommu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="장바구니" name="pageTitle" />
</c:import>
</header>


<style>
.centers {
	text-align: center;
}
tr, th {
	text-align: center;
}
th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
th {
	background-color: #0d47a1;
	color: white;
}
td {
	background-color: white;
	vertical-align: middle !important;
}
.NContent {
	font-family: Impact, Charcoal, sans-serif;
	text-transform: none;
	font-size: 14pt;
	white-space: pre-line;
}
.panel-body {
	background-color: #FAF5F5;
}
.imgCal{
	width : 100 %;
}
.imgCal{
	width : 100 %;
}
</style>

<%
	int commuTotalContents = Integer.parseInt(String.valueOf(request.getAttribute("commuTotalContents")));
	int commuNumPerPage = Integer.parseInt(String.valueOf(request.getAttribute("commuNumPerPage")));
	int qaTotalContents = Integer.parseInt(String.valueOf(request.getAttribute("qaTotalContents")));
	int qaNumPerPage = Integer.parseInt(String.valueOf(request.getAttribute("qaNumPerPage")));
	//파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
	String commucPageTemp = request.getParameter("commucPage");
	String commuSearchType = (String) request.getParameter("commuSearchType");
	String commuSearchText = (String) request.getParameter("commuSearchText");
	String qacPageTemp = request.getParameter("qacPage");
	String qaSearchType = (String) request.getParameter("qaSearchType");
	String qaSearchText = (String) request.getParameter("qaSearchText");
	String liCommu = "";
	String liqa = "";
	if (qaSearchType == null || qaSearchType == "") {
		liCommu = "active";
	} else {
		liqa = "active";
	}
	int commucPage = 1;
	int qacPage = 1;
	try {
		commucPage = Integer.parseInt(commucPageTemp);
		qacPage = Integer.parseInt(qacPageTemp);
	} catch (NumberFormatException e) {
	}
%>

<script>
	function commuValidate() {
		if ($('#commuSearchText').val().trim() == null
				|| $('#commuSearchText').val().trim() == "") {
			location.href = "${pageContext.request.contextPath}/commu/commuMain";
		}
		return true;
	}
	function qaValidate() {
		if ($('#qaSearchText').val().trim() == null
				|| $('#qaSearchText').val().trim() == "") {
			location.href = "${pageContext.request.contextPath}/commu/commuMain";
		}
		return true;
	}
	function move() {
		location.href = "${pageContext.request.contextPath}/commu/commuMain";
	}
	function testCommuModify(commu_Category_Index) {
		location.href = "${pageContext.request.contextPath}/commu/commuForm/"
				+ commu_Category_Index;
	}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="container col-lg-10 col-md-10 col-sm-10">
			<h2>게시판 목록</h2>
			<ul class="nav nav-tabs">
				<li class="<%=liCommu%>" id="commuTab"><a data-toggle="tab"
					href="#Commu">잡담게시판</a></li>
				<li id="noticeTab"><a data-toggle="tab" href="#Notice">공지사항</a></li>
				<li class="<%=liqa%>" id="qaTab"><a data-toggle="tab"
					href="#QA">질의응답</a></li>
				<li id="newsTab"><a data-toggle="tab" href="#News">소식</a></li>
			</ul>

			<div class="tab-content">
				<div id="Commu" class="tab-pane fade in <%=liCommu%>">
					<div class="container_fluid">
						<!-- Search Bar -->
						<div style="text-align: right">
							<nav class="navbar">
								<div class="container-fluid">
									<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/commu/commuMain" onsubmit="return commuValidate();">
										<div class="form-group">
											<ul class="nav">
												<li class="active">
													<select class="form-control" id="commuSearchType" name="commuSearchType">
															<option value="Ctitle">제목</option>
															<option value="Cwriter">작성자</option>
													</select>
												</li>
											</ul>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Search"
												id="commuSearchText" name="commuSearchText">
										</div>
										<button class="btn btn-default" type="submit" id="commuSearch">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</form>
								</div>
							</nav>
						</div>
						<div class="table-responsive-xl table-responsive-sm table-responsive-md table-responsive-lg">
							<table class="table tBorder table-bordered table-condensed" id="listArea" style="overflow:auto">
								<thead>
									<tr>
										<th class="col-md-1 centers">번호</th>
										<th class="col-md-5 centers">제목</th>
										<th class="col-md-2 centers">작성자</th>
										<th class="col-md-2 centers">날짜</th>
										<th class="col-md-1 centers">파일</th>
										<th class="col-md-1 centers">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commuList}" var="c">
										<tr id="${c.commu_Index}">
											<td>${c.commu_Index}</td>
											<td class="commuContent"><p style="font-size: 18px;">${c.commu_Title}</p>
												<c:forTokens items="${c.commu_tags}" var="tag" delims=",">
													<a href="${pageContext.request.contextPath}/commu/commuMain?commuSearchType=tags&commuSearchText=${tag}"
														class="bg-warning labelinput badge badge-warning"
														style="background-color: #fed136; color: #4c0b5f; font-size: 10px;">#${tag}</a>
												</c:forTokens></td>
											<td>${c.commu_Writer}</td>
											<td>${c.commu_Update_Date}</td>
											<td align="center"><c:if test="${c.fileCount>0}">
													<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file1.jpg" width=70px>
												</c:if> <c:if test="${c.fileCount==0}">
													<%-- <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/noImage.jpg" width=70px> --%>
													X
												</c:if></td>
											<td>${c.commu_Hits}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<nav style="text-align: center;">
							<%-- 페이지바를 위한 Utils의 정적메소드 사용 --%>
							<%=UtilCommu.getCommuPageBar(commuTotalContents, commucPage, commuNumPerPage, commuSearchType,
					commuSearchText, "commuMain")%>
						</nav>
							<button type="button" class="btn btn-primary pull-right" onclick="testCommuModify('B04');">글쓰기</button>
					</div>
				</div>
				<div id="Notice" class="tab-pane fade">
					<div class="container_fluid">
						<div class="panel-group" id="accordion" style="margin-top: 5px;">
							<c:forEach items="${noticeList}" var="n">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">											
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapse${n.commu_Index}"
												style="text-decoration: none;"> <strong>${n.commu_Title}</strong></a>
										</h4>
									</div>
									<div id="collapse${n.commu_Index}"
										class="panel-collapse collapse out">
										<div class="panel-body">
											<p class="NContent">${n.commu_Content }</p>
										</div>
									</div>
								</div>

							</c:forEach>
							<c:if test="${session_user.user_type eq 'admin' and session_user.user_level > 1000 }">
							<button type="button" class="btn btn-primary pull-right" onclick="testCommuModify('N01');">글쓰기</button>
							</c:if>
							
						</div>
					</div>
				</div>
				<div id="QA" class="tab-pane fade in <%=liqa%>">
					<div class="container_fluid">
						<div style="text-align: right">
							<nav class="navbar">
								<div class="container-fluid">
									<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/commu/commuMain" onsubmit="return qaValidate();" style="margin-top: 10px;">
										<div class="form-group">
											<ul class="nav">
												<li class="active">
													<select class="form-control" id="qaSearchType" name="qaSearchType">
														<option value="Ititle">제목</option>
														<option value="Iwriter">작성자</option>
													</select>
												</li>
											</ul>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Search" id="qaSearchText" name="qaSearchText">
										</div>
										<button class="btn btn-default" type="submit" id="qaSearch">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</form>
								</div>
							</nav>
						</div>
						<div class="table-responsive">
							<table class="table tBorder table-bordered table-condensed table-hover" id="listArea">
								<thead>
									<tr>
										<th class="col-md-1 centers">번호</th>
										<th class="col-md-5 centers">제목</th>
										<th class="col-md-2 centers">작성자</th>
										<th class="col-md-2 centers">날짜</th>
										<th class="col-md-1 centers">파일</th>
										<th class="col-md-1 centers">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${qalist}" var="q">
									<tr id="${q.commu_Index}">
										<td>${q.commu_Index}</td>
										<%-- <td class="qaContent"><p>${q.commu_Title}</p></td> --%>
										<td class="qaContent"><p style="font-size: 18px;">${q.commu_Title}</p>
												<c:forTokens items="${q.commu_tags}" var="tag" delims=",">
													<a href="${pageContext.request.contextPath}/commu/commuMain?qaSearchType=tags&qaSearchText=${tag}"
														class="bg-warning labelinput badge badge-warning"
														style="background-color: #fed136; color: #4c0b5f; font-size: 10px;">#${tag}</a>
												</c:forTokens></td>
										<td>${q.commu_Writer}</td>
										<td>${q.commu_Update_Date}</td>
										<td align="center">
											<c:if test="${q.fileCount>0}">
												<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file1.jpg" width=70px>
											</c:if>
											<c:if test="${q.fileCount==0}">
												<%-- <img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/noImage.jpg" width=70px> --%>
												X
											</c:if>
										</td>
										<td>${i.commu_Hits}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<nav style="text-align: center;">
							<%=UtilCommu.getqaPageBar(qaTotalContents, qacPage, qaNumPerPage, qaSearchType, qaSearchText, "commuMain")%>
						</nav>
						<button type="button" class="btn btn-primary pull-right" onclick="testCommuModify('B02');">글쓰기</button>
					</div>
				</div>
				<div id="News" class="tab-pane fade">
					<div class="container_fluid">
						<div class="row no-gutters">
							<c:set var="cnt" value="0"/>
							<c:forEach items="${newslist}" var="n" varStatus="status">
							<c:set var="cnt" value="${cnt+1}"/>
							<c:if test="${cnt%3==1}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							</c:if>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="display: flex;">
									<a class="portfolio-item" href="${pageContext.request.contextPath}/commu/commuView/${n.commu_Index}">
										<span class="caption">
											<span class="caption-content">
												<h2>${n.commu_Title }</h2>
												<p>${n.commu_Writer }</p>
											</span>
										</span>
										<c:if test="${n.commu_Attach_Renamedfilename ne ''}">
										
										</c:if>
										<img class="img-fluid imgCal" src="${pageContext.request.contextPath}/resources/uploadFiles/commu/${n.commu_Attach_Renamedfilename}" style="width: 100%;" />
									</a>
								</div>
							<c:if test="${cnt%3==0||status.last}">
							</div>
							</c:if>
							</c:forEach>
						</div>
						<button type="button" class="btn btn-primary pull-right" onclick="testCommuModify('B03');">글쓰기</button>
					</div>
				</div>
			</div>
		</div>

		<script>
				$(function() {
					$('.commuContent p')
							.mouseenter(function() {
								$(this).css({
									"cursor" : "pointer"
								});
							})
							.click(
									function() {
										var index = $(this).parent().parent().attr('id');
										location.href = "${pageContext.request.contextPath}/commu/commuView/"
												+ index;
									});
					$('.qaContent p')
							.mouseenter(function() {
								$(this).css({
									"cursor" : "pointer"
								});
							})
							.click(
									function() {
										var index = $(this).parent().parent().attr('id');
										location.href = "${pageContext.request.contextPath}/commu/commuView/"
												+ index;
									});
				});
			</script>
		<c:import url="/WEB-INF/views/common/_footer.jsp" />