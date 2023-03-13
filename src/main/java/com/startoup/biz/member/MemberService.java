package com.startoup.biz.member;

import java.util.List;

public interface MemberService {
	public boolean insertMember(MemberVO vo);
	public boolean insertKakaoMember(MemberVO vo);
	public boolean deleteMember(MemberVO vo);
	public List<MemberVO> selectAllMember(MemberVO vo);
	public MemberVO selectOneMember(MemberVO vo);
	public MemberVO selectOneEmail(MemberVO vo);
	public MemberVO loginMember(MemberVO vo);
	public boolean insertFunding(MyFundingVO vo);
	public List<MyFundingVO> selectAllFund(MyFundingVO vo);
	public boolean insertLike(MyLikeVO vo);
	public boolean deleteLike(MyLikeVO vo);
	public List<MyLikeVO> selectAllLike(MyLikeVO vo);
	public MyLikeVO checkLike(MyLikeVO vo);

}
