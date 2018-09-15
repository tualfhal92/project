package com.misoot.lar.common.sockJS.model.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Inquire implements java.io.Serializable {

	private static final long serialVersionUID = 9968L;

	private int inquire_no;
	private String inquire_sender_index, inquire_receiver_index, inquire_content, inquire_attach_originfilename,
			inquire_attach_renamedfilename;
	private Date inquire_sendDate; // 작성일

	public Inquire() {
	}

	public Inquire(int inquire_no, String inquire_sender_index, String inquire_receiver_index, String inquire_content,
			String inquire_attach_originfilename, String inquire_attach_renamedfilename, Date inquire_sendDate) {
		super();
		this.inquire_no = inquire_no;
		this.inquire_sender_index = inquire_sender_index;
		this.inquire_receiver_index = inquire_receiver_index;
		this.inquire_content = inquire_content;
		this.inquire_attach_originfilename = inquire_attach_originfilename;
		this.inquire_attach_renamedfilename = inquire_attach_renamedfilename;
		this.inquire_sendDate = inquire_sendDate;
	}

	public int getInquire_no() {
		return inquire_no;
	}

	public void setInquire_no(int inquire_no) {
		this.inquire_no = inquire_no;
	}

	public String getInquire_sender_index() {
		return inquire_sender_index;
	}

	public void setInquire_sender_index(String inquire_sender_index) {
		this.inquire_sender_index = inquire_sender_index;
	}

	public String getInquire_receiver_index() {
		return inquire_receiver_index;
	}

	public void setInquire_receiver_index(String inquire_receiver_index) {
		this.inquire_receiver_index = inquire_receiver_index;
	}

	public String getInquire_content() {
		return inquire_content;
	}

	public void setInquire_content(String inquire_content) {
		this.inquire_content = inquire_content;
	}

	public String getInquire_attach_originfilename() {
		return inquire_attach_originfilename;
	}

	public void setInquire_attach_originfilename(String inquire_attach_originfilename) {
		this.inquire_attach_originfilename = inquire_attach_originfilename;
	}

	public String getInquire_attach_renamedfilename() {
		return inquire_attach_renamedfilename;
	}

	public void setInquire_attach_renamedfilename(String inquire_attach_renamedfilename) {
		this.inquire_attach_renamedfilename = inquire_attach_renamedfilename;
	}

	public Date getInquire_sendDate() {
		return inquire_sendDate;
	}

	public void setInquire_sendDate(Date inquire_sendDate) {
		this.inquire_sendDate = inquire_sendDate;
	}

	@Override
	public String toString() {
		return "Inquire [inquire_no=" + inquire_no + ", inquire_sender_index=" + inquire_sender_index
				+ ", inquire_receiver_index=" + inquire_receiver_index + ", inquire_content=" + inquire_content
				+ ", inquire_attach_originfilename=" + inquire_attach_originfilename
				+ ", inquire_attach_renamedfilename=" + inquire_attach_renamedfilename + ", inquire_sendDate="
				+ inquire_sendDate + "]";
	}
}