package com.startoup.biz.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
