package com.startoup.biz.product;

public class NamingVO {
	private int nNum; // PK
	private String nName; // 제품이름
	private String nEN; // 영어이름
	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getnName() {
		return nName;
	}
	public void setnName(String nName) {
		this.nName = nName;
	}
	public String getnEN() {
		return nEN;
	}
	public void setnEN(String nEN) {
		this.nEN = nEN;
	}
	@Override
	public String toString() {
		return "NamingVO [nNum=" + nNum + ", nName=" + nName + ", nEN=" + nEN + "]";
	}
	
}
