package com.misoot.lar.commu.model.vo;

public class Attachment {
	private int commu_Attach_Index;
	private int commu_Attach_Commu_Index;
	private String commu_Attach_Originfilename;
	private String commu_Attach_Renamedfilename;
	private String commu_Attach_Uploaddate;

	public Attachment() {
		super();
	}

	public Attachment(int commu_Attach_Index, int commu_Attach_Commu_Index, String commu_Attach_Originfilename,
			String commu_Attach_Renamedfilename, String commu_Attach_Uploaddate) {
		super();
		this.commu_Attach_Index = commu_Attach_Index;
		this.commu_Attach_Commu_Index = commu_Attach_Commu_Index;
		this.commu_Attach_Originfilename = commu_Attach_Originfilename;
		this.commu_Attach_Renamedfilename = commu_Attach_Renamedfilename;
		this.commu_Attach_Uploaddate = commu_Attach_Uploaddate;
	}

	public int getCommu_Attach_Index() {
		return commu_Attach_Index;
	}

	public void setCommu_Attach_Index(int commu_Attach_Index) {
		this.commu_Attach_Index = commu_Attach_Index;
	}

	public int getCommu_Attach_Commu_Index() {
		return commu_Attach_Commu_Index;
	}

	public void setCommu_Attach_Commu_Index(int commu_Attach_Commu_Index) {
		this.commu_Attach_Commu_Index = commu_Attach_Commu_Index;
	}

	public String getCommu_Attach_Originfilename() {
		return commu_Attach_Originfilename;
	}

	public void setCommu_Attach_Originfilename(String commu_Attach_Originfilename) {
		this.commu_Attach_Originfilename = commu_Attach_Originfilename;
	}

	public String getCommu_Attach_Renamedfilename() {
		return commu_Attach_Renamedfilename;
	}

	public void setCommu_Attach_Renamedfilename(String commu_Attach_Renamedfilename) {
		this.commu_Attach_Renamedfilename = commu_Attach_Renamedfilename;
	}

	public String getCommu_Attach_Uploaddate() {
		return commu_Attach_Uploaddate;
	}

	public void setCommu_Attach_Uploaddate(String commu_Attach_Uploaddate) {
		this.commu_Attach_Uploaddate = commu_Attach_Uploaddate;
	}

	@Override
	public String toString() {
		return "Attachment [commu_Attach_Index=" + commu_Attach_Index + ", commu_Attach_Commu_Index="
				+ commu_Attach_Commu_Index + ", commu_Attach_Originfilename=" + commu_Attach_Originfilename
				+ ", commu_Attach_Renamedfilename=" + commu_Attach_Renamedfilename + ", commu_Attach_Uploaddate="
				+ commu_Attach_Uploaddate + "]";
	}
}
