package com.startoup.biz.member;

import java.util.List;

import com.startoup.biz.product.ProductVO;

public interface MemberService {
	public boolean insertMember(MemberVO vo);
	public boolean insertKakaoMember(MemberVO vo);
	public boolean deleteMember(MemberVO vo);
	public List<MemberVO> selectAllMember(MemberVO vo);
	public MemberVO selectOneMember(MemberVO vo);
	public MemberVO selectKakaoMember(MemberVO vo);
	public MemberVO selectOneEmail(MemberVO vo);
	public MemberVO loginMember(MemberVO vo);
	public boolean insertFunding(MyFundingVO vo);
	public List<MyFundingVO> selectAllFund(MyFundingVO vo);
	public boolean insertLike(MyLikeVO vo);
	public boolean deleteLike(MyLikeVO mlvo);
	public boolean deleteLikeList(List<Integer> list, MyLikeVO mlvo);
	public List<MyLikeVO> selectAllLike(MyLikeVO vo);
	public MyLikeVO checkLike(MyLikeVO vo);
	public MyLikeVO countLike(MyLikeVO vo);
	public List<ProductVO> myLikeList(MyLikeVO vo);
	public List<ProductVO> myFundList(MyFundingVO vo);
	public MyFundingVO checkDuplication(MyFundingVO vo);

}
