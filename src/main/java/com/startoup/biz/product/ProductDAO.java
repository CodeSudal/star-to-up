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
	final String INSERT_PRODUCT = "INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_INFO, P_IMAGE) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?)";
	// 제품정보변경
	final String UPDATE_PRODUCT = "UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?. P_IMAGE=? WHERE P_NUM=?;";
	// 펀딩 완료 시(제품 펀딩 종료하기)
	final String UPDATE_FINISH = "UPDATE PRODUCT SET P_FINISH=1 WHERE P_NUM=?;";
	// 제품삭제
	final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
	// 전체 제품 출력(SELECT ALL)
	final String SELECT_ALL_PRODUCT = "SELECT * FROM PRODUCT";
	// 제품 하나 출력(SELECT ONE)
	final String SELECT_ONE_PRODUCT = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE FROM PRODUCT WHERE P_NUM=?";
	// 제품 펀딩 확인 기능(펀딩 진행중 0, 끝났으면 1), checkEnd
	final String SELECT_ONE_FINISH = "SELECT P_FINISH FROM PRODUCT WHERE P_NUM=?";
	
// 사용 예) if(!checkEnd){updateFinish}

	public boolean insertProduct(ProductVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpInfo(), vo.getpImage());
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
