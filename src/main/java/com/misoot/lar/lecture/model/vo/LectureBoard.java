package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class LectureBoard implements java.io.Serializable {

	private int lecture_board_index;
	private int lecture_board_lecture_index;
	private String lecture_board_title;
	private String lecture_board_content;
	private int lecture_board_hits;
	private Date lecture_board_upload_date;
	private int lecture_board_is_deleted;
	private String lecture_board_chapter;
	private int lecture_index;

	public LectureBoard() {
		super();

	}

	public LectureBoard(int lecture_board_index, int lecture_board_lecture_index, String lecture_board_title,
			String lecture_board_content, int lecture_board_hits, Date lecture_board_upload_date,
			int lecture_board_is_deleted, String lecture_board_chapter, int lecture_index) {
		super();
		this.lecture_board_index = lecture_board_index;
		this.lecture_board_lecture_index = lecture_board_lecture_index;
		this.lecture_board_title = lecture_board_title;
		this.lecture_board_content = lecture_board_content;
		this.lecture_board_hits = lecture_board_hits;
		this.lecture_board_upload_date = lecture_board_upload_date;
		this.lecture_board_is_deleted = lecture_board_is_deleted;
		this.lecture_board_chapter = lecture_board_chapter;
		this.lecture_index = lecture_index;
	}

	public int getLecture_board_index() {
		return lecture_board_index;
	}

	public void setLecture_board_index(int lecture_board_index) {
		this.lecture_board_index = lecture_board_index;
	}

	public int getLecture_board_lecture_index() {
		return lecture_board_lecture_index;
	}

	public void setLecture_board_lecture_index(int lecture_board_lecture_index) {
		this.lecture_board_lecture_index = lecture_board_lecture_index;
	}

	public String getLecture_board_title() {
		return lecture_board_title;
	}

	public void setLecture_board_title(String lecture_board_title) {
		this.lecture_board_title = lecture_board_title;
	}

	public String getLecture_board_content() {
		return lecture_board_content;
	}

	public void setLecture_board_content(String lecture_board_content) {
		this.lecture_board_content = lecture_board_content;
	}

	public int getLecture_board_hits() {
		return lecture_board_hits;
	}

	public void setLecture_board_hits(int lecture_board_hits) {
		this.lecture_board_hits = lecture_board_hits;
	}

	public Date getLecture_board_upload_date() {
		return lecture_board_upload_date;
	}

	public void setLecture_board_upload_date(Date lecture_board_upload_date) {
		this.lecture_board_upload_date = lecture_board_upload_date;
	}

	public int getLecture_board_is_deleted() {
		return lecture_board_is_deleted;
	}

	public void setLecture_board_is_deleted(int lecture_board_is_deleted) {
		this.lecture_board_is_deleted = lecture_board_is_deleted;
	}

	public String getLecture_board_chapter() {
		return lecture_board_chapter;
	}

	public void setLecture_board_chapter(String lecture_board_chapter) {
		this.lecture_board_chapter = lecture_board_chapter;
	}

	public int getLecture_index() {
		return lecture_index;
	}

	public void setLecture_index(int lecture_index) {
		this.lecture_index = lecture_index;
	}

	@Override
	public String toString() {
		return "LectureBoard [lecture_board_index=" + lecture_board_index + ", lecture_board_lecture_index="
				+ lecture_board_lecture_index + ", lecture_board_title=" + lecture_board_title
				+ ", lecture_board_content=" + lecture_board_content + ", lecture_board_hits=" + lecture_board_hits
				+ ", lecture_board_upload_date=" + lecture_board_upload_date + ", lecture_board_is_deleted="
				+ lecture_board_is_deleted + ", lecture_board_chapter=" + lecture_board_chapter + ", lecture_index="
				+ lecture_index + "]";
	}
}