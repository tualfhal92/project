package com.misoot.lar.lecture.model.vo;

import java.sql.Date;

public class BoardLectureAttachment {

	private int lecture_attach_index;
	private int lecture_attach_board_index;
	private String lecture_attach_originfilename;
	private String lecture_attach_renamedfilename;
	private Date lecture_attach_uploaddate;

	public BoardLectureAttachment() {
		super();
	}

	public BoardLectureAttachment(int lecture_attach_index, int lecture_attach_board_index,
			String lecture_attach_originfilename, String lecture_attach_renamedfilename,
			Date lecture_attach_uploaddate) {
		super();
		this.lecture_attach_index = lecture_attach_index;
		this.lecture_attach_board_index = lecture_attach_board_index;
		this.lecture_attach_originfilename = lecture_attach_originfilename;
		this.lecture_attach_renamedfilename = lecture_attach_renamedfilename;
		this.lecture_attach_uploaddate = lecture_attach_uploaddate;
	}

	public int getLecture_attach_index() {
		return lecture_attach_index;
	}

	public void setLecture_attach_index(int lecture_attach_index) {
		this.lecture_attach_index = lecture_attach_index;
	}

	public int getLecture_attach_board_index() {
		return lecture_attach_board_index;
	}

	public void setLecture_attach_board_index(int lecture_attach_board_index) {
		this.lecture_attach_board_index = lecture_attach_board_index;
	}

	public String getLecture_attach_originfilename() {
		return lecture_attach_originfilename;
	}

	public void setLecture_attach_originfilename(String lecture_attach_originfilename) {
		this.lecture_attach_originfilename = lecture_attach_originfilename;
	}

	public String getLecture_attach_renamedfilename() {
		return lecture_attach_renamedfilename;
	}

	public void setLecture_attach_renamedfilename(String lecture_attach_renamedfilename) {
		this.lecture_attach_renamedfilename = lecture_attach_renamedfilename;
	}

	public Date getLecture_attach_uploaddate() {
		return lecture_attach_uploaddate;
	}

	public void setLecture_attach_uploaddate(Date lecture_attach_uploaddate) {
		this.lecture_attach_uploaddate = lecture_attach_uploaddate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lecture_attach_board_index;
		result = prime * result + lecture_attach_index;
		result = prime * result
				+ ((lecture_attach_originfilename == null) ? 0 : lecture_attach_originfilename.hashCode());
		result = prime * result
				+ ((lecture_attach_renamedfilename == null) ? 0 : lecture_attach_renamedfilename.hashCode());
		result = prime * result + ((lecture_attach_uploaddate == null) ? 0 : lecture_attach_uploaddate.hashCode());
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
		BoardLectureAttachment other = (BoardLectureAttachment) obj;
		if (lecture_attach_board_index != other.lecture_attach_board_index)
			return false;
		if (lecture_attach_index != other.lecture_attach_index)
			return false;
		if (lecture_attach_originfilename == null) {
			if (other.lecture_attach_originfilename != null)
				return false;
		} else if (!lecture_attach_originfilename.equals(other.lecture_attach_originfilename))
			return false;
		if (lecture_attach_renamedfilename == null) {
			if (other.lecture_attach_renamedfilename != null)
				return false;
		} else if (!lecture_attach_renamedfilename.equals(other.lecture_attach_renamedfilename))
			return false;
		if (lecture_attach_uploaddate == null) {
			if (other.lecture_attach_uploaddate != null)
				return false;
		} else if (!lecture_attach_uploaddate.equals(other.lecture_attach_uploaddate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardLectureAttachment [lecture_attach_index=" + lecture_attach_index + ", lecture_attach_board_index="
				+ lecture_attach_board_index + ", lecture_attach_originfilename=" + lecture_attach_originfilename
				+ ", lecture_attach_renamedfilename=" + lecture_attach_renamedfilename + ", lecture_attach_uploaddate="
				+ lecture_attach_uploaddate + "]";
	}

}
