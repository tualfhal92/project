package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class Lecture implements java.io.Serializable {

	private int lecture_index;
	private String lecture_category_index;
	private int lecture_instructor_index;
	private String lecture_thumbnail;
	private String lecture_title;
	private String lecture_intro;
	private String lecture_level;
	private int lecture_price;
	private Date lecture_upload_date;
	private int lecture_is_deleted;
	private int lecture_hits;
	private String lecture_content;
	private int lecture_total_score;
	private String user_nickname;
	private int lecture_review_count;
	private String cart_user_index;
	private String wish_user_index;
	private int history_lecture_board_index;
	private String user_thumbnail;
	private String user_id;
	private String category_name;
	
	public Lecture() {
		super();
	}

	public Lecture(int lecture_index, String lecture_category_index, int lecture_instructor_index,
			String lecture_thumbnail, String lecture_title, String lecture_intro, String lecture_level,
			int lecture_price, Date lecture_upload_date, int lecture_is_deleted, int lecture_hits,
			String lecture_content, int lecture_total_score, String user_nickname, int lecture_review_count,
			String cart_user_index, String wish_user_index, int history_lecture_board_index, String user_thumbnail,
			String user_id, String category_name) {
		super();
		this.lecture_index = lecture_index;
		this.lecture_category_index = lecture_category_index;
		this.lecture_instructor_index = lecture_instructor_index;
		this.lecture_thumbnail = lecture_thumbnail;
		this.lecture_title = lecture_title;
		this.lecture_intro = lecture_intro;
		this.lecture_level = lecture_level;
		this.lecture_price = lecture_price;
		this.lecture_upload_date = lecture_upload_date;
		this.lecture_is_deleted = lecture_is_deleted;
		this.lecture_hits = lecture_hits;
		this.lecture_content = lecture_content;
		this.lecture_total_score = lecture_total_score;
		this.user_nickname = user_nickname;
		this.lecture_review_count = lecture_review_count;
		this.cart_user_index = cart_user_index;
		this.wish_user_index = wish_user_index;
		this.history_lecture_board_index = history_lecture_board_index;
		this.user_thumbnail = user_thumbnail;
		this.user_id = user_id;
		this.category_name = category_name;
	}

	public int getLecture_index() {
		return lecture_index;
	}

	public void setLecture_index(int lecture_index) {
		this.lecture_index = lecture_index;
	}

	public String getLecture_category_index() {
		return lecture_category_index;
	}

	public void setLecture_category_index(String lecture_category_index) {
		this.lecture_category_index = lecture_category_index;
	}

	public int getLecture_instructor_index() {
		return lecture_instructor_index;
	}

	public void setLecture_instructor_index(int lecture_instructor_index) {
		this.lecture_instructor_index = lecture_instructor_index;
	}

	public String getLecture_thumbnail() {
		return lecture_thumbnail;
	}

	public void setLecture_thumbnail(String lecture_thumbnail) {
		this.lecture_thumbnail = lecture_thumbnail;
	}

	public String getLecture_title() {
		return lecture_title;
	}

	public void setLecture_title(String lecture_title) {
		this.lecture_title = lecture_title;
	}

	public String getLecture_intro() {
		return lecture_intro;
	}

	public void setLecture_intro(String lecture_intro) {
		this.lecture_intro = lecture_intro;
	}

	public String getLecture_level() {
		return lecture_level;
	}

	public void setLecture_level(String lecture_level) {
		this.lecture_level = lecture_level;
	}

	public int getLecture_price() {
		return lecture_price;
	}

	public void setLecture_price(int lecture_price) {
		this.lecture_price = lecture_price;
	}

	public Date getLecture_upload_date() {
		return lecture_upload_date;
	}

	public void setLecture_upload_date(Date lecture_upload_date) {
		this.lecture_upload_date = lecture_upload_date;
	}

	public int getLecture_is_deleted() {
		return lecture_is_deleted;
	}

	public void setLecture_is_deleted(int lecture_is_deleted) {
		this.lecture_is_deleted = lecture_is_deleted;
	}

	public int getLecture_hits() {
		return lecture_hits;
	}

	public void setLecture_hits(int lecture_hits) {
		this.lecture_hits = lecture_hits;
	}

	public String getLecture_content() {
		return lecture_content;
	}

	public void setLecture_content(String lecture_content) {
		this.lecture_content = lecture_content;
	}

	public int getLecture_total_score() {
		return lecture_total_score;
	}

	public void setLecture_total_score(int lecture_total_score) {
		this.lecture_total_score = lecture_total_score;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public int getLecture_review_count() {
		return lecture_review_count;
	}

	public void setLecture_review_count(int lecture_review_count) {
		this.lecture_review_count = lecture_review_count;
	}

	public String getCart_user_index() {
		return cart_user_index;
	}

	public void setCart_user_index(String cart_user_index) {
		this.cart_user_index = cart_user_index;
	}

	public String getWish_user_index() {
		return wish_user_index;
	}

	public void setWish_user_index(String wish_user_index) {
		this.wish_user_index = wish_user_index;
	}

	public int getHistory_lecture_board_index() {
		return history_lecture_board_index;
	}

	public void setHistory_lecture_board_index(int history_lecture_board_index) {
		this.history_lecture_board_index = history_lecture_board_index;
	}

	public String getUser_thumbnail() {
		return user_thumbnail;
	}

	public void setUser_thumbnail(String user_thumbnail) {
		this.user_thumbnail = user_thumbnail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		return "Lecture [lecture_index=" + lecture_index + ", lecture_category_index=" + lecture_category_index
				+ ", lecture_instructor_index=" + lecture_instructor_index + ", lecture_thumbnail=" + lecture_thumbnail
				+ ", lecture_title=" + lecture_title + ", lecture_intro=" + lecture_intro + ", lecture_level="
				+ lecture_level + ", lecture_price=" + lecture_price + ", lecture_upload_date=" + lecture_upload_date
				+ ", lecture_is_deleted=" + lecture_is_deleted + ", lecture_hits=" + lecture_hits + ", lecture_content="
				+ lecture_content + ", lecture_total_score=" + lecture_total_score + ", user_nickname=" + user_nickname
				+ ", lecture_review_count=" + lecture_review_count + ", cart_user_index=" + cart_user_index
				+ ", wish_user_index=" + wish_user_index + ", history_lecture_board_index="
				+ history_lecture_board_index + ", user_thumbnail=" + user_thumbnail + ", user_id=" + user_id
				+ ", category_name=" + category_name + "]";
	}
}