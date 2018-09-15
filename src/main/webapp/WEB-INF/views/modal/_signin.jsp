<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="modal-header signin" style="padding: 35px 50px;">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
		<span class="glyphicon glyphicon-user"></span> LAR : Sign In
	</h4>
</div>
<div class="modal-body" style="padding: 40px 50px;">
	<form role="form" action="/lar/user/signin" method="post" onsubmit="form_validate('signin')">
		<div class="form-group">
			<label for="user_id"><span class="glyphicon glyphicon-envelope"></span> ID</label>
			<input type="email" class="form-control" id="user_id" name="user_id" placeholder="Enter email" required>
		</div>
		<div class="form-group">
			<label for="user_password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
			<input type="password" class="form-control" id="user_password" name="user_password" placeholder="Enter password" required>
		</div>
		<button type="submit" class="btn btn-success btn-block">
			<span class="glyphicon glyphicon-off"></span> Sign In
		</button>
	</form>
</div>
<div class="modal-footer">
	<p>
		<a onclick="getModal('forgotUserId')">Forgot Your ID?</a>
	</p>
	<p>
		<a onclick="getModal('forgotUserPassword')">Forgot Your Password?</a>
	</p>
	<p>
		<a onclick="getModal('unlock')">Is your account locked?</a>
	</p>
	<p>
		Not a member? <a onclick="getModal('signup')">Sign Up</a>
	</p>
</div>