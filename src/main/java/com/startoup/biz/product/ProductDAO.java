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
	final String UPDATE_PRODUCT = "UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?. P_IMAGE=? WHERE P_NUM=?;";
	// 제품삭제
	final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
	// 전체 제품 출력(SELECT ALL)
	final String SELECT_ALL_PRODUCT = "SELECT * FROM PRODUCT";
	// 제품 하나 출력(SELECT ONE)
	final String SELECT_ONE_PRODUCT = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE FROM PRODUCT WHERE P_NUM=?";
	// 제품 펀딩 확인 기능(펀딩 진행중 0, 끝났으면 1), checkEnd
	final String SELECT_ONE_FINISH = "SELECT P_FINISH FROM PRODUCT WHERE P_NUM=?";
	
	
}
