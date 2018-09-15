package com.misoot.lar.admin.model.vo;

public class Admin extends com.misoot.lar.user.model.vo.User implements java.io.Serializable {

	public Admin() {
		super();
	}

	public Admin(String user_id, String user_password) {
		super(user_id, user_password);
	}
	
	public Admin(String user_id, String user_password, String user_nickname, String user_phone) {
		super(user_id, user_password, user_nickname, user_phone);
	}

	public Admin(String user_id, String user_nickname, String user_enrolled_date, String user_phone, int user_level,
			boolean user_is_secession, boolean user_is_kicked, int user_try_signin_count) {
		super(user_id, user_nickname, user_enrolled_date, user_phone, user_level, user_is_secession, user_is_kicked,
				user_try_signin_count);
	}

	@Override
	public String toString() {
		return "Admin [getUser_index()=" + getUser_index() + ", getUser_id()=" + getUser_id() + ", getUser_password()="
				+ getUser_password() + ", getUser_nickname()=" + getUser_nickname() + ", getUser_enrolled_date()="
				+ getUser_enrolled_date() + ", getUser_phone()=" + getUser_phone() + ", getUser_level()="
				+ getUser_level() + ", isUser_is_secession()=" + isUser_is_secession() + ", isUser_is_kicked()="
				+ isUser_is_kicked() + ", getUser_try_signin_count()=" + getUser_try_signin_count() + "]";
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}
}