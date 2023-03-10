package com.startoup.biz.crawling;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("crawlingDAO")
public class CrawlingDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	final String SELECT_ALL_PRODUCT = "SELECT P_NAME, P_INFO FROM PRODUCT";
	final String INSERT_CRAWLING = "INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), ?, ?)";
	final String UPDATE_PINFO = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = ?)";

	//	public static void main(String[] args) {
	//		DriverUtil.crawling();
	//	}

	public boolean crawling(SeleniumVO sel) {
		List<SeleniumVO> datas;
		String title;
		String info;
		
		try {
			DriverUtil.crawling();
			datas=jdbcTemplate.query(SELECT_ALL_PRODUCT, new PSeleniumRowMapper());
			for(int i=0; i<datas.size(); i++) {
				title=datas.get(i).getpName();
				info=DriverUtil.craw.get(title);

				sel.setcName(title);
				sel.setcInfo(info);
			}
			int res=jdbcTemplate.update(INSERT_CRAWLING, sel.getcName(), sel.getcInfo());
			if(res<1) { return false; }
			res=jdbcTemplate.update(UPDATE_PINFO, sel.getcName());
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

}

class PSeleniumRowMapper implements RowMapper<SeleniumVO> {

	@Override
	public SeleniumVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeleniumVO data=new SeleniumVO();
		data.setpInfo(rs.getString("P_INFO"));
		data.setpName(rs.getString("P_NAME"));
		return data;
	}

}

class CSeleniumRowMapper implements RowMapper<SeleniumVO> {

	@Override
	public SeleniumVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeleniumVO data=new SeleniumVO();
		data.setcInfo(rs.getString("C_INFO"));
		data.setcNum(rs.getInt("C_NUM"));
		data.setcName(rs.getString("C_NAME"));
		return data;
	}

}
