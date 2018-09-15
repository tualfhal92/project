<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/views/common/inquire.jsp"/> 

			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12" style="margin-top: 5%;">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/ad.JPG" style="width: 150px; margin-bottom: 10px;"></img>
					<img src="${pageContext.request.contextPath}/resources/images/ad2.JPG" style="width: 150px;"></img>
				</div>
			</div>
		</div> <!-- div[class=row] end -->
	</div> <!-- div[class=container] end -->
</div> <!-- div[class=wrapper] end -->

<!-- in _footer -->
<footer style="border-top: 1px solid gray">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<span class="copyright">Copyright &copy; <a
					href="/lar/aboutLar">LAR</a>&nbsp;&nbsp;of&nbsp;&nbsp;<a href="/lar/about"> KH Team Misoot 2018</a></span>
			</div>
			<div class="col-md-4">
				<ul class="list-inline social-buttons">
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<ul class="list-inline quicklinks">
					<li><a id="footer_Privacy_Policy" data-toggle="modal" data-target=".dynamicModal" onclick="getModal('Privacy_Policy');">Privacy Policy</a></li>
					<li><a id="footer-Terms_of_Use" data-toggle="modal" data-target=".dynamicModal" onclick="getModal('Terms_of_Use');">Terms of Use</a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>
<div id="dynamicModal">
	<div class="modal fade dynamicModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" id="modalContent"></div>
		</div>
	</div>
</div>

<script src="/lar/resources/js/suhyeon.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="/lar/resources/js/jqBootstrapValidation.min.js"></script>
<script src="/lar/resources/js/contact_me.min.js"></script>

<!-- Theme JavaScript -->
<script src="/lar/resources/js/agency.min.js"></script>
</body>
</html>