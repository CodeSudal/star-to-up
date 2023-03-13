package com.startoup.biz.product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {
   @Autowired
   private JdbcTemplate jdbcTemplate;

   // 제품추가
   final String INSERT_PRODUCT = "INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?)";
   // 제품정보변경
   final String UPDATE_PRODUCT = "UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?, P_IMAGE=? WHERE P_NUM=?";
   // 제품삭제
   final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
   // 전체 제품 출력(SELECT ALL)
   final String SELECT_ALL = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE, P_AMOUNT, P_CRNAMOUNT, P_PERCENT FROM PRODUCT";
   
   // 제품 하나 출력(SELECT ONE)
   final String SELECT_ONE = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE, P_AMOUNT, P_CRNAMOUNT, P_PERCENT FROM PRODUCT WHERE P_NUM=?";
   // 제품 구매 시 펀딩 금액 상승
   final String UPDATE_CRNAMOUNT = "UPDATE PRODUCT SET P_CRNAMOUNT=((SELECT P_CRNAMOUNT FROM PRODUCT WHERE P_NUM=?) + (SELECT P_PRICE FROM PRODUCT WHERE P_NUM=?)) WHERE P_NUM=?";
   
   // 퍼센트 업데이트
   final String UPDATE_PERCENT = "UPDATE PRODUCT SET P_PERCENT=? WHERE P_NUM=?";
   
   // 펀딩 완료 되었는지 확인
   final String CHECK_FINISH = "SELECT P_PERCENT FROM PRODUCT WHERE P_NUM=?";
   // 펀딩 완료 시(제품 펀딩 종료하기)
   final String UPDATE_FINISH = "UPDATE PRODUCT SET P_FINISH=1 WHERE P_NUM=?";
   
   
   // 사용자가 구매했을 때 checkProduct
   public boolean checkProduct(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
         ProductVO pvo = jdbcTemplate.queryForObject(SELECT_ONE, args, new ProductRowMapper());
         
         // 구매 후 현재 펀딩금액 상승
         int res=jdbcTemplate.update(UPDATE_CRNAMOUNT, vo.getpNum(), vo.getpNum(), vo.getpNum());
         if(res<1) { return false; }
         
         // 구매 후 퍼센트에이지 변경
         int per=(pvo.getpCRNAmount()/pvo.getpAmount())*100;
         vo.setpPercent(per);
         jdbcTemplate.update(UPDATE_PERCENT, vo.getpPercent(), vo.getpNum());
         
         // 구매 후 펀딩종료 확인 (펀딩금액이 모두 찼으면 pFinish 1로 변경[종료])
         pvo = jdbcTemplate.queryForObject(CHECK_FINISH, args, new ProductRowMapper());
         if(pvo.getpPercent()==100) {
            jdbcTemplate.update(UPDATE_FINISH, vo.getpNum());
            return true;
         }
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   

   public boolean insertProduct(ProductVO vo) {
      try {
    	 if(vo.getpImage()==null) {
    		 vo.setpImage("default.jpg");
    	 }
         int res=jdbcTemplate.update(INSERT_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpImage(),  vo.getpAmount());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   
   public boolean updateProduct(ProductVO vo) {
      try {
         int res=jdbcTemplate.update(UPDATE_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpInfo(), vo.getpImage(), vo.getpNum());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   
   public boolean deleteProduct(ProductVO vo) {
      try {
         int res=jdbcTemplate.update(DELETE_PRODUCT, vo.getpNum());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }

   public List<ProductVO> selectAll(ProductVO vo){
      try {
         return jdbcTemplate.query(SELECT_ALL, new ProductRowMapper());
      } catch(Exception e) {
    	  System.out.println(e);
         return null;
      }
   }

   public ProductVO selectOne(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
         return jdbcTemplate.queryForObject(SELECT_ONE, args, new ProductRowMapper());
      } catch(Exception e) {
         return null;
      }
   }
   
   
   
   /*
   public boolean updateCRNAmount(ProductVO vo) {
      try {
         int res=jdbcTemplate.update(UPDATE_CRNAMOUNT, vo.getpNum(), vo.getpNum(), vo.getpNum());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }

   // true == 펀딩 진행중, false == 펀딩 종료(목표 금액 달성)
   public boolean checkEnd(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
         jdbcTemplate.queryForObject(CHECK_FINISH, args, new ProductRowMapper());
         if(vo.getpAmount()==vo.getpCRNAmount()) {
            jdbcTemplate.update(UPDATE_FINISH, vo.getpNum());
            return true;
         }
         else {
            return true;
         }
      } catch(Exception e) {
         return false;
      }
   }
   
   // 펀딩 진행도 (퍼센트)
   public boolean progressFunding(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
         ProductVO pvo = jdbcTemplate.queryForObject(SELECT_ONE, args, new ProductRowMapper());
         int res=(pvo.getpCRNAmount()/pvo.getpAmount())*100;
         vo.setpPercent(res);
         jdbcTemplate.update(UPDATE_PERCENT, vo.getpPercent() ,vo.getpNum());
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   */
   


}

class ProductRowMapper implements RowMapper<ProductVO> {

   @Override
   public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      ProductVO data=new ProductVO();
      data.setpNum(rs.getInt("P_NUM"));
      data.setpName(rs.getString("P_NAME"));
      data.setpPrice(rs.getInt("P_PRICE"));
      data.setpInfo(rs.getString("P_INFO"));
      data.setpFinish(rs.getInt("P_FINISH"));
      data.setpImage(rs.getString("P_IMAGE"));
      data.setpAmount(rs.getInt("P_AMOUNT"));
      data.setpCRNAmount(rs.getInt("P_CRNAMOUNT"));
      data.setpPercent(rs.getInt("P_PERCENT"));
      return data;
   }

   
}

