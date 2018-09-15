package com.misoot.lar.lecture.model.vo;

public class LectureTotalScore {

	private int total_lecture_index;
	private int lecture_total_score;
	private int lecture_review_count;

	public LectureTotalScore() {
		super();
	}

	public LectureTotalScore(int total_lecture_index, int lecture_total_score, int lecture_review_count) {
		super();
		this.total_lecture_index = total_lecture_index;
		this.lecture_total_score = lecture_total_score;
		this.lecture_review_count = lecture_review_count;
	}

	public int getTotal_lecture_index() {
		return total_lecture_index;
	}

	public void setTotal_lecture_index(int total_lecture_index) {
		this.total_lecture_index = total_lecture_index;
	}

	public int getLecture_total_score() {
		return lecture_total_score;
	}

	public void setLecture_total_score(int lecture_total_score) {
		this.lecture_total_score = lecture_total_score;
	}

	public int getLecture_review_count() {
		return lecture_review_count;
	}

	public void setLecture_review_count(int lecture_review_count) {
		this.lecture_review_count = lecture_review_count;
	}

	@Override
	public String toString() {
		return "LectureTotalScore [total_lecture_index=" + total_lecture_index + ", lecture_total_score="
				+ lecture_total_score + ", lecture_review_count=" + lecture_review_count + "]";
	}

}