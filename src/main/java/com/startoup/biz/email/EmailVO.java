package com.startoup.biz.email;

public class EmailVO {
	private String eAddress; // 이메일 주소
	private String eTitle;	// 이메일 제목
	private String eContent;	// 이메일 내용
	
	public String geteAddress() {
		return eAddress;
	}
	public void seteAddress(String eAddress) {
		this.eAddress = eAddress;
	}
	public String geteTitle() {
		return eTitle;
	}
	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	@Override
	public String toString() {
		return "EmailVO [eAddress=" + eAddress + ", eTitle=" + eTitle + ", eContent=" + eContent + "]";
	}
	
	
}
