package com.startoup.biz.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO2 {
	// Mybatis 프레임워크
	//  -> 해당 프레임워크에서 제공해주는 객체를 사용해야함!
	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원가입
	public boolean insertMember(MemberVO vo) {
		try {
			int res=mybatis.insert("MemberDAO.insertMember", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 카카오회원가입
	public boolean insertKakao(MemberVO vo) {
		try {
			String mEmail=vo.getmEmail1();
			String mEmail1 = "";
			String mEmail2 = "";
			if(mEmail.contains("@")) {
				String[] arrayE = mEmail.split("@");
				mEmail1 = arrayE[0];
				mEmail2 = arrayE[1];
			}
			vo.setmEmail1(mEmail1);
			vo.setmEmail2(mEmail2);
			int res=mybatis.insert("MemberDAO.insertKakao", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 회원삭제(탈퇴)
	public boolean deleteMember(MemberVO vo) {
		try {
			int res=mybatis.delete("MemberDAO.deleteMember", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 회원 전체보기
	public List<MemberVO> selectAllMember(MemberVO vo){
		try {
			return mybatis.selectList("MemberDAO.selectAllMember", vo);
		} catch(Exception e) {
			return null;
		}
	}

	// 회원 자세히보기
	public MemberVO selectOneMember(MemberVO vo) {
		try {
			return mybatis.selectOne("MemberDAO.selectOneMember", vo);
		} catch(Exception e) {
			return null;
		}
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		try {
			System.out.println("my"+mybatis.selectOne("MemberDAO.login", vo));
			return mybatis.selectOne("MemberDAO.login", vo);
		} catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// 로그아웃
	
	// 내 펀딩 목록 추가
	public boolean insertFund(MyFundingVO vo) {
		try {
			int res=mybatis.insert("MemberDAO.insertFund", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 펀딩 목록 보기
	public List<MyFundingVO> selectAllFund(MyFundingVO vo){
		try {
			return mybatis.selectList("MemberDAO.selectAllMember", vo);
		} catch(Exception e) {
			return null;
		}
	}

	// 내 찜 목록 추가
	public boolean insertLike(MyLikeVO vo) {
		try {
			int res=mybatis.insert("MemberDAO.insertLike", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 찜 목록 삭제
	public boolean deleteLike(MyLikeVO vo) {
		try {
			int res=mybatis.delete("MemberDAO.deleteLike", vo);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 찜 목록 보기
	public List<MyLikeVO> selectAllLike(MyLikeVO vo){
		try {
			return mybatis.selectList("MemberDAO.selectAllLike", vo);
		} catch(Exception e) {
			return null;
		}
	}
	
	// 내 찜 여부 확인
	public MyLikeVO checkLike(MyLikeVO vo) {
		try {
			return mybatis.selectOne("MemberDAO.checkLike", vo);
		} catch(Exception e) {
			return null;
		}
	}
	
	// 내 찜 갯수 보기
	public int countLike(MyLikeVO vo) {
		int result=0;
		try {
			return mybatis.selectOne("MemberDAO.countLike", vo);
		} catch(Exception e) {
			return result;
		}
	}
}

//class MemberRowMapper implements RowMapper<MemberVO> {
//
//	@Override
//	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		MemberVO data=new MemberVO();
//		data.setmId(rs.getString("M_ID"));
//		data.setmPw(rs.getString("M_PW"));
//		data.setmName(rs.getString("M_NAME"));
//		data.setmEmail1(rs.getString("M_EMAIL1"));
//		data.setmEmail2(rs.getString("M_EMAIL2"));
//		data.setmNum(rs.getString("M_NUM"));
//		data.setmRegdate(rs.getDate("M_REGDATE"));
//		return data;
//	}
//}
//
//class MyFundingRowMapper implements RowMapper<MyFundingVO> {
//
//	@Override
//	public MyFundingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		MyFundingVO data=new MyFundingVO();
//		data.setMfNum(rs.getInt("MF_NUM"));
//		data.setMfMid(rs.getString("MF_MID"));
//		data.setMfPid(rs.getInt("MF_PID"));
//		return data;
//	}
//}
//
//class MyLikeRowMapper implements RowMapper<MyLikeVO> {
//
//	@Override
//	public MyLikeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		MyLikeVO data=new MyLikeVO();
//		data.setMlNum(rs.getInt("ML_NUM"));
//		data.setMlMid(rs.getString("ML_MID"));
//		data.setMlPid(rs.getInt("ML_PID"));
//		return data;
//	}
//}