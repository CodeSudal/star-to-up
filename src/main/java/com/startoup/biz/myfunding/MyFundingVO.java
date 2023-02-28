package com.startoup.biz.myfunding;

public class MyFundingVO {
	private int mfNum;	// 내 펀딩 정보 번호
	private String mfMid; // 펀딩 대상 아이디
	private int mfPid; // 펀딩 대상 제품
	
	public int getMfNum() {
		return mfNum;
	}
	public void setMfNum(int mfNum) {
		this.mfNum = mfNum;
	}
	public String getMfMid() {
		return mfMid;
	}
	public void setMfMid(String mfMid) {
		this.mfMid = mfMid;
	}
	public int getMfPid() {
		return mfPid;
	}
	public void setMfPid(int mfPid) {
		this.mfPid = mfPid;
	}
	@Override
	public String toString() {
		return "MyFundingVO [mfNum=" + mfNum + ", mfMid=" + mfMid + ", mfPid=" + mfPid + "]";
	}
	
	

}
