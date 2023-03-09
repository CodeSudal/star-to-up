package com.startoup.biz.member;

import java.util.List;

public interface MemberService {
	public boolean insertMember(MemberVO vo);
	public boolean insertKakaoMember(MemberVO vo);
	public boolean deleteMember(MemberVO vo);
	public List<MemberVO> selectAllMember(MemberVO vo);
	public MemberVO selectOneMember(MemberVO vo);
	public MemberVO loginMember(MemberVO vo);
	public boolean insertFunding(MyFundingVO vo);
	public List<MyFundingVO> selectAllFund(MyFundingVO vo);
	public boolean insertList(MyLikeVO vo);
	public boolean deleteList(MyLikeVO vo);
	public List<MyLikeVO> selectAllList(MyLikeVO vo);
	public MyLikeVO checkList(MyLikeVO vo);

}
