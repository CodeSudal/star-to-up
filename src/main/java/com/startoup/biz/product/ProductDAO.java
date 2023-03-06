package com.startoup.biz.product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 제품추가
	final String INSERT_PRODUCT = "INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_INFO, P_IMAGE, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?, ?)";
	// 제품정보변경
	final String UPDATE_PRODUCT = "UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?, P_IMAGE=?, P_AMOUNT=? WHERE P_NUM=?";
	// 제품삭제
	final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
	// 전체 제품 출력(SELECT ALL)
	final String SELECT_ALL_PRODUCT = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE, P_AMOUNT, P_CRNAMOUNT FROM PRODUCT";
	// 제품 하나 출력(SELECT ONE)
	final String SELECT_ONE_PRODUCT = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE, P_AMOUNT, P_CRNAMOUNT FROM PRODUCT WHERE P_NUM=?";
	
	
	// 펀딩 완료 되었는지 확인
	final String CHECK_FINISH = "SELECT F_AMOUNT, F_CRNAMOUNT FROM FUNDING WHERE F_PID = ?";
	// 펀딩 완료 시(제품 펀딩 종료하기)
	final String UPDATE_FINISH = "UPDATE PRODUCT SET P_FINISH=1 WHERE P_NUM=?";
	
	// 사용법
	// checkEnd() == 사용자가 구매할 때 마다 실행시켜주면 됨
	
	// 펀딩 목록 추가
	final String INSERT_FUNDING = "INSERT INTO FUNDING(F_NUM, F_PID, F_AMOUNT) VALUES( (SELECT NVL(MAX(F_NUM), 0) + 1 FROM FUNDING), (SELECT NVL(MAX(P_NUM), 0) FROM PRODUCT), ?);";
	// 펀딩 상태 변경
	final String UPDATE_FUNDING = "UPDATE FUNDING SET F_CRNAMOUNT=((SELECT F_CRNAMOUNT FROM FUNDING WHERE F_PID=?) + (SELECT P_PRICE FROM PRODUCT WHERE P_NUM=?)) WHERE F_PID=?";
	// 펀딩 전체 목록 보기
	final String SELECT_ALL_FUNDING = "SELECT F_NUM, F_PID, F_AMOUNT, F_CRNAMOUNT FROM FUNDING";
	// 펀딩 목록 하나 보기
	final String SELECT_ONE_FUNDING = "SELECT F_NUM, F_PID, F_AMOUNT, F_CRNAMOUNT FROM FUNDING WHERE F_NUM=?";

	public boolean insertFunding(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_FUNDING, vo.getpAmount());
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

	public List<ProductVO> selectAllFunding(ProductVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_FUNDING, new ProductRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	public ProductVO selectOneFunding(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			return jdbcTemplate.queryForObject(SELECT_ONE_FUNDING, args, new ProductRowMapper());
		} catch(Exception e) {
			return null;
		}
	}
	
	// 펀딩 진행도 (퍼센트)
	public int progressFunding(ProductVO vo) {
		Object[] args= { vo.getpNum() };
		try {
			int res=0;
			ProductVO pvo = jdbcTemplate.queryForObject(SELECT_ONE_FUNDING, args, new ProductRowMapper());
			res=(pvo.getpAmount()/pvo.getpCRNAmount())*100;
			return res;
		} catch(Exception e) {
			return 0;
		}
	}

	public boolean insertProduct(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpInfo(), vo.getpImage());
			if(res<1) { return false; }
			jdbcTemplate.update(INSERT_FUNDING, vo.getpAmount());
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
	
	public boolean deleteProduct(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(DELETE_PRODUCT, vo.getpNum());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public List<ProductVO> selectAllProduct(ProductVO vo){
		try {
			return jdbcTemplate.query(SELECT_ALL_PRODUCT, new ProductRowMapper());
		} catch(Exception e) {
			return null;
		}
	}

	public ProductVO selectOneProduct(ProductVO vo) {
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
			jdbcTemplate.queryForObject(CHECK_FINISH, args, new ProductRowMapper());
			if(vo.getpAmount()==vo.getpCRNAmount()) {
				jdbcTemplate.update(UPDATE_FINISH, vo.getpNum());
				return true;
			}
			else {
				return true;
			}
		} catch(Exception e) {
			return false;
		}
	}


}

class ProductRowMapper implements RowMapper<ProductVO> {

	@Override
	public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductVO data=new ProductVO();
		data.setpNum(rs.getInt("P_NUM"));
		data.setpName(rs.getString("P_NAME"));
		data.setpPrice(rs.getInt("P_PRICE"));
		data.setpInfo(rs.getString("P_INFO"));
		data.setpFinish(rs.getInt("P_FINISH"));
		data.setpImage(rs.getString("P_IMAGE"));
		return data;
	}

}

//class FundingRowMapper implements RowMapper<FundingVO> {
//
//	@Override
//	public FundingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		FundingVO data=new FundingVO();
//		data.setfNum(rs.getInt("F_NUM"));
//		data.setfPid(rs.getInt("F_PID"));
//		data.setfCRNAmount(rs.getInt("F_AMOUNT"));
//		data.setfAmount(rs.getInt("F_CRNAMOUNT"));
//		return data;
//	}
//
//}
//
//class PFundingRowMapper implements RowMapper<PFundingVO> {
//
//	@Override
//	public PFundingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		PFundingVO data=new PFundingVO();
//		data.setpNum(rs.getInt("P_NUM"));
//		data.setpName(rs.getString("P_NAME"));
//		data.setpPrice(rs.getInt("P_PRICE"));
//		data.setpInfo(rs.getString("P_INFO"));
//		data.setpFinish(rs.getInt("P_FINISH"));
//		data.setpImage(rs.getString("P_IMAGE"));
//		
//		data.setfNum(rs.getInt("F_NUM"));
//		data.setfPid(rs.getInt("F_PID"));
//		data.setfCRNAmount(rs.getInt("F_AMOUNT"));
//		data.setfAmount(rs.getInt("F_CRNAMOUNT"));
//		return data;
//	}
// 	
//}

