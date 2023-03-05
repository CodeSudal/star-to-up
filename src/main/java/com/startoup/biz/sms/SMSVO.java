package com.startoup.biz.sms;

public class SMSVO {
	private String sNum;	// 전화번호 (문자받는사람)
	private String sAuth;	// 인증번호 (생성되는번호)
	private String sCheckAuth;	// 인증확인 (사용자가입력할번호)
	
	public String getsNum() {
		return sNum;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	public String getsAuth() {
		return sAuth;
	}
	public void setsAuth(String sAuth) {
		this.sAuth = sAuth;
	}
	public String getsCheckAuth() {
		return sCheckAuth;
	}
	public void setsCheckAuth(String sCheckAuth) {
		this.sCheckAuth = sCheckAuth;
	}
	@Override
	public String toString() {
		return "SMSVO [sNum=" + sNum + ", sAuth=" + sAuth + ", sCheckAuth=" + sCheckAuth + "]";
	}
	
	
}
