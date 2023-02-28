package com.startoup.biz.myfunding;

public class FundingVO {
	private int fNum; // 펀딩제품번호
	private int fPid; // 제품번호
	private int fAmount; // 펀딩목표금액
	private int fCRNAmount; // 현재펀딩금액
	
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public int getfPid() {
		return fPid;
	}
	public void setfPid(int fPid) {
		this.fPid = fPid;
	}
	public int getfAmount() {
		return fAmount;
	}
	public void setfAmount(int fAmount) {
		this.fAmount = fAmount;
	}
	public int getfCRNAmount() {
		return fCRNAmount;
	}
	public void setfCRNAmount(int fCRNAmount) {
		this.fCRNAmount = fCRNAmount;
	}
	@Override
	public String toString() {
		return "FundingVO [fNum=" + fNum + ", fPid=" + fPid + ", fAmount=" + fAmount + ", fCRNAmount=" + fCRNAmount
				+ "]";
	}
	
	
}
