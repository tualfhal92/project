package com.misoot.lar.commu.model.vo;

import java.util.ArrayList;
import java.util.List;

public class Commu {

	private int commu_Index;
	private int commu_Writer_Index;
	private String commu_Category_Index;
	private String commu_Title;
	private String commu_Content;
	private int commu_Hits;
	private String commu_Upload_Date;
	private String commu_Update_Date;
	private int commu_Is_Deleted;
	private String commu_Writer;
	private String commu_tags;
	private int fileCount;
	private String commu_Attach_Renamedfilename;

	// 첨부파일 관련 필드 추가하기
	private List<Attachment> files = new ArrayList<>();

	public Commu() {
		super();
	}

	public Commu(int commu_Index, int commu_Writer_Index, String commu_Category_Index, String commu_Title,
			String commu_Content, int commu_Hits, String commu_Upload_Date, String commu_Update_Date,
			int commu_Is_Deleted, String commu_Writer, int fileCount, String commu_Attach_Renamedfilename,
			List<Attachment> files) {
		super();
		this.commu_Index = commu_Index;
		this.commu_Writer_Index = commu_Writer_Index;
		this.commu_Category_Index = commu_Category_Index;
		this.commu_Title = commu_Title;
		this.commu_Content = commu_Content;
		this.commu_Hits = commu_Hits;
		this.commu_Upload_Date = commu_Upload_Date;
		this.commu_Update_Date = commu_Update_Date;
		this.commu_Is_Deleted = commu_Is_Deleted;
		this.commu_Writer = commu_Writer;
		this.fileCount = fileCount;
		this.commu_Attach_Renamedfilename = commu_Attach_Renamedfilename;
		this.files = files;
	}

	public Commu(int commu_Index, int commu_Writer_Index, String commu_Category_Index, String commu_Title,
			String commu_Content, int commu_Hits, String commu_Upload_Date, String commu_Update_Date,
			int commu_Is_Deleted, String commu_Writer) {
		super();
		this.commu_Index = commu_Index;
		this.commu_Writer_Index = commu_Writer_Index;
		this.commu_Category_Index = commu_Category_Index;
		this.commu_Title = commu_Title;
		this.commu_Content = commu_Content;
		this.commu_Hits = commu_Hits;
		this.commu_Upload_Date = commu_Upload_Date;
		this.commu_Update_Date = commu_Update_Date;
		this.commu_Is_Deleted = commu_Is_Deleted;
		this.commu_Writer = commu_Writer;
	}

	public int getCommu_Index() {
		return commu_Index;
	}

	public void setCommu_Index(int commu_Index) {
		this.commu_Index = commu_Index;
	}

	public int getCommu_Writer_Index() {
		return commu_Writer_Index;
	}

	public void setCommu_Writer_Index(int commu_Writer_Index) {
		this.commu_Writer_Index = commu_Writer_Index;
	}

	public String getCommu_Category_Index() {
		return commu_Category_Index;
	}

	public void setCommu_Category_Index(String commu_Category_Index) {
		this.commu_Category_Index = commu_Category_Index;
	}

	public String getCommu_Title() {
		return commu_Title;
	}

	public void setCommu_Title(String commu_Title) {
		this.commu_Title = commu_Title;
	}

	public String getCommu_Content() {
		return commu_Content;
	}

	public void setCommu_Content(String commu_Content) {
		this.commu_Content = commu_Content;
	}

	public int getCommu_Hits() {
		return commu_Hits;
	}

	public void setCommu_Hits(int commu_Hits) {
		this.commu_Hits = commu_Hits;
	}

	public String getCommu_Upload_Date() {
		return commu_Upload_Date;
	}

	public void setCommu_Upload_Date(String commu_Upload_Date) {
		this.commu_Upload_Date = commu_Upload_Date;
	}

	public String getCommu_Update_Date() {
		return commu_Update_Date;
	}

	public void setCommu_Update_Date(String commu_Update_Date) {
		this.commu_Update_Date = commu_Update_Date;
	}

	public int getCommu_Is_Deleted() {
		return commu_Is_Deleted;
	}

	public void setCommu_Is_Deleted(int commu_Is_Deleted) {
		this.commu_Is_Deleted = commu_Is_Deleted;
	}

	public String getCommu_Writer() {
		return commu_Writer;
	}

	public void setCommu_Writer(String commu_Writer) {
		this.commu_Writer = commu_Writer;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public String getCommu_Attach_Renamedfilename() {
		return commu_Attach_Renamedfilename;
	}

	public void setCommu_Attach_Renamedfilename(String commu_Attach_Renamedfilename) {
		this.commu_Attach_Renamedfilename = commu_Attach_Renamedfilename;
	}

	public List<Attachment> getFiles() {
		return files;
	}

	public void setFiles(List<Attachment> files) {
		this.files = files;
	}

	public String getCommu_tags() {
		return commu_tags;
	}

	public void setCommu_tags(String commu_tags) {
		this.commu_tags = commu_tags;
	}

	@Override
	public String toString() {
		return "Commu [commu_Index=" + commu_Index + ", commu_Writer_Index=" + commu_Writer_Index
				+ ", commu_Category_Index=" + commu_Category_Index + ", commu_Title=" + commu_Title + ", commu_Content="
				+ commu_Content + ", commu_Hits=" + commu_Hits + ", commu_Upload_Date=" + commu_Upload_Date
				+ ", commu_Update_Date=" + commu_Update_Date + ", commu_Is_Deleted=" + commu_Is_Deleted
				+ ", commu_Writer=" + commu_Writer + ", fileCount=" + fileCount + ", commu_Attach_Renamedfilename="
				+ commu_Attach_Renamedfilename + ", files=" + files + "]";
	}

}
