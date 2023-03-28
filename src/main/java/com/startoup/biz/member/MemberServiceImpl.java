package com.startoup.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.startoup.biz.product.ProductVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO2 mdao;

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
		return mdao.selectAllMember(vo);
	}

	@Override
	public MemberVO selectOneMember(MemberVO vo) {
		return mdao.selectOneMember(vo);
	}
	
	@Override
	public MemberVO selectOneEmail(MemberVO vo) {
		return mdao.selectOneEmail(vo);
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
	public boolean insertLike(MyLikeVO vo) {
		return mdao.insertLike(vo);
	}


	@Override
	public List<MyLikeVO> selectAllLike(MyLikeVO vo) {
		return mdao.selectAllLike(vo);
	}

	@Override
	public MyLikeVO checkLike(MyLikeVO vo) {
		return mdao.checkLike(vo);
	}

	@Override
	public List<ProductVO> myLikeList(MyLikeVO vo) {
		return mdao.myLikeList(vo);
	}

	@Override
	public boolean deleteLike(MyLikeVO mlvo) {
		return mdao.deleteLike(mlvo);
	}

	@Override
	public boolean deleteLikeList(List<Integer> list, MyLikeVO mlvo) {
		return mdao.deleteLikeList(list, mlvo);
	}

	@Override
	public List<ProductVO> myFundList(MyFundingVO vo) {
		return mdao.myFundList(vo);
	}

	@Override
	public MyLikeVO countLike(MyLikeVO vo) {
		return mdao.countLike(vo);
	}

	@Override
	public MemberVO selectKakaoMember(MemberVO vo) {
		return mdao.selectKakaoMember(vo);
	}

	@Override
	public MyFundingVO checkDuplication(MyFundingVO vo) {
		return mdao.checkDuplication(vo);
	}

	
	

}
