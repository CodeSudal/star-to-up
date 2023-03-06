package com.startoup.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mdao;

	@Override
	public boolean insertMember(MemberVO vo) {
		return mdao.insertMember(vo);
	}

	@Override
	public boolean insertKakaoMember(MemberVO vo) {
		return mdao.insertKakao(vo);
	}

	@Override
	public boolean deleteMember(MemberVO vo) {
		return mdao.deleteMember(vo);
	}

	@Override
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return mdao.selectAll(vo);
	}

	@Override
	public MemberVO selectOneMember(MemberVO vo) {
		return mdao.selectOne(vo);
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		return mdao.login(vo);
	}

	@Override
	public boolean insertFunding(MyFundingVO vo) {
		return mdao.insertFund(vo);
	}

	@Override
	public List<MyFundingVO> selectAllFund(MyFundingVO vo) {
		return mdao.selectAllFund(vo);
	}

	@Override
	public boolean insertList(MyLikeVO vo) {
		return mdao.insertList(vo);
	}

	@Override
	public boolean deleteList(MyLikeVO vo) {
		return mdao.deleteList(vo);
	}

	@Override
	public List<MyLikeVO> selectAllList(MyLikeVO vo) {
		return mdao.selectAllList(vo);
	}

}
