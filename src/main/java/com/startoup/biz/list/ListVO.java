package com.startoup.biz.list;

public class ListVO {
	private int lNum;	// 펀딩리스트 번호
	private int lPid;	// 제품번호
	private String lMid;	// 아이디
	
	private String lEmail;	// 이메일
	private String lpName;	// 상품이름
	
	
	public String getLpName() {
		return lpName;
	}
	public void setLpName(String lpName) {
		this.lpName = lpName;
	}
	public String getlEmail() {
		return lEmail;
	}
	public void setlEmail(String lEmail) {
		this.lEmail = lEmail;
	}
	public int getlNum() {
		return lNum;
	}
	public void setlNum(int lNum) {
		this.lNum = lNum;
	}
	public int getlPid() {
		return lPid;
	}
	public void setlPid(int lPid) {
		this.lPid = lPid;
	}
	public String getlMid() {
		return lMid;
	}
	public void setlMid(String lMid) {
		this.lMid = lMid;
	}
	@Override
	public String toString() {
		return "ListVO [lNum=" + lNum + ", lPid=" + lPid + ", lMid=" + lMid + ", lEmail=" + lEmail + ", lpName="
				+ lpName + "]";
	}

	
	
}
