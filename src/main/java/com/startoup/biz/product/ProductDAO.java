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
   final String INSERT_PRODUCT = "INSERT INTO PRODUCT( P_NUM, P_NAME, P_PRICE, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT) VALUES( (SELECT NVL(MAX(P_NUM), 0) + 1 FROM PRODUCT), ?, ?, ?, ?, ?, ?)";
   // 제품정보변경
   final String UPDATE_PRODUCT = "UPDATE PRODUCT SET P_NAME=?, P_PRICE=?, P_INFO=?, P_IMAGE1=?, P_IMAGE2=?, P_IMAGE3=?, WHERE P_NUM=?";
   // 제품삭제
   final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE P_NUM=?";
   // 전체 제품 출력(SELECT ALL)
   final String SELECT_ALL = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT, P_CRNAMOUNT, P_PERCENT FROM PRODUCT";
   
   // 제품 하나 출력(SELECT ONE)
   final String SELECT_ONE = "SELECT P_NUM, P_NAME, P_PRICE, P_INFO, P_FINISH, P_IMAGE1, P_IMAGE2, P_IMAGE3, P_AMOUNT, P_CRNAMOUNT, P_PERCENT FROM PRODUCT WHERE P_NUM=?";
   // 제품 구매 시 펀딩 금액 상승
   final String UPDATE_CRNAMOUNT = "UPDATE PRODUCT SET P_CRNAMOUNT=((SELECT P_CRNAMOUNT FROM PRODUCT WHERE P_NUM=?) + (SELECT P_PRICE FROM PRODUCT WHERE P_NUM=?)) WHERE P_NUM=?";
   
   // 퍼센트 업데이트
   final String UPDATE_PERCENT = "UPDATE PRODUCT SET P_PERCENT=? WHERE P_NUM=?";
   
   // 펀딩 완료 되었는지 확인
   final String CHECK_FINISH = "SELECT P_PERCENT FROM PRODUCT WHERE P_NUM=?";
   // 펀딩 완료 시(제품 펀딩 종료하기)
   final String UPDATE_FINISH = "UPDATE PRODUCT SET P_FINISH=1 WHERE P_NUM=?";
   
   // 제품 INFO 업데이트
   final String UPDATE_PINFO = "UPDATE PRODUCT P SET P.P_INFO = (SELECT C.C_INFO FROM CRAWLING C WHERE P.P_NAME = C.C_NAME)";
   
   
   // 사용자가 구매했을 때 checkProduct
   public boolean checkProduct(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
    	  
         // 구매 후 현재 펀딩금액 상승
         int res=jdbcTemplate.update(UPDATE_CRNAMOUNT, vo.getpNum(), vo.getpNum(), vo.getpNum());
         if(res<1) { return false; }
         
         ProductVO pvo = jdbcTemplate.queryForObject(SELECT_ONE, args, new ProductRowMapper());
         
         // 구매 후 퍼센트에이지 변경
         int per=(pvo.getpCRNAmount()/pvo.getpAmount())*100;
         System.out.println(per);
         pvo.setpPercent(per);
         jdbcTemplate.update(UPDATE_PERCENT, pvo.getpPercent(), pvo.getpNum());
         
         // 구매 후 펀딩종료 확인 (펀딩금액이 모두 찼으면 pFinish 1로 변경[종료])
         pvo = jdbcTemplate.queryForObject(CHECK_FINISH, args, new PercentRowMapper());
         if(pvo.getpPercent()==100) {
            jdbcTemplate.update(UPDATE_FINISH, pvo.getpNum());
            return true;
         }
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   

   public boolean insertProduct(ProductVO vo) {
      try {
    	  // 이미지를 넣지 않았다면 default.jpg로 설정
    	 if(vo.getpImage1()==null) {
    		 vo.setpImage1("default.jpg");
    	 }
    	 if(vo.getpImage2()==null) {
    		 vo.setpImage2("default.jpg");
    	 }
    	 if(vo.getpImage3()==null) {
    		 vo.setpImage3("default.jpg");
    	 }
    	 // 제품 추가
         int res=jdbcTemplate.update(INSERT_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpImage1(), vo.getpImage2(),vo.getpImage3(), vo.getpAmount());
         System.out.println(vo);
         if(res<1) { return false; }
         
         // 추가한 제품 INFO를 크롤링 테이블에 있는 정보로 UPDATE
         jdbcTemplate.update(UPDATE_PINFO);
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   
   public boolean updateProduct(ProductVO vo) {
      try {
    	  // 제품 정보 수정
         int res=jdbcTemplate.update(UPDATE_PRODUCT, vo.getpName(), vo.getpPrice(), vo.getpInfo(), vo.getpImage1(), vo.getpImage2(), vo.getpImage3(), vo.getpNum());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }
   
   public boolean deleteProduct(ProductVO vo) {
      try {
    	  // 제품 삭제
         int res=jdbcTemplate.update(DELETE_PRODUCT, vo.getpNum());
         if(res<1) { return false; }
         return true;
      } catch(Exception e) {
         return false;
      }
   }

   public List<ProductVO> selectAll(ProductVO vo){
      try {
    	  // 전체 출력
         return jdbcTemplate.query(SELECT_ALL, new ProductRowMapper());
      } catch(Exception e) {
    	  System.out.println(e);
         return null;
      }
   }

   public ProductVO selectOne(ProductVO vo) {
      Object[] args= { vo.getpNum() };
      try {
    	  // 제품 하나 출력
    	 ProductVO pvo=jdbcTemplate.queryForObject(SELECT_ONE, args, new ProductRowMapper());
         // 총 가격 나누기 제품 가격으로 펀딩에 필요한 총 인원 구해서 setPeople
    	 int p=pvo.getpAmount()/pvo.getpPrice();
         pvo.setPeople(p);
         System.out.println(pvo);
         return pvo;
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
      data.setpImage1(rs.getString("P_IMAGE1"));
      data.setpImage2(rs.getString("P_IMAGE2"));
      data.setpImage3(rs.getString("P_IMAGE3"));
      data.setpAmount(rs.getInt("P_AMOUNT"));
      data.setpCRNAmount(rs.getInt("P_CRNAMOUNT"));
      data.setpPercent(rs.getInt("P_PERCENT"));
      return data;
   }

}

class PercentRowMapper implements RowMapper<ProductVO> {

	   @Override
	   public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
	      ProductVO data=new ProductVO();
	      data.setpNum(rs.getInt("P_NUM"));
	      data.setpPercent(rs.getInt("P_PERCENT"));
	      return data;
	   }

	}
