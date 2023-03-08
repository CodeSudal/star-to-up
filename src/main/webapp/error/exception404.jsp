<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
    <!-- isErrorPage="true" : 에러페이지임을 알려줌 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 ERROR</title>
</head>
<body>
404 ERROR 페이지 입니다.

<!-- 예외페이지들은 모두 .message라는 메서드를 통해 예외에 대한 내용을 확인해볼 수 있다. -->
error : ${exception.message}

</body>
</html>