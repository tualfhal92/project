package com.misoot.lar.common.util;

public class PageInfo implements java.io.Serializable {
	private int current_page;
	private int content_per_page;
	private int max_list_count;
	private int max_page_count;
	private int paging_count;
	private int quotient;
	private int start_page;
	private int end_page;

	public PageInfo(int current_page, int content_per_page, int max_list_count, int paging_count) {
		this.current_page = current_page <= 0 ? 1 : current_page;
		this.content_per_page = content_per_page;
		this.max_list_count = max_list_count;
		this.paging_count = paging_count;

		this.max_page_count = (max_list_count % content_per_page == 0) ? max_list_count / content_per_page
				: max_list_count / content_per_page + 1;
		this.setQuotient((current_page - 1) / paging_count + 1);
		this.start_page = (this.quotient - 1) * this.paging_count + 1;
		this.end_page = start_page + this.paging_count - 1;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}

	public int getContent_per_page() {
		return content_per_page;
	}

	public void setContent_per_page(int content_per_page) {
		this.content_per_page = content_per_page;
	}

	public int getMax_list_count() {
		return max_list_count;
	}

	public void setMax_list_count(int max_list_count) {
		this.max_list_count = max_list_count;
	}

	public int getMax_page_count() {
		return max_page_count;
	}

	public void setMax_page_count(int max_page_count) {
		this.max_page_count = max_page_count;
	}

	public int getPaging_count() {
		return paging_count;
	}

	public void setPaging_count(int paging_count) {
		this.paging_count = paging_count;
	}

	public int getQuotient() {
		return quotient;
	}

	public void setQuotient(int quotient) {
		this.quotient = quotient;
	}

	public int getStart_page() {
		return start_page;
	}

	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}

	public int getEnd_page() {
		return end_page;
	}

	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
}