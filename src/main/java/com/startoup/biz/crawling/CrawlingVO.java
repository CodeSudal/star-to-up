package com.startoup.biz.crawling;

public class CrawlingVO {
	private int cNum; // 크롤링 정보 번호
	private int cPid; // 제품번호
	private String cInfo; // 크롤링 대상 정보
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getcPid() {
		return cPid;
	}
	public void setcPid(int cPid) {
		this.cPid = cPid;
	}
	public String getcInfo() {
		return cInfo;
	}
	public void setcInfo(String cInfo) {
		this.cInfo = cInfo;
	}
	@Override
	public String toString() {
		return "CrawlingVO [cNum=" + cNum + ", cPid=" + cPid + ", cInfo=" + cInfo + "]";
	}
	
}
