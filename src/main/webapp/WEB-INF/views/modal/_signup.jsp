<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="modal-header signup" style="padding: 35px 50px;">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
		<span class="glyphicon glyphicon-user"></span> LAR : Sign Up
	</h4>
</div>
<div class="modal-body" style="padding: 40px 50px;">
	<form role="form" action="/lar/user/signup" method="post" onsubmit="return form_validate('signup');">
		<div class="id form-group has-feedback">
			<label for="user_id"><span class="glyphicon glyphicon-envelope"></span> ID</label>
			<input type="email" class="form-control" id="user_id" name="user_id" placeholder="Enter email" aria-describedby="user_id_status" onkeyup="input_validate('id')" onblur="input_duplicate_check('id')" required>
			<span class="id glyphicon form-control-feedback" aria-hidden="true"></span>
			<span class="id help-block"></span>
		</div>
		<div class="password form-group has-feedback">
			<label for="user_password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
			<input type="password" class="form-control" id="user_password" name="user_password" placeholder="Enter password" onkeyup="input_validate('password')" required>
			<span class="password glyphicon form-control-feedback" aria-hidden="true"></span>
			<span class="password help-block"></span>
		</div>
		<div class="password2 form-group has-feedback">
			<label for="user_password2"><span class="glyphicon glyphicon-eye-open"></span> Re-Enter Password</label>
			<input type="password" class="form-control" id="user_password2" placeholder="Re-Enter password" onkeyup="input_validate('password2')" required>
			<span class="password2 glyphicon form-control-feedback" aria-hidden="true"></span>
			<span class="password2 help-block"></span>
		</div>
		<div class="nickname form-group has-feedback">
			<label for="user_nickname"><span class="glyphicon glyphicon-star"></span> NickName</label>
			<input type="text" class="form-control" id="user_nickname" name="user_nickname" placeholder="Enter NickName" onkeyup="input_validate('nickname')" onblur="input_duplicate_check('nickname')" required>
			<span class="nickname glyphicon form-control-feedback" aria-hidden="true"></span>
			<span class="nickname help-block"></span>
		</div>
		<div class="phone form-group has-feedback">
			<label for="user_phone"><span class="glyphicon glyphicon-phone"></span> Phone</label>
			<input type="text" class="form-control" id="user_phone" name="user_phone" placeholder="Enter Phone" onkeyup="input_validate('phone')" onblur="input_duplicate_check('phone')" required>
			<span class="phone glyphicon form-control-feedback" aria-hidden="true"></span>
			<span class="phone help-block"></span>
		</div>
		<button type="submit" class="btn btn-danger btn-block">
			<span class="glyphicon glyphicon-off"></span> Sign Up
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
		Already a member? <a onclick="getModal('signin')">Sign In</a>
	</p>
</div>