package com.startoup.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	// 로그아웃
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
	
}
