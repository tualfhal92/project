<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form role="form" action="/lar/user/forgotPassword/compare" method="post">
	<div class="form-group">
		<label for="id_for_forgot_input">
			<span class="glyphicon glyphicon-envelope"></span> ID
		</label>
		<input type="email"	class="form-control" id="user_id" name="user_id" placeholder="Enter email" readonly>
	</div>
	<div class="form-group">
		<label for="unlockAuth_input">
			<span class="glyphicon glyphicon-sunglasses"></span> Auth
		</label>
		<input type="password" class="form-control" id="passwordAuth_input" name="passwordAuth_input" placeholder="Enter Auth">
	</div>
	<button type="button" class="btn btn-info btn-block" onclick="getForgotPasswordForm('compare')">
		<span class="glyphicon glyphicon-off"></span> Send
	</button>
</form>