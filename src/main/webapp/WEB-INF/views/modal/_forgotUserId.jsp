<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="modal-header finduserid" style="padding: 35px 50px;">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>
		<span class="glyphicon glyphicon-user"></span> LAR : Find ID
	</h4>
</div>
<div class="modal-body" style="padding: 40px 50px;">
	<form role="form" action="" method="post">
		<div class="form-group">
			<label for="user_phone"><span class="glyphicon glyphicon-phone"></span> Phone</label>
			<input type="text" class="form-control" id="user_phone" name="user_id" placeholder="Enter Phone" required>
		</div>
		<button type="submit" class="btn btn-primary btn-block">
			<span class="glyphicon glyphicon-off"></span> Find
		</button>
	</form>
</div>
<div class="modal-footer">
	<p>
		<a onclick="getModal('forgotUserPassword')">Forgot Your Password?</a>
	</p>
	<p>
		<a onclick="getModal('unlock')">Is your account locked?</a>
	</p>
	<p>
		Not a member? <a onclick="getModal('signup')">Sign Up</a>
	</p>
	<p>
		Already a member? <a onclick="getModal('signin')">Sign In</a>
	</p>
</div>