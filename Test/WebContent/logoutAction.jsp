<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>이상훈 게시판 웹사이트</title>

</head>
<body>

	<%
		session.invalidate();
	%>

	<script>
		location.href = 'index.jsp';
		alert('로그아웃 되었습니다.');
	</script>

</body>
</html>