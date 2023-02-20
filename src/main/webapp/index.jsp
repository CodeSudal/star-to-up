<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.sendRedirect("main.do");
%>
<!-- .jsp 가 아닌 .do로 하는 이유
1. 아주 작은 데이터라도 컨트롤러를 거치려면 .do로 써야하고
2. .jsp로 하면 필터 적용이 안됨 -->