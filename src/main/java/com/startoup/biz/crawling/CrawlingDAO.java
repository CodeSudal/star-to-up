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

import com.startoup.biz.product.NamingVO;

@Repository("crawlingDAO")
public class CrawlingDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 상품 확인
	final String SELECT_ALL_PRODUCT = "SELECT P_NAME, P_INFO FROM PRODUCT";
	// 상품 이름 확인
	final String SELECT_ALL_PRODUCT2 = "SELECT P_NAME, P_EN FROM PRODUCT";
	// 크롤링 정보 DB에 저장
	final String INSERT_CRAWLING = "INSERT INTO CRAWLING( C_NUM, C_NAME, C_INFO) VALUES( (SELECT NVL(MAX(C_NUM), 0) + 1 FROM CRAWLING), ?, ?)";
	// 상품 INFO 업데이트
	final String UPDATE_PINFO = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)";
	// 상품 INFO 업데이트2
	final String UPDATE_PINFO2 = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = ?)";
	// SELECTONE
	final String SELECT_ONE_CRAWLING = "SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING WHERE C_NAME = ?";
	// SELECTALL
	final String SELECT_ALL_CRAWLING = "SELECT C_NUM, C_NAME, C_INFO FROM CRAWLING";
	
	// NAMING SELECTALL
	final String SELECT_ALL_NAMING = "SELECT N_NAME, N_EN FROM NAMING";
	// INSERT NAMING
	final String INSERT_NAMING = "INSERT INTO NAMING(N_NUM, N_NAME, N_EN) VALUES((SELECT NVL(MAX(N_NUM), 0) + 1 FROM NAMING), ?, ?)";
	// 제품 NAME 업데이트
	final String UPDATE_PNAME = "UPDATE PRODUCT P SET P.P_EN = (SELECT N.N_EN FROM NAMING N WHERE P.P_NAME = N.N_NAME)";
	// 제품 NAME 업데이트2
	final String UPDATE_PNAME2 = "UPDATE PRODUCT SET P_EN = ? WHERE P_NAME = ?";
	
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
		// 네이밍을 한글로 해줄 LIST
		List<NamingVO> ndb;
		// 개수 확인
		List<NamingVO> nList;

		try {
			nList=jdbcTemplate.query(SELECT_ALL_NAMING, new NamingRowMapper());
			if(nList.size()<9) { insertNaming(); }
			
			jdbcTemplate.update(UPDATE_PNAME);
					
			ndb=jdbcTemplate.query(SELECT_ALL_PRODUCT2, new PNamingRowMapper());
			
			System.out.println(ndb);
			
			for(int i=0; i<ndb.size(); i++) {
				if(ndb.get(i).getnEN()==null) {
					jdbcTemplate.update(UPDATE_PNAME2, ndb.get(i).getnName(), ndb.get(i).getnName());
				}
			}
			// 이미 크롤링 데이터가 9개 이상이라면 크롤링 Skip
			cdb=jdbcTemplate.query(SELECT_ALL_CRAWLING, new CSeleniumRowMapper());
			
			if(cdb.size()<9) { DriverUtil.crawling(); }
			
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
				jdbcTemplate.update(UPDATE_PINFO2, sel.getcName());
			}
			return true;
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public boolean insertNaming() {
		try {
			if(jdbcTemplate.query(SELECT_ALL_NAMING, new NamingRowMapper()).size()>8) {
				return true;
			}
			jdbcTemplate.update(INSERT_NAMING, "천왕성", "Uranus");
			jdbcTemplate.update(INSERT_NAMING, "수성", "Mercury");
			jdbcTemplate.update(INSERT_NAMING, "지구", "Earth");
			jdbcTemplate.update(INSERT_NAMING, "화성", "Mars");
			jdbcTemplate.update(INSERT_NAMING, "해왕성", "Neptuen");
			jdbcTemplate.update(INSERT_NAMING, "토성", "Saturn");
			jdbcTemplate.update(INSERT_NAMING, "금성", "Venus");
			jdbcTemplate.update(INSERT_NAMING, "태양", "The Sun");
			jdbcTemplate.update(INSERT_NAMING, "목성", "Jupiter");
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

class PNamingRowMapper implements RowMapper<NamingVO> {

	@Override
	public NamingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		NamingVO data=new NamingVO();
		data.setnName(rs.getString("P_NAME"));
		data.setnEN(rs.getString("P_EN"));
		return data;
	}

}

class NamingRowMapper implements RowMapper<NamingVO> {

	@Override
	public NamingVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		NamingVO data=new NamingVO();
		data.setnName(rs.getString("N_NAME"));
		data.setnEN(rs.getString("N_EN"));
		return data;
	}

}