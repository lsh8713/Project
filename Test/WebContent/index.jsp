<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width" initial-scale="1">

		<link rel="stylesheet" href="css/bootstrap.min.css">
		<title>이상훈 게시판 웹사이트</title>
	</head>

	<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");	
		}
	%>


 	<%@ include file = "header.jsp"%>
 	
 	<div class="container">
		<div class="col-lg-4"></div>
	
		<div class="col-lg-4">
		
			<!-- 점보트론 -->
			
			<div class="jumbotron" style="padding-top: 20px;">
			
				<h2 class="display-4">음주운전 적발 기록 조회 사이트</h2>
				<p class="lead">환영합니다! 음주운전 적발 기록 조회 사이트입니다.</p>

				<p class="lead"> 
					<a class="btn btn-success btn-lg" href="main.jsp" role="button">음주운전 적발기록 조회하기</a> 
					<a class="btn btn-info btn-lg" href="board.jsp" role="button">유저 게시판 가기</a> 
				</p>

			</div>
		</div>
	</div>
 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>
</html>