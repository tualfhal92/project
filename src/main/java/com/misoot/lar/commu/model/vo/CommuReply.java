package com.misoot.lar.commu.model.vo;

public class CommuReply {
	private int commu_Reply_Index;
	private int commu_Reply_Commu_Index;
	private int commu_Reply_Parent_Index;
	private int commu_Reply_Writer_Index;
	private int commu_Reply_Order_Index;
	private String commu_Reply_Content;
	private String commu_Reply_Upload_Date;
	private String commu_Reply_Update_Date;
	private int commu_Reply_Depth_Index;
	private int commu_Reply_Is_Deleted;
	private int commu_Reply_Is_Readed;
	private String commu_Reply_Writer;

	public CommuReply() {
		super();
	}

	public CommuReply(int commu_Reply_Index, int commu_Reply_Commu_Index, int commu_Reply_Parent_Index,
			int commu_Reply_Writer_Index, int commu_Reply_Order_Index, String commu_Reply_Content,
			String commu_Reply_Upload_Date, String commu_Reply_Update_Date, int commu_Reply_Depth_Index,
			int commu_Reply_Is_Deleted, int commu_Reply_Is_Readed, String commu_Reply_Writer) {
		super();
		this.commu_Reply_Index = commu_Reply_Index;
		this.commu_Reply_Commu_Index = commu_Reply_Commu_Index;
		this.commu_Reply_Parent_Index = commu_Reply_Parent_Index;
		this.commu_Reply_Writer_Index = commu_Reply_Writer_Index;
		this.commu_Reply_Order_Index = commu_Reply_Order_Index;
		this.commu_Reply_Content = commu_Reply_Content;
		this.commu_Reply_Upload_Date = commu_Reply_Upload_Date;
		this.commu_Reply_Update_Date = commu_Reply_Update_Date;
		this.commu_Reply_Depth_Index = commu_Reply_Depth_Index;
		this.commu_Reply_Is_Deleted = commu_Reply_Is_Deleted;
		this.commu_Reply_Is_Readed = commu_Reply_Is_Readed;
		this.commu_Reply_Writer = commu_Reply_Writer;
	}

	public int getCommu_Reply_Index() {
		return commu_Reply_Index;
	}

	public void setCommu_Reply_Index(int commu_Reply_Index) {
		this.commu_Reply_Index = commu_Reply_Index;
	}

	public int getCommu_Reply_Commu_Index() {
		return commu_Reply_Commu_Index;
	}

	public void setCommu_Reply_Commu_Index(int commu_Reply_Commu_Index) {
		this.commu_Reply_Commu_Index = commu_Reply_Commu_Index;
	}

	public int getCommu_Reply_Parent_Index() {
		return commu_Reply_Parent_Index;
	}

	public void setCommu_Reply_Parent_Index(int commu_Reply_Parent_Index) {
		this.commu_Reply_Parent_Index = commu_Reply_Parent_Index;
	}

	public int getCommu_Reply_Writer_Index() {
		return commu_Reply_Writer_Index;
	}

	public void setCommu_Reply_Writer_Index(int commu_Reply_Writer_Index) {
		this.commu_Reply_Writer_Index = commu_Reply_Writer_Index;
	}

	public int getCommu_Reply_Order_Index() {
		return commu_Reply_Order_Index;
	}

	public void setCommu_Reply_Order_Index(int commu_Reply_Order_Index) {
		this.commu_Reply_Order_Index = commu_Reply_Order_Index;
	}

	public String getCommu_Reply_Content() {
		return commu_Reply_Content;
	}

	public void setCommu_Reply_Content(String commu_Reply_Content) {
		this.commu_Reply_Content = commu_Reply_Content;
	}

	public String getCommu_Reply_Upload_Date() {
		return commu_Reply_Upload_Date;
	}

	public void setCommu_Reply_Upload_Date(String commu_Reply_Upload_Date) {
		this.commu_Reply_Upload_Date = commu_Reply_Upload_Date;
	}

	public String getCommu_Reply_Update_Date() {
		return commu_Reply_Update_Date;
	}

	public void setCommu_Reply_Update_Date(String commu_Reply_Update_Date) {
		this.commu_Reply_Update_Date = commu_Reply_Update_Date;
	}

	public int getCommu_Reply_Depth_Index() {
		return commu_Reply_Depth_Index;
	}

	public void setCommu_Reply_Depth_Index(int commu_Reply_Depth_Index) {
		this.commu_Reply_Depth_Index = commu_Reply_Depth_Index;
	}

	public int getCommu_Reply_Is_Deleted() {
		return commu_Reply_Is_Deleted;
	}

	public void setCommu_Reply_Is_Deleted(int commu_Reply_Is_Deleted) {
		this.commu_Reply_Is_Deleted = commu_Reply_Is_Deleted;
	}

	public int getCommu_Reply_Is_Readed() {
		return commu_Reply_Is_Readed;
	}

	public void setCommu_Reply_Is_Readed(int commu_Reply_Is_Readed) {
		this.commu_Reply_Is_Readed = commu_Reply_Is_Readed;
	}

	public String getCommu_Reply_Writer() {
		return commu_Reply_Writer;
	}

	public void setCommu_Reply_Writer(String commu_Reply_Writer) {
		this.commu_Reply_Writer = commu_Reply_Writer;
	}

	@Override
	public String toString() {
		return "CommuReply [commu_Reply_Index=" + commu_Reply_Index + ", commu_Reply_Commu_Index="
				+ commu_Reply_Commu_Index + ", commu_Reply_Parent_Index=" + commu_Reply_Parent_Index
				+ ", commu_Reply_Writer_Index=" + commu_Reply_Writer_Index + ", commu_Reply_Order_Index="
				+ commu_Reply_Order_Index + ", commu_Reply_Content=" + commu_Reply_Content
				+ ", commu_Reply_Upload_Date=" + commu_Reply_Upload_Date + ", commu_Reply_Update_Date="
				+ commu_Reply_Update_Date + ", commu_Reply_Depth_Index=" + commu_Reply_Depth_Index
				+ ", commu_Reply_Is_Deleted=" + commu_Reply_Is_Deleted + ", commu_Reply_Is_Readed="
				+ commu_Reply_Is_Readed + ", commu_Reply_Writer=" + commu_Reply_Writer + "]";
	}
}
