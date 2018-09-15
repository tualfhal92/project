package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class LectureQ {

	private int lecture_q_index;
	private int lecture_q_writer_index;
	private int lecture_q_lecture_index;
	private String lecture_q_title;
	private String lecture_q_content;
	private int lecture_q_hits;
	private String lecture_q_upload_date;
	private String lecture_q_update_date;
	private int lecture_q_is_deleted;
	private String user_nickname;
	private int user_index;

	public LectureQ() {

	}

	public LectureQ(int lecture_q_index, int lecture_q_writer_index, int lecture_q_lecture_index,
			String lecture_q_title, String lecture_q_content, int lecture_q_hits, String lecture_q_upload_date,
			String lecture_q_update_date, int lecture_q_is_deleted, String user_nickname, int user_index) {
		super();
		this.lecture_q_index = lecture_q_index;
		this.lecture_q_writer_index = lecture_q_writer_index;
		this.lecture_q_lecture_index = lecture_q_lecture_index;
		this.lecture_q_title = lecture_q_title;
		this.lecture_q_content = lecture_q_content;
		this.lecture_q_hits = lecture_q_hits;
		this.lecture_q_upload_date = lecture_q_upload_date;
		this.lecture_q_update_date = lecture_q_update_date;
		this.lecture_q_is_deleted = lecture_q_is_deleted;
		this.user_nickname = user_nickname;
		this.user_index = user_index;
	}

	public int getLecture_q_index() {
		return lecture_q_index;
	}

	public void setLecture_q_index(int lecture_q_index) {
		this.lecture_q_index = lecture_q_index;
	}

	public int getLecture_q_writer_index() {
		return lecture_q_writer_index;
	}

	public void setLecture_q_writer_index(int lecture_q_writer_index) {
		this.lecture_q_writer_index = lecture_q_writer_index;
	}

	public int getLecture_q_lecture_index() {
		return lecture_q_lecture_index;
	}

	public void setLecture_q_lecture_index(int lecture_q_lecture_index) {
		this.lecture_q_lecture_index = lecture_q_lecture_index;
	}

	public String getLecture_q_title() {
		return lecture_q_title;
	}

	public void setLecture_q_title(String lecture_q_title) {
		this.lecture_q_title = lecture_q_title;
	}

	public String getLecture_q_content() {
		return lecture_q_content;
	}

	public void setLecture_q_content(String lecture_q_content) {
		this.lecture_q_content = lecture_q_content;
	}

	public int getLecture_q_hits() {
		return lecture_q_hits;
	}

	public void setLecture_q_hits(int lecture_q_hits) {
		this.lecture_q_hits = lecture_q_hits;
	}

	public String getLecture_q_upload_date() {
		return lecture_q_upload_date;
	}

	public void setLecture_q_upload_date(String lecture_q_upload_date) {
		this.lecture_q_upload_date = lecture_q_upload_date;
	}

	public String getLecture_q_update_date() {
		return lecture_q_update_date;
	}

	public void setLecture_q_update_date(String lecture_q_update_date) {
		this.lecture_q_update_date = lecture_q_update_date;
	}

	public int getLecture_q_is_deleted() {
		return lecture_q_is_deleted;
	}

	public void setLecture_q_is_deleted(int lecture_q_is_deleted) {
		this.lecture_q_is_deleted = lecture_q_is_deleted;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getUser_index() {
		return user_index;
	}

	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}

	@Override
	public String toString() {
		return "LectureQ [lecture_q_index=" + lecture_q_index + ", lecture_q_writer_index=" + lecture_q_writer_index
				+ ", lecture_q_lecture_index=" + lecture_q_lecture_index + ", lecture_q_title=" + lecture_q_title
				+ ", lecture_q_content=" + lecture_q_content + ", lecture_q_hits=" + lecture_q_hits
				+ ", lecture_q_upload_date=" + lecture_q_upload_date + ", lecture_q_update_date="
				+ lecture_q_update_date + ", lecture_q_is_deleted=" + lecture_q_is_deleted + ", user_nickname="
				+ user_nickname + ", user_index=" + user_index + "]";
	}
}
