package com.startoup.biz.crawling;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("crawlingDAO")
public class CrawlingDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	final String SELECT_ALL_PRODUCT = "SELECT P_NAME, P_INFO FROM PRODUCT";
	final String INSERT_CRAWLING = "INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), ?, ?)";
	final String UPDATE_PINFO = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)";
	final String SELECT_ONE_CRAWLING = "SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING WHERE C_NAME = ?";
	
	public boolean crawling() {
		SeleniumVO sel = new SeleniumVO();
		List<SeleniumVO> datas;
		String title;
		String info;

		try {
			DriverUtil.crawling();

			//DriverUtil.craw.forEach((key, value) -> System.out.println(key + " : " + value));
			
			for (Entry<String, String> entrySet : DriverUtil.craw.entrySet()) {
				sel.setcName(entrySet.getKey());
				sel.setcInfo(entrySet.getValue());
				System.out.println(sel.getcName());
				Object[] args= { sel.getcName() };
				try{jdbcTemplate.queryForObject(SELECT_ONE_CRAWLING, args, new CSeleniumRowMapper());
					continue;
				} catch(EmptyResultDataAccessException e){
					jdbcTemplate.update(INSERT_CRAWLING, sel.getcName(), sel.getcInfo());
				}
			}
			
			datas=jdbcTemplate.query(SELECT_ALL_PRODUCT, new PSeleniumRowMapper());
			for(int i=0; i<datas.size(); i++) {
				title=datas.get(i).getpName();
				info=DriverUtil.craw.get(title);
				if(title==null || info==null) { continue; }
				sel.setcName(title);
				sel.setcInfo(info);
				jdbcTemplate.update(UPDATE_PINFO);
			}
			return true;
		} catch(Exception e) {
			System.out.println("뭔에러: "+e);
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
