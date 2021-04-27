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
	<h1>Index.jsp</h1>
 
   	<%
  		if(userID != null) {				
  	%>
		 <p><% out.println(userID); %>로그인됨<p>
   	<%
  		}				
  	%>
 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>
</html>