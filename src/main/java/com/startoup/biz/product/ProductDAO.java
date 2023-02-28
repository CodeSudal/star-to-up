package com.startoup.biz.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 제품추가
	final String INSERT_PRODUCT = "INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_INFO, P_IMAGE) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?)";
	// 제품정보변경
	final String UPDATE_PRODUCT = "";
	// 제품삭제
	final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
	// 전체 제품 출력
	final String SELECT_ALL_PRODUCT = "SELECT * FROM PRODUCT";
	
	
}
