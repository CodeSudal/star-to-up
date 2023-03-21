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
	var msg = '${msg}';
	
	if(msg == 'loginFalse') {
		alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.');
		location.href = document.referrer;
	} else if (msg == 'logout') {
		alert('로그아웃 되었습니다.');
		location.href = '${lo}';
	} else if (msg == 'joinFalse') {
		alert('회원가입에 실패하셨습니다. 관리자에게 문의하세요.');
		location.href = document.referrer;
	} else if (msg == 'joinTrue') {
		alert('회원가입을 성공하셨습니다.');
		location.href = '${lo}';
	} else if (msg == 'withdrowalFalse') {
		alert('회원 탈퇴를 실패하셨습니다. 관리자에게 문의하세요.');
		location.href = document.referrer;
	} else if (msg == 'withdrowalTrue') {
		alert('정상적으로 회원 탈퇴 되었습니다.');
		location.href = '${lo}';
	} else if (msg == 'paymentSuccess') {
		alert('결제를 성공하셨습니다! 내 펀딩 목록 페이지로 이동합니다.');
		location.href = '${lo}';
	} else if (msg == 'insertImageFalse') {
		alert('펀딩 상품 추가를 실패하였습니다.');
		location.href = document.referrer;
	} else if (msg == 'insertImageTrue') {
		alert('펀딩 상품을 성공적으로 추가했습니다.');
		location.href = '${lo}';
	} else if (msg == 'mailSuccess') {
		alert('메일 전송을 성공하였습니다.');
		location.href = '${lo}';
	} else {
		alert('관리자에게 문의해주세요');
		location.href = document.referrer;
	}
</script>

</body>
</html>