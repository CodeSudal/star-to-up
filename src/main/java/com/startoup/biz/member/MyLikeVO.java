package com.startoup.biz.member;

import java.util.List;

public class MyLikeVO {
	private int mlNum;	// 내 찜 정보 번호
	private String mlMid; // 찜한 대상 아이디
	private int mlPid; // 찜한 대상 제품
	private List<Integer> pList; // 찜 목록 제품 번호 받아올 Int 타입 리스트
	
	public List<Integer> getpList() {
		return pList;
	}
	public void setpList(List<Integer> pList) {
		this.pList = pList;
	}
	public int getMlNum() {
		return mlNum;
	}
	public void setMlNum(int mlNum) {
		this.mlNum = mlNum;
	}
	public String getMlMid() {
		return mlMid;
	}
	public void setMlMid(String mlMid) {
		this.mlMid = mlMid;
	}
	public int getMlPid() {
		return mlPid;
	}
	public void setMlPid(int mlPid) {
		this.mlPid = mlPid;
	}
	@Override
	public String toString() {
		return "MyLikeVO [mlNum=" + mlNum + ", mlMid=" + mlMid + ", mlPid=" + mlPid + ", pList=" + pList + "]";
	}
	
	
}
