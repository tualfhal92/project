package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class LectureReview {

	private int lecture_review_index;
	private int lecture_review_lecture_index;
	private int lecture_review_writer_index;
	private String lecture_review_title;
	private String lecture_review_content;
	private int lecture_review_score;
	private Date lecture_review_upload_date;
	private Date lecture_review_update_date;
	private int lecture_is_deleted;
	private String user_nickname;
	private String user_thumbnail;

	public LectureReview() {
		super();
	}

	public LectureReview(int lecture_review_index, int lecture_review_lecture_index, int lecture_review_writer_index,
			String lecture_review_title, String lecture_review_content, int lecture_review_score,
			Date lecture_review_upload_date, Date lecture_review_update_date, int lecture_is_deleted,
			String user_nickname, String user_thumbnail) {
		super();
		this.lecture_review_index = lecture_review_index;
		this.lecture_review_lecture_index = lecture_review_lecture_index;
		this.lecture_review_writer_index = lecture_review_writer_index;
		this.lecture_review_title = lecture_review_title;
		this.lecture_review_content = lecture_review_content;
		this.lecture_review_score = lecture_review_score;
		this.lecture_review_upload_date = lecture_review_upload_date;
		this.lecture_review_update_date = lecture_review_update_date;
		this.lecture_is_deleted = lecture_is_deleted;
		this.user_nickname = user_nickname;
		this.user_thumbnail = user_thumbnail;
	}

	public int getLecture_review_index() {
		return lecture_review_index;
	}

	public void setLecture_review_index(int lecture_review_index) {
		this.lecture_review_index = lecture_review_index;
	}

	public int getLecture_review_lecture_index() {
		return lecture_review_lecture_index;
	}

	public void setLecture_review_lecture_index(int lecture_review_lecture_index) {
		this.lecture_review_lecture_index = lecture_review_lecture_index;
	}

	public int getLecture_review_writer_index() {
		return lecture_review_writer_index;
	}

	public void setLecture_review_writer_index(int lecture_review_writer_index) {
		this.lecture_review_writer_index = lecture_review_writer_index;
	}

	public String getLecture_review_title() {
		return lecture_review_title;
	}

	public void setLecture_review_title(String lecture_review_title) {
		this.lecture_review_title = lecture_review_title;
	}

	public String getLecture_review_content() {
		return lecture_review_content;
	}

	public void setLecture_review_content(String lecture_review_content) {
		this.lecture_review_content = lecture_review_content;
	}

	public int getLecture_review_score() {
		return lecture_review_score;
	}

	public void setLecture_review_score(int lecture_review_score) {
		this.lecture_review_score = lecture_review_score;
	}

	public Date getLecture_review_upload_date() {
		return lecture_review_upload_date;
	}

	public void setLecture_review_upload_date(Date lecture_review_upload_date) {
		this.lecture_review_upload_date = lecture_review_upload_date;
	}

	public Date getLecture_review_update_date() {
		return lecture_review_update_date;
	}

	public void setLecture_review_update_date(Date lecture_review_update_date) {
		this.lecture_review_update_date = lecture_review_update_date;
	}

	public int getLecture_is_deleted() {
		return lecture_is_deleted;
	}

	public void setLecture_is_deleted(int lecture_is_deleted) {
		this.lecture_is_deleted = lecture_is_deleted;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_thumbnail() {
		return user_thumbnail;
	}

	public void setUser_thumbnail(String user_thumbnail) {
		this.user_thumbnail = user_thumbnail;
	}

	@Override
	public String toString() {
		return "LectureReview [lecture_review_index=" + lecture_review_index + ", lecture_review_lecture_index="
				+ lecture_review_lecture_index + ", lecture_review_writer_index=" + lecture_review_writer_index
				+ ", lecture_review_title=" + lecture_review_title + ", lecture_review_content="
				+ lecture_review_content + ", lecture_review_score=" + lecture_review_score
				+ ", lecture_review_upload_date=" + lecture_review_upload_date + ", lecture_review_update_date="
				+ lecture_review_update_date + ", lecture_is_deleted=" + lecture_is_deleted + ", user_nickname="
				+ user_nickname + ", user_thumbnail=" + user_thumbnail + "]";
	}

	

}
