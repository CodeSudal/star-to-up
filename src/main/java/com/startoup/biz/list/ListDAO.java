package com.startoup.biz.list;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.startoup.biz.product.ProductVO;

@Repository("listDAO")
public class ListDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 펀딩 목록 추가
	final String INSERT_LISTS = "INSERT INTO LISTS(L_NUM, L_PID, L_MID) VALUES( (SELECT NVL(MAX(F_NUM), 0) + 1 FROM LISTS), (SELECT NVL(MAX(P_NUM), 0) FROM PRODUCT), ?);";

	public boolean insertList(ListVO vo) {
		try {
			int res=jdbcTemplate.update(INSERT_LISTS, vo.getlMid());
			System.out.println(res);
			if(res<1) { return false; }
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	class ListRowMapper implements RowMapper<ListVO> {

		@Override
		public ListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ListVO data=new ListVO();
			data.setlNum(rs.getInt("L_NUM"));
			data.setlPid(rs.getInt("L_PID"));
			data.setlMid(rs.getString("L_MID"));
			return data;
		}

	}

}
