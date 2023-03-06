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
	final String INSERT_MYFUNDING= "INSERT INTO MYFUNDING(MF_NUM, MF_MID, MF_PID) VALUES(?,?,?)";
	// 내 펀딩 목록 보기
	final String SELECT_ALL_FUNDING = "SELECT a.M_ID, b.MF_NUM, b.MF_PID"
			+ " FROM MEMBERS a INNER JOIN MYFUNDING b ON a.M_ID = b.MF_MID";
	// 내 찜 목록 추가
	final String INSERT_MYLIKE = "INSERT INTO MYLIKE(ML_NUM, ML_PID, ML_PID) VALUES(?,?,?)";
	// 내 찜 목록 삭제
	final String DELETE_MYLIKE = "DELETE FROM MYLIKE WHERE ML_NUM=?";
	// 내 찜 목록 보기
	final String SELECT_ALL_MYLIKE = "SELECT a.M_ID, b.ML_NUM, b.ML_PID"
			+ " FROM MEMBERS a INNER JOIN MYLIKE b ON a.M_ID = b.ML_MID";
	
	
	public boolean insertProduct(MemberVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_MEMBERS, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail1(), vo.getmEmail2(), vo.getmNum(), vo.getmNum());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public boolean updateProduct(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(UPDATE_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpInfo(), vo.getpImage(), vo.getpNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public boolean updateFinish(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(UPDATE_FINISH, vo.getpNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	public boolean deleteProduct(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(DELETE_PRODUCT, vo.getpNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public List<ProductVO> selectAll(ProductVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_PRODUCT, new ProductRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	public ProductVO selectOne(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_PRODUCT, args, new ProductRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	// true == 펀딩 진행중, false == 펀딩 종료(목표 금액 달성)
	public boolean checkEnd(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			jdbcTemplate.queryForObject(SELECT_ONE_FINISH, args, new ProductRowMapper());
			int res=vo.getpFinish();
			if(res==0) { return true; }
		} catch(Exception e) {
			return false;
		}
		return false;
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
		data.setmRegdate(rs.getString("M_REGDATE"));
		return data;
	}
}
