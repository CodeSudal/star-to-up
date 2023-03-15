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
	
	// 상품 확인
	final String SELECT_ALL_PRODUCT = "SELECT P_NAME, P_INFO FROM PRODUCT";
	// 크롤링 정보 DB에 저장
	final String INSERT_CRAWLING = "INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), ?, ?)";
	// 상품 INFO 업데이트
	final String UPDATE_PINFO = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)";
	// SELECTONE
	final String SELECT_ONE_CRAWLING = "SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING WHERE C_NAME = ?";
	// SELECTALL
	final String SELECT_ALL_CRAWLING = "SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING";
	
	public boolean crawling() {
		// DB(크롤링 테이블)에 저장해줄 sel 객체
		SeleniumVO sel = new SeleniumVO();
		// 제품 SELECTALL을 담기 위한 배열
		List<SeleniumVO> datas;
		// 크롤링 DB에 있는 정보 개수 확인을 위한 배열
		List<SeleniumVO> cdb;
		// 셀레니움 크롤링 대상 이름
		String title;
		// 셀레니움 크롤링 대상 정보
		String info;

		try {
			// 이미 크롤링 데이터가 9개 이상이라면 크롤링 Skip
			cdb=jdbcTemplate.query(SELECT_ALL_CRAWLING, new CSeleniumRowMapper());
			if(cdb.size()>8) { return true; }
			
			// 셀레니움 크롤링 함수 호출
			DriverUtil.crawling();
			
			// forEach문을 돌면서 크롤링 정보가 담긴 map에 있는 정보들을
			// DB에 저장
			for (Entry<String, String> entrySet : DriverUtil.craw.entrySet()) {
				sel.setcName(entrySet.getKey());
				sel.setcInfo(entrySet.getValue());
				Object[] args= { sel.getcName() };
				
				// DB에 이미 있는 정보라면 skip하고 다음 정보로
				try{jdbcTemplate.queryForObject(SELECT_ONE_CRAWLING, args, new CSeleniumRowMapper());
					continue;
				} catch(EmptyResultDataAccessException e){
					jdbcTemplate.update(INSERT_CRAWLING, sel.getcName(), sel.getcInfo());
				}
			}
			
			// SELECTALL로 현재 제품 리스트 저장
			datas=jdbcTemplate.query(SELECT_ALL_PRODUCT, new PSeleniumRowMapper());
			// 제품 개수만큼 for문을 돌면서 크롤링한 데이터(INFO)로 UPDATE
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
			System.out.println(e);
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
