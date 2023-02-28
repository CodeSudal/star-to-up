package com.startoup.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 회원 가입
	final String INSERT_MEMBERS = "INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE) VALUES(?,?,?,?,?,?,to_char(sysdate,'rr.mm.dd'));";
	// 카카오 회원 가입
	final String INSERT_KAKAO_MEMBERS = "INSERT INTO MEMBERS(M_ID, M_PW, M_NAME, M_EMAIL1, M_EMAIL2, M_REGDATE) VALUES(?,'KAKAO',?,?,?,to_char(sysdate,'rr.mm.dd')";
	// 관리자 회원관리 페이지
	final String SELECT_ALL_MEMBERS = "SELECT M_ID, M_NAME, M_EMAIL1, M_EMAIL2, M_NUM, M_REGDATE FROM MEMBERS";
	// 로그인
	final String LOGIN_MEMBERS = "SELECT * FROM MEMBERS WHERE M_ID=? AND M_PW=?";
	// 회원 탈퇴 및 삭제
	final String DELETE_MEMBERS = "DELETE FROM MEMBERS WHERE M_ID=?";
}
