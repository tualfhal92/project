package com.misoot.lar.lecture.model.vo;

public class LectureHistory {

	private int history_user_index;
    private int history_lecture_index;
    private int history_lecture_board_index;
	private int history_is_deleted;
	
    public LectureHistory() {
		super();
	}

	public LectureHistory(int history_user_index, int history_lecture_index, int history_lecture_board_index,
			int history_is_deleted) {
		super();
		this.history_user_index = history_user_index;
		this.history_lecture_index = history_lecture_index;
		this.history_lecture_board_index = history_lecture_board_index;
		this.history_is_deleted = history_is_deleted;
	}

	public int getHistory_user_index() {
		return history_user_index;
	}

	public void setHistory_user_index(int history_user_index) {
		this.history_user_index = history_user_index;
	}

	public int getHistory_lecture_index() {
		return history_lecture_index;
	}

	public void setHistory_lecture_index(int history_lecture_index) {
		this.history_lecture_index = history_lecture_index;
	}

	public int getHistory_lecture_board_index() {
		return history_lecture_board_index;
	}

	public void setHistory_lecture_board_index(int history_lecture_board_index) {
		this.history_lecture_board_index = history_lecture_board_index;
	}

	public int getHistory_is_deleted() {
		return history_is_deleted;
	}

	public void setHistory_is_deleted(int history_is_deleted) {
		this.history_is_deleted = history_is_deleted;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + history_is_deleted;
		result = prime * result + history_lecture_board_index;
		result = prime * result + history_lecture_index;
		result = prime * result + history_user_index;
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
		LectureHistory other = (LectureHistory) obj;
		if (history_is_deleted != other.history_is_deleted)
			return false;
		if (history_lecture_board_index != other.history_lecture_board_index)
			return false;
		if (history_lecture_index != other.history_lecture_index)
			return false;
		if (history_user_index != other.history_user_index)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LectureHistory [history_user_index=" + history_user_index + ", history_lecture_index="
				+ history_lecture_index + ", history_lecture_board_index=" + history_lecture_board_index
				+ ", history_is_deleted=" + history_is_deleted + "]";
	}
    
}
