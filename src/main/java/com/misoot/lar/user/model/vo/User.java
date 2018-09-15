package com.misoot.lar.user.model.vo;

public class User implements java.io.Serializable {
	private int user_index;
	private String user_id;
	private String user_password;
	private String user_nickname;
	private String user_enrolled_date;
	private String user_phone;
	// user, inst, admin
	private String user_type;
	private int user_level;
	private String user_thumbnail;
	private boolean user_is_secession;
	private boolean user_is_kicked;
	private int user_try_signin_count;

	public User() {
	}

	public User(String user_id, String user_password) {
		this.user_id = user_id;
		this.user_password = user_password;
	}

	public User(String user_id, String user_password, String user_nickname, String user_phone) {
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_nickname = user_nickname;
		this.user_phone = user_phone;
	}

	// If signining successed, use to this constructor
	public User(String user_id, String user_nickname, String user_enrolled_date, String user_phone, int user_level,
			boolean user_is_secession, boolean user_is_kicked, int user_try_signin_count) {
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_enrolled_date = user_enrolled_date;
		this.user_phone = user_phone;
		this.user_level = user_level;
		this.user_is_secession = user_is_secession;
		this.user_is_kicked = user_is_kicked;
		this.user_try_signin_count = user_try_signin_count;
	}

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_enrolled_date() {
		return user_enrolled_date;
	}

	public void setUser_enrolled_date(String user_enrolled_date) {
		this.user_enrolled_date = user_enrolled_date;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public String getUser_thumbnail() {
		return user_thumbnail;
	}

	public void setUser_thumbnail(String user_thumbnail) {
		this.user_thumbnail = user_thumbnail;
	}

	public boolean isUser_is_secession() {
		return user_is_secession;
	}

	public void setUser_is_secession(boolean user_is_secession) {
		this.user_is_secession = user_is_secession;
	}

	public boolean isUser_is_kicked() {
		return user_is_kicked;
	}

	public void setUser_is_kicked(boolean user_is_kicked) {
		this.user_is_kicked = user_is_kicked;
	}

	public int getUser_try_signin_count() {
		return user_try_signin_count;
	}

	public void setUser_try_signin_count(int user_try_signin_count) {
		this.user_try_signin_count = user_try_signin_count;
	}

	@Override
	public String toString() {
		return "User [user_index=" + user_index + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_nickname=" + user_nickname + ", user_enrolled_date=" + user_enrolled_date + ", user_phone="
				+ user_phone + ", user_type=" + user_type + ", user_level=" + user_level + ", user_thumbnail="
				+ user_thumbnail + ", user_is_secession=" + user_is_secession + ", user_is_kicked=" + user_is_kicked
				+ ", user_try_signin_count=" + user_try_signin_count + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((user_enrolled_date == null) ? 0 : user_enrolled_date.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + user_index;
		result = prime * result + (user_is_kicked ? 1231 : 1237);
		result = prime * result + (user_is_secession ? 1231 : 1237);
		result = prime * result + user_level;
		result = prime * result + ((user_nickname == null) ? 0 : user_nickname.hashCode());
		result = prime * result + ((user_password == null) ? 0 : user_password.hashCode());
		result = prime * result + ((user_phone == null) ? 0 : user_phone.hashCode());
		result = prime * result + ((user_thumbnail == null) ? 0 : user_thumbnail.hashCode());
		result = prime * result + user_try_signin_count;
		result = prime * result + ((user_type == null) ? 0 : user_type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (user_enrolled_date == null) {
			if (other.user_enrolled_date != null)
				return false;
		} else if (!user_enrolled_date.equals(other.user_enrolled_date))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_index != other.user_index)
			return false;
		if (user_is_kicked != other.user_is_kicked)
			return false;
		if (user_is_secession != other.user_is_secession)
			return false;
		if (user_level != other.user_level)
			return false;
		if (user_nickname == null) {
			if (other.user_nickname != null)
				return false;
		} else if (!user_nickname.equals(other.user_nickname))
			return false;
		if (user_password == null) {
			if (other.user_password != null)
				return false;
		} else if (!user_password.equals(other.user_password))
			return false;
		if (user_phone == null) {
			if (other.user_phone != null)
				return false;
		} else if (!user_phone.equals(other.user_phone))
			return false;
		if (user_thumbnail == null) {
			if (other.user_thumbnail != null)
				return false;
		} else if (!user_thumbnail.equals(other.user_thumbnail))
			return false;
		if (user_try_signin_count != other.user_try_signin_count)
			return false;
		if (user_type == null) {
			if (other.user_type != null)
				return false;
		} else if (!user_type.equals(other.user_type))
			return false;
		return true;
	}
}