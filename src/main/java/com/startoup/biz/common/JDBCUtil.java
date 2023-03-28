package com.startoup.biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class JDBCUtil {
	   static final String driverName="oracle.jdbc.driver.OracleDriver";
	   static final String url="";
	   static final String user="";
	   static final String passwd="";
	   public static Connection connect() {
	      Connection conn=null;
	      try {
	         Class.forName(driverName);
	         conn=DriverManager.getConnection(url, user, passwd);
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         System.out.println("   로그: connect() 수행완료");
	      }
	      return conn;
	   }
	   public static void disconnect(Connection conn,Statement stmt) {
	      try {
	         stmt.close();
	         conn.close();
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         System.out.println("   로그: disconnect() 수행완료");
	      }      
	   }
   
   
}