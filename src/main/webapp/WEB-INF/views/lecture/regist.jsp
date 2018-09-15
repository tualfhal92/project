<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/views/common/_header.jsp">
	<c:param value="강의등록 신청" name="pageTitle" />
</c:import>
<link href="${pageContext.request.contextPath}/resources/css/one-page-wonder.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"	rel="stylesheet">
</header>

<header style="margin-top:-55px; margin-bottom:0px; border:0;">
	<div class="jumbotron" style="width: 100%; padding-top: 200px; padding-bottom: 75px; background-image: url('/lar/resources/images/knowledge_sharing_02.jpg');">
		<div class="container">
			<h1 style="color: purple;">LAR</h1>
			<p>
				<a class="btn btn-primary btn-lg" href="https://goo.gl/forms/ZUlXON1NAg14vUFi2" role="button" target="_blank">강의 등록 신청</a>
			</p>
		</div>
	</div>
</header>

<div class="container">
	<div class="row">
		<div class="align-items-center col-lg-10 col-md-10 col-sm-10">
			<div class="row">
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="/lar/resources/images/lecture_icon.jpg" alt="강좌">
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<h2 class="display-4">어떠한 비용없이 자신만의 온라인 강좌 개설</h2>
						<p>온라인 강좌 플랫폼을 소유하는 것은 꽤나 어려운 일입니다.
						 플랫폼 구축, 온라인결제 등 초기비용 뿐 아니라 관리, 유지에 많은 노력이 필요합니다. 또한 홍보, 활성화에도 많은 어려움이 뒤따릅니다.
						 LAR에선 초기 구축, 마케팅, 유지 비용없이 자신만의 온라인 강좌를 개설할 수 있습니다!
						개인이 마련하기 힘든 인프라는 LAR에서 도와드립니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-sm-5">
				<div class="p-5">
					<h2 class="display-4">실제적인 수익에<br> 사회적 가치</h2>
					<p>LAR에서 지식 콘텐츠가 사회적, 경제적 의미를 모두 가지세요.
						 자신의 지식으로 수천만원의 수익을 올리면서도, 많은 사람들에게 경제적인 배움의 기회를 줄 수 있습니다.
						 돈 외에도 사회적 가치도 중요하다면, 많은 사람들과 함께 지식을 나눌 수 있는 LAR과 함께해 주세요.</p>
				</div>
				</div>
				<div class="p-5">
				<div class="col-md-5 col-sm-5">
					<img class="img-fluid rounded-circle" src="/lar/resources/images/make_money.jpg" alt="수익창출">
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="/lar/resources/images/care.jpg" alt="지식 관리">
					</div>
				</div>
				<div class="col-md-5 col-sm-5">
					<div class="p-5">
						<h2 class="display-4">지식 콘텐츠를 함부로 다루지 않습니다.</h2>
						<p>LAR은 지식공유자의 콘텐츠를 함부로 다루지 않습니다. 너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을
							떨어뜨리고, 지식공유자를 존중하지 않는 일이라 생각합니다. 그래서 LAR은 합리적이고 일관된 가격정책으로 지식공유자와
							학습자 모두에게 도움이 되는 생태계를 만들어 가고 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
<c:import url="/WEB-INF/views/common/_footer.jsp" />



