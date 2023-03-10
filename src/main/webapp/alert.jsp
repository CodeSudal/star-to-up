<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert창</title>
</head>
<body>

<script type="text/javascript">
	alert('${msg}');
	location.href = document.referrer;
	//history.back();
</script>

</body>
</html>