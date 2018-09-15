<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp" >
	<c:param value="추천 강좌" name="pageTitle"/>
</c:import>

</header>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding-right: 8px">
			<div class="orderby_recomand" style="padding-bottom: 50px">
				<h4>추천 순</h4>
				<div class="row">
					<c:forEach items="${recomandedList.recomands}" var="rc">
						<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 5px;">
							<div class="thumbnail container-fluid">
								<a href="/lar/lecture/lectureDetail?lecture_index=${rc.lecture_index}"><img src="${rc.lecture_thumbnail}"></a>
								<div class="caption">
									<h4>
										<a href="/lar/lecture/lectureDetail?lecture_index=${rc.lecture_index}">											
											<c:choose>
												<c:when test="${fn:length(rc.lecture_title) > 30}">
													<p><c:out value="${fn:substring(rc.lecture_title,0,29)}"/>....</p>
												</c:when>
												<c:otherwise>
													<p><c:out value="${rc.lecture_title}"/></p>
												</c:otherwise> 
											</c:choose>
										</a>
									</h4>
									<p>
										<c:if test="${rc.lecture_price eq 0}">
											<span style="text-align: right">Free</span>
										</c:if>											
										<c:if test="${rc.lecture_price ne 0}">
											<span style="text-align: right">￦${rc.lecture_price}</span>
											<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${rc.wish_user_index eq null}">
											<a id="thumb_empty_heart" class="pull-right"><span class="glyphicon glyphicon-heart-empty" style="color:tomato"></span></a>
										</c:if>
										<c:if test="${rc.wish_user_index ne null}">
											<a id="thumb_heart" class="pull-right"><span class="glyphicon glyphicon-heart" style="color:tomato"></span></a>
										</c:if>								
										<input type="hidden" class="lecture_index" name="lecture_index" value="${rc.lecture_index}"/>			
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>	
			</div>
			<div class="orderby_review" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
				<h4>후기 순</h4>
				<div class="row">
					<c:forEach items="${recomandedList.reviews}" var="r">
						<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 5px;">
							<div class="thumbnail container-fluid">
								<a href="/lar/lecture/lectureDetail?lecture_index=${r.lecture_index}"><img src="${r.lecture_thumbnail}"></a>
								<div class="caption">
									<h4>
										<a href="/lar/lecture/lectureDetail?lecture_index=${r.lecture_index}">											
											<c:choose>
												<c:when test="${fn:length(r.lecture_title) > 30}">
													<p><c:out value="${fn:substring(r.lecture_title,0,29)}"/>....</p>
												</c:when>
												<c:otherwise>
													<p><c:out value="${r.lecture_title}"/></p>
												</c:otherwise> 
											</c:choose>
										</a>
									</h4>
									<p>
										<c:if test="${r.lecture_price eq 0}">
											<span style="text-align: right">Free</span>
										</c:if>											
										<c:if test="${r.lecture_price ne 0}">
											<span style="text-align: right">￦${r.lecture_price}</span>
											<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${r.wish_user_index eq null}">
											<a id="thumb_empty_heart" class="pull-right"><span class="glyphicon glyphicon-heart-empty" style="color:tomato"></span></a>
										</c:if>
										<c:if test="${r.wish_user_index ne null}">
											<a id="thumb_heart" class="pull-right"><span class="glyphicon glyphicon-heart" style="color:tomato"></span></a>
										</c:if>								
										<input type="hidden" class="lecture_index" name="lecture_index" value="${r.lecture_index}"/>			
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="orderby_score" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
				<h4>별점 순</h4>
				<div class="row">
					<c:forEach items="${recomandedList.score}" var="s">
						<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 5px;">
							<div class="thumbnail container-fluid">
								<a href="/lar/lecture/lectureDetail?lecture_index=${s.lecture_index}"><img src="${s.lecture_thumbnail}"></a>
								<div class="caption">
									<h4><a href="/lar/lecture/lectureDetail?lecture_index=${s.lecture_index}">										
										<c:choose>
											<c:when test="${fn:length(s.lecture_title) > 30}">
												<p><c:out value="${fn:substring(s.lecture_title,0,29)}"/>....</p>
											</c:when>
											<c:otherwise>
												<p><c:out value="${s.lecture_title}"/></p>
											</c:otherwise> 
										</c:choose>
									</a></h4>
									<p>
										<c:if test="${s.lecture_price eq 0}">
											<span style="text-align: right">Free</span>
										</c:if>											
										<c:if test="${s.lecture_price ne 0}">
											<span style="text-align: right">￦${s.lecture_price}</span>
											<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${s.wish_user_index eq null}">
											<a id="thumb_empty_heart" class="pull-right"><span class="glyphicon glyphicon-heart-empty" style="color:tomato"></span></a>
										</c:if>
										<c:if test="${s.wish_user_index ne null}">
											<a id="thumb_heart" class="pull-right"><span class="glyphicon glyphicon-heart" style="color:tomato"></span></a>
										</c:if>								
										<input type="hidden" class="lecture_index" name="lecture_index" value="${s.lecture_index}"/>			
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>	
			</div>
			<div class="orderby_students" style="border-top:1px solid lightgray; padding-top: 40px; margin-bottom: 50px">
				<h4>인기 순</h4>
				<div class="row">
					<c:forEach items="${recomandedList.hotest}" var="h">
						<div class="container col-xs-12 col-sm-6 col-md-4 col-lg-3" style="padding: 5px;">
							<div class="thumbnail container-fluid">
								<a href="/lar/lecture/lectureDetail?lecture_index=${h.lecture_index}"><img src="${h.lecture_thumbnail}"></a>
								<div class="caption">
									<h4><a href="/lar/lecture/lectureDetail?lecture_index=${h.lecture_index}">
										<c:choose>
											<c:when test="${fn:length(h.lecture_title) > 30}">
												<p><c:out value="${fn:substring(h.lecture_title,0,29)}"/>....</p>
											</c:when>
											<c:otherwise>
												<p><c:out value="${h.lecture_title}"/></p>
											</c:otherwise> 
										</c:choose>
									</a></h4>
									<p>
										<c:if test="${h.lecture_price eq 0}">
											<span style="text-align: right">Free</span>
										</c:if>											
										<c:if test="${h.lecture_price ne 0}">
											<span style="text-align: right">￦${h.lecture_price}</span>
											<a id="thumb-cart" class="pull-right"><span class="glyphicon glyphicon-shopping-cart"></span></a>&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${h.wish_user_index eq null}">
											<a id="thumb_empty_heart" class="pull-right"><span class="glyphicon glyphicon-heart-empty" style="color:tomato"></span></a>
										</c:if>
										<c:if test="${h.wish_user_index ne null}">
											<a id="thumb_heart" class="pull-right"><span class="glyphicon glyphicon-heart" style="color:tomato"></span></a>
										</c:if>								
										<input type="hidden" class="lecture_index" name="lecture_index" value="${h.lecture_index}"/>			
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>				
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp"/>