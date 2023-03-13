package com.startoup.biz.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("emailDAO")
public class EmailDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
}
