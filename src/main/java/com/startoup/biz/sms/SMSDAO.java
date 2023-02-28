package com.startoup.biz.sms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("smsDAO")
public class SMSDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
