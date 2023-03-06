package com.startoup.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 회원 가입
	final String INSERT_MEMBERS = "INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE)"
			+ " VALUES(?,?,?,?,?,?,to_char(sysdate,'rr.mm.dd'));";
	// 카카오 회원 가입
	final String INSERT_KAKAO_MEMBERS = "INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_REGDATE)"
			+ " VALUES(?,'KAKAO',?,?,?,to_char(sysdate,'rr.mm.dd')";
	// 회원 탈퇴 및 삭제
	final String DELETE_MEMBERS = "DELETE FROM MEMBERS WHERE M_ID=?";
	// 회원 전체보기
	final String SELECT_ALL_MEMBERS = "SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS";
	// 회원 자세히보기
	final String SELECT_ONE_MEMBERS = "SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE"
			+ " FROM MEMBERS WHERE M_ID=?";
	// 로그인
	final String LOGIN_MEMBERS = "SELECT * FROM MEMBERS WHERE M_ID=? AND M_PW=?";
	// 내 펀딩 목록 추가
	final String INSERT_MYFUNDING= "INSERT INTO MYFUNDING(MF_NUM, MF_MID, MF_PID) VALUES((SELECT NVL(MAX(MF_NUM), 0) + 1 FROM MYFUNDING),?,?)";
	// 내 펀딩 목록 보기
	final String SELECT_ALL_FUNDING = "SELECT a.M_ID, b.MF_NUM, b.MF_PID"
			+ " FROM MEMBERS a INNER JOIN MYFUNDING b ON a.M_ID = b.MF_MID";
	// 내 찜 목록 추가
	final String INSERT_MYLIKE = "INSERT INTO MYLIKE(ML_NUM, ML_MID, ML_PID) VALUES((SELECT NVL(MAX(ML_NUM), 0) + 1 FROM MYLIKE),?,?)";
	// 내 찜 목록 삭제
	final String DELETE_MYLIKE = "DELETE FROM MYLIKE WHERE ML_NUM=?";
	// 내 찜 목록 보기
	final String SELECT_ALL_MYLIKE = "SELECT a.M_ID, b.ML_NUM, b.ML_PID"
			+ " FROM MEMBERS a INNER JOIN MYLIKE b ON a.M_ID = b.ML_MID";
	// 내 찜 여부 확인
	final String SELECT_ONE_MYLIKE = "SELECT * FROM MYLIKE WHERE ML_PID=? AND ML_MID=?";

	// 회원가입
	public boolean insertMember(MemberVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_MEMBERS, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail1(), vo.getmEmail2(), vo.getmNum(), vo.getmRegdate());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 카카오회원가입
	public boolean insertKakao(MemberVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_KAKAO_MEMBERS, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail1(), vo.getmEmail2(),vo.getmRegdate());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 회원삭제(탈퇴)
	public boolean deleteMember(MemberVO vo) {
		try {
			int res=jdbcTemplate.update(DELETE_MEMBERS, vo.getmId());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 회원 전체보기
	public List<MemberVO> selectAll(MemberVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_MEMBERS, new MemberRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	// 회원 자세히보기
	public MemberVO selectOne(MemberVO vo) {
		Object[] args= { vo.getmId() };
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_MEMBERS, args, new MemberRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		Object[] args= { vo.getmId(), vo.getmPw() };
		try {
			return jdbcTemplate.queryForObject(LOGIN_MEMBERS, args, new MemberRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	// 로그아웃
	
	// 내 펀딩 목록 추가
	public boolean insertFund(MyFundingVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_MYFUNDING, vo.getMfNum(), vo.getMfMid(), vo.getMfPid());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 펀딩 목록 보기
	public List<MyFundingVO> selectAllFund(MyFundingVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_FUNDING, new MyFundingRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	// 내 찜 목록 추가
	public boolean insertList(MyLikeVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_MYLIKE, vo.getMlNum(), vo.getMlMid(), vo.getMlPid());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 찜 목록 삭제
	public boolean deleteList(MyLikeVO vo) {
		try {
			int res=jdbcTemplate.update(DELETE_MYLIKE, vo.getMlNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	// 내 찜 목록 보기
	public List<MyLikeVO> selectAllList(MyLikeVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_MYLIKE, new MyLikeRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	// 내 찜 여부 확인
	public MyLikeVO checkList(MyLikeVO vo) {
		Object[] args= { vo.getMlPid(), vo.getMlMid() };
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_MYLIKE, args, new MyLikeRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
}

class MemberRowMapper implements RowMapper<MemberVO> {

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data=new MemberVO();
		data.setmId(rs.getString("M_ID"));
		data.setmPw(rs.getString("M_PW"));
		data.setmName(rs.getString("M_NAME"));
		data.setmEmail1(rs.getString("M_EMAIL1"));
		data.setmEmail2(rs.getString("M_EMAIL2"));
		data.setmNum(rs.getString("M_NUM"));
		data.setmRegdate(rs.getDate("M_REGDATE"));
		return data;
	}
}

class MyFundingRowMapper implements RowMapper<MyFundingVO> {

	@Override
	public MyFundingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MyFundingVO data=new MyFundingVO();
		data.setMfNum(rs.getInt("MF_NUM"));
		data.setMfMid(rs.getString("MF_MID"));
		data.setMfPid(rs.getInt("MF_PID"));
		return data;
	}
}

class MyLikeRowMapper implements RowMapper<MyLikeVO> {

	@Override
	public MyLikeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MyLikeVO data=new MyLikeVO();
		data.setMlNum(rs.getInt("ML_NUM"));
		data.setMlMid(rs.getString("ML_MID"));
		data.setMlPid(rs.getInt("ML_PID"));
		return data;
	}
}