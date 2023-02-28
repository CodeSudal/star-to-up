package com.startoup.biz.member;

import java.util.Date;
import java.util.List;

public class MemberVO {
	private String mId;	// 아이디
	private String mPw;	// 비밀번호
	private String mName;	// 이름
	private String mEmail1;	// 이메일(앞)
	private String mEmail2;	// 이메일(뒤)
	private String mNum;	// 전화번호
	private Date mRegdate;	// 가입일자
	private List<MyFundingVO> mPlist; // 회원 펀딩 목록
	private List<MyLikeVO> mLlist; // 회원 찜 목록
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmEmail1() {
		return mEmail1;
	}
	public void setmEmail1(String mEmail1) {
		this.mEmail1 = mEmail1;
	}
	public String getmEmail2() {
		return mEmail2;
	}
	public void setmEmail2(String mEmail2) {
		this.mEmail2 = mEmail2;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public Date getmRegdate() {
		return mRegdate;
	}
	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}
	public List<MyFundingVO> getmPlist() {
		return mPlist;
	}
	public void setmPlist(List<MyFundingVO> mPlist) {
		this.mPlist = mPlist;
	}
	public List<MyLikeVO> getmLlist() {
		return mLlist;
	}
	public void setmLlist(List<MyLikeVO> mLlist) {
		this.mLlist = mLlist;
	}
	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mEmail1=" + mEmail1 + ", mEmail2="
				+ mEmail2 + ", mNum=" + mNum + ", mRegdate=" + mRegdate + ", mPlist=" + mPlist + ", mLlist=" + mLlist
				+ "]";
	}
	

	
}
