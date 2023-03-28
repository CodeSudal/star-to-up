package com.startoup.biz.crawling;

public class SeleniumVO {
	private int cNum; // 크롤링 정보 번호
	private String cName; // 제품이름
	private String cInfo; // 크롤링 대상 정보
	
	private String pName; // 제품이름
	private String pInfo; // 제품설명
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcInfo() {
		return cInfo;
	}
	public void setcInfo(String cInfo) {
		this.cInfo = cInfo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	@Override
	public String toString() {
		return "SeleniumVO [cNum=" + cNum + ", cName=" + cName + ", cInfo=" + cInfo + ", pName=" + pName + ", pInfo="
				+ pInfo + "]";
	}
	
	
}
