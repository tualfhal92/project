<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:import url="/WEB-INF/views/common/_header.jsp">
   <c:param value="About" name="pageTitle"/>
</c:import>

</header>

<!-- !important. div[class=container-fluid] ~ div[class=col-md-10 col-sm-10] -->
<div class="container-fluid">
   <div class="row">
      <div class="col-lg-10 col-md-10 col-sm-10">
         <!-- 
            this is left area. with out advertising area. 
            if you wanna add like section, use to div[class=row]
         -->
         <div class="row">
            <!-- like this. -->
            <div class="container">
           
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Learn And Run</h2>
                    <p class="section-subheading text-muted" style="font-size: 15px; margin-bottom: 75px;">
                        경제적 혹은 시간적 제약없이 원하는 것을 배우고 공유하는 공간입니다. <br>'잘 이해가 안돼서' , '책이 너무 비싸서' , '학원까지의 거리가 멀어서..'
                        <br>여러 이유로 포기했던 공부를 다시 할 수 있도록 하는것이 저희가 추구하는 홈페이지 입니다.</p>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" style="margin: 20px">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <img src="${pageContext.request.contextPath}/resources/images/postit.jpeg" alt="">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <h2>배우려고 하는 이유</h2>
                    <h4>우리는 때로 무언가를 배워야만 합니다.</h4>
                    <p class="text-muted">목표를 이루기 위해선 어떠한 분야에서든 그 분야에 대한 배움과 열정이 가장 기본적인 요소입니다.</p>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" style="margin: 20px">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <img src="${pageContext.request.contextPath}/resources/images/books.jpeg" alt="">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <h2>제대로 배우려면</h2>
                    <h4>좋은 교육자료와 하려고 하는 마음자세입니다.</h4>
                    <p class="text-muted">엄선 된 교육자료를 토대로 수강생의 이해를 도울 것입니다.</p>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" style="margin: 20px">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <img src="${pageContext.request.contextPath}/resources/images/bus.jpeg" alt="">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <h2>환경은 중요하지 않다</h2>
                    <h4>언제 어디서든 공부할수 있습니다.</h4>
                    <p class="text-muted">대중교통을 이용할때나 잠깐 시간이 날 때 스마트폰으로도 사용 할 수 있습니다.</p>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12" style="margin: 20px">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <img src="${pageContext.request.contextPath}/resources/images/study.jpg" alt="">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <h2>필요한 공부만 골라 공부하자</h2>
                    <h4>모든 분야를 알기에는 힘듭니다.</h4>
                    <p class="text-muted">하나를 알더라도 제대로된 방식으로 알려드리겠습니다.</p>
                </div>
            </div>
            
       

            <!--  -->
         </div>

         <!-- 
         <div class="row">
         
         </div>
         -->
      </div> <!-- end div[class=col-md-10 col-sm-10] : left area end -->

<c:import url="/WEB-INF/views/common/_footer.jsp"/>