package com.startoup.biz.mylike;

public class MyLikeVO {
	private int mlNum;	// 내 찜 정보 번호
	private String mlMid; // 찜한 대상 아이디
	private int mlPid; // 찜한 대상 제품
	
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
		return "MyLikeVO [mlNum=" + mlNum + ", mlMid=" + mlMid + ", mlPid=" + mlPid + "]";
	}
	
	
}
