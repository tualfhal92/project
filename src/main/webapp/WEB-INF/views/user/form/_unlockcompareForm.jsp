<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form role="form" action="/lar/user/unlock/compare" method="post">
	<div class="form-group">
		<label for="id_for_unlock_input">
			<span class="glyphicon glyphicon-envelope"></span> ID
		</label>
		<input type="email"	class="form-control" id="user_id" name="user_id" placeholder="Enter email" readonly>
	</div>
	<div class="form-group">
		<label for="unlockAuth_input">
			<span class="glyphicon glyphicon-sunglasses"></span> Auth
		</label>
		<input type="password" class="form-control" id="unlockAuth_input" name="unlockAuth_input" placeholder="Enter Auth">
	</div>
	<button type="button" class="btn btn-warning btn-block" onclick="getUnlockForm('compare')">
		<span class="glyphicon glyphicon-send"></span> Submit
	</button>
</form>