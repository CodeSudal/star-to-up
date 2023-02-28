package com.startoup.biz.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("fundingDAO")
public class FundingDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
