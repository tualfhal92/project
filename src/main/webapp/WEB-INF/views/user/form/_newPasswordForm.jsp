<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form role="form" method="post" action="/lar/user/passwordModify" onsubmit="return form_validate('passwordModify')">
	<div class="id form-group has-feedback">
		<label for="id_for_unlock">
			<span class="glyphicon glyphicon-envelope"></span> ID
		</label>
		<input type="email" class="form-control" id="user_id" name="user_id" placeholder="Enter email" value="${id_for_forgot}" readonly>
	</div>
	<div class="newPassword form-group has-feedback">
		<label for="newPassword">
			<span class="glyphicon glyphicon-eye-open"></span> New Password
		</label>
		<input type="password" class="form-control" id="user_newPassword" name="newPassword" placeholder="Enter new Password">
		<span class="newPassword glyphicon form-control-feedback" aria-hidden="true"></span>
		<span class="newPassword help-block"></span>
	</div>
	<div class="newPassword2 form-group has-feedback">
		<label for="newPassword2">
			<span class="glyphicon glyphicon-eye-open"></span> Re Enter New Password
		</label>
		<input type="password" class="form-control" id="user_newPassword2" name="newPassword2" placeholder="Re Enter new Password">
		<span class="newPassword2 glyphicon form-control-feedback" aria-hidden="true"></span>
		<span class="newPassword2 help-block"></span>
	</div>
	<button type="submit" class="btn btn-success btn-block">
		<span class="glyphicon glyphicon-cog"></span> Change
	</button>
</form>