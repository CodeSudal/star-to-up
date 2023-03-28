package com.startoup.biz.crawling;

public class CrawlingVO {
	private int cNum; // 크롤링 정보 번호
	private String cName; // 제품이름
	private String cInfo; // 크롤링 대상 정보
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcInfo() {
		return cInfo;
	}
	public void setcInfo(String cInfo) {
		this.cInfo = cInfo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	@Override
	public String toString() {
		return "CrawlingVO [cNum=" + cNum + ", cName=" + cName + ", cInfo=" + cInfo + "]";
	}
	
}
