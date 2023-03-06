package com.startoup.biz.funding;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.startoup.biz.product.ProductVO;

@Repository("fundingDAO")
public class FundingDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 펀딩 목록 추가
	final String INSERT_FUNDING = "INSERT INTO FUNDING(F_NUM, F_PID, F_AMOUNT) VALUES( (SELECT NVL(MAX(F_NUM), 0) + 1 FROM FUNDING), (SELECT NVL(MAX(P_NUM), 0) FROM PRODUCT), ?);";
	// 펀딩 상태 변경
	final String UPDATE_FUNDING = "UPDATE FUNDING SET F_CRNAMOUNT=((SELECT F_CRNAMOUNT FROM FUNDING WHERE F_PID=?) + (SELECT P_PRICE FROM PRODUCT WHERE P_NUM=?)) WHERE F_PID=?";
	// 펀딩 전체 목록 보기
	final String SELECT_ALL_FUNDING = "SELECT F_NUM, F_PID, F_AMOUNT, F_CRNAMOUNT FROM FUNDING";
	// 펀딩 목록 하나 보기
	final String SELECT_ONE_FUNDING = "SELECT F_NUM, F_PID, F_AMOUNT, F_CRNAMOUNT FROM FUNDING WHERE F_NUM=?";

	public boolean insertFunding(FundingVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_FUNDING, vo.getfAmount());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean updateFunding(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(UPDATE_FUNDING, vo.getpNum(), vo.getpNum(), vo.getpNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public List<FundingVO> selectAll(ProductVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_FUNDING, new FundingRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	public FundingVO selectOne(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_FUNDING, args, new FundingRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	// 펀딩 진행도 (퍼센트)
	public int progressFunding(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			int res=0;
			FundingVO fvo = jdbcTemplate.queryForObject(SELECT_ONE_FUNDING, args, new FundingRowMapper());
			res=(fvo.getfAmount()/fvo.getfCRNAmount())*100;
			return res;
		} catch(Exception e) {
			return 0;
		}
	}


	class FundingRowMapper implements RowMapper<FundingVO> {

		@Override
		public FundingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			FundingVO data=new FundingVO();
			data.setfNum(rs.getInt("F_Num"));
			data.setfPid(rs.getInt("F_PID"));
			data.setfCRNAmount(rs.getInt("F_AMOUNT"));
			data.setfAmount(rs.getInt("F_CRNAMOUNT"));
			return data;
		}

	}

}
