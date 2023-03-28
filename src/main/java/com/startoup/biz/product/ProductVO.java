package com.startoup.biz.product;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.startoup.biz.list.ListVO;

public class ProductVO {
	private int pNum; // 제품번호
	private String pName; // 제품이름
	private int pPrice; // 펀딩금액
	private String pInfo; // 제품설명
	private int pFinish; // 펀딩종료확인, 0이면 진행중 1이면 끝
	private String pImage1; // 제품 이미지
	private String pImage2; // 제품 이미지
	private String pImage3; // 제품 이미지
	private List<ListVO> pList; // 해당 제품 펀딩 회원리스트
	private int pAmount; // 펀딩목표금액
	private int pCRNAmount; // 현재펀딩금액
	private double pPercent; // 펀딩목표 퍼센트에이지
	private int people;	// 펀딩 목표 총 인원
	private String pEN;	// 펀딩 목표 총 인원
	private List<MultipartFile> uploadFile;	// 업로드 파일
	
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getpImage1() {
		return pImage1;
	}
	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}
	public String getpImage2() {
		return pImage2;
	}
	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}
	public String getpImage3() {
		return pImage3;
	}
	public void setpImage3(String pImage3) {
		this.pImage3 = pImage3;
	}
	public double getpPercent() {
		return pPercent;
	}
	public void setpPercent(double pPercent) {
		this.pPercent = pPercent;
	}
	public int getpNum() {
		return pNum;
	}
	public int getpAmount() {
		return pAmount;
	}
	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}
	public int getpCRNAmount() {
		return pCRNAmount;
	}
	public void setpCRNAmount(int pCRNAmount) {
		this.pCRNAmount = pCRNAmount;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public int getpFinish() {
		return pFinish;
	}
	public void setpFinish(int pFinish) {
		this.pFinish = pFinish;
	}
	public List<ListVO> getpList() {
		return pList;
	}
	public void setpList(List<ListVO> pList) {
		this.pList = pList;
	}
	
	
	public String getpEN() {
		return pEN;
	}
	public void setpEN(String pEN) {
		this.pEN = pEN;
	}
	@Override
	public String toString() {
		return "ProductVO [pNum=" + pNum + ", pName=" + pName + ", pPrice=" + pPrice + ", pInfo=" + pInfo + ", pFinish="
				+ pFinish + ", pImage1=" + pImage1 + ", pImage2=" + pImage2 + ", pImage3=" + pImage3 + ", pList="
				+ pList + ", pAmount=" + pAmount + ", pCRNAmount=" + pCRNAmount + ", pPercent=" + pPercent + ", people="
				+ people + ", pEN=" + pEN + ", uploadFile=" + uploadFile + "]";
	}

	
	
}
