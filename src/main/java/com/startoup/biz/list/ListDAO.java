package com.startoup.biz.list;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("listDAO")
public class ListDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 펀딩 목록 추가
	final String INSERT_LISTS = "INSERT INTO LISTS(L_NUM, L_PID, L_MID) VALUES( (SELECT NVL(MAX(F_NUM), 0) + 1 FROM LISTS), ?, ?)";
	// 펀딩 SELECT_ALL (제품으로 검색) == 제품을 구매한 고객 리스트
	final String SELECT_ALL_MEMEBER = "SELECT L_NUM, L_PID, L_MID FROM LISTS WHERE L_PID=?";
	// 펀딩 SELECT_ALL (아이디로 검색) == 회원이 구매한 제품 리스트
	final String SELECT_ALL_PRODUCT = "SELECT L_NUM, L_PID, L_MID FROM LISTS WHERE L_MID=?";
	// 펀딩한 사람 인원 수
	final String SELECT_COUNT = "SELECT COUNT(L_NUM) FROM LISTS WHERE L_PID=?";
	
	
	// 사용자가 구매했다면 실행 (구매자 리스트 추가)
	public boolean insertList(ListVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_LISTS, vo.getlPid(), vo.getlMid());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public List<ListVO> selectAllMember(ListVO vo){
		try {
			Object[] args= { vo.getlMid() };
			return jdbcTemplate.query(SELECT_ALL_MEMEBER, args, new ListRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	public List<ListVO> selectAllProduct(ListVO vo){
		try {
			Object[] args= { vo.getlPid() };
			return jdbcTemplate.query(SELECT_ALL_PRODUCT, args, new ListRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	// 사람 수 세기
	public ListVO selectCount(ListVO vo) {
		try {
			Object[] args= { vo.getlPid() };
			Object cnt = jdbcTemplate.query(SELECT_COUNT, args, new ListRowMapper());
			vo.setlCnt((int)cnt);
			return vo;
		} catch(Exception e) {
			return null;
		}
	}
	
	
	class ListRowMapper implements RowMapper<ListVO> {

		@Override
		public ListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ListVO data=new ListVO();
			data.setlNum(rs.getInt("L_NUM"));
			data.setlPid(rs.getInt("L_PID"));
			data.setlMid(rs.getString("L_MID"));
			data.setlCnt(rs.getInt("COUNT(L_NUM)"));
			return data;
		}

	}

}
