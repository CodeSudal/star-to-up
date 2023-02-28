package com.startoup.biz.myfunding;

public class ListVO {
	private int lNum;	// 펀딩리스트 번호
	private int lPid;	// 제품번호
	private String lMid;	// 아이디
	
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
		return "ListVO [lNum=" + lNum + ", lPid=" + lPid + ", lMid=" + lMid + "]";
	}
	
	
}
