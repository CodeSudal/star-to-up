package com.startoup.biz.product;

import java.util.List;

import com.startoup.biz.list.ListVO;

public class ProductVO {
	private int pNum; // 제품번호
	private String pName; // 제품이름
	private int pPrice; // 펀딩금액
	private String pInfo; // 제품설명
	private int pFinish; // 펀딩종료확인, 0이면 진행중 1이면 끝
	private String pImage; // 제품 이미지
	private List<ListVO> pList; // 해당 제품 펀딩 회원리스트
	
	public int getpNum() {
		return pNum;
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
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	public List<ListVO> getpList() {
		return pList;
	}
	public void setpList(List<ListVO> pList) {
		this.pList = pList;
	}
	@Override
	public String toString() {
		return "ProductVO [pNum=" + pNum + ", pName=" + pName + ", pPrice=" + pPrice + ", pInfo=" + pInfo + ", pFinish="
				+ pFinish + ", pImage=" + pImage + ", getpNum()=" + getpNum() + ", getpName()=" + getpName()
				+ ", getpPrice()=" + getpPrice() + ", getpInfo()=" + getpInfo() + ", getpFinish()=" + getpFinish()
				+ ", getpImage()=" + getpImage() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	

}
