<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="Board.Board"%>
<%@ page import="Board.BoardDAO"%>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">

	<title>이상훈 게시판 웹사이트</title>

</head>

<body>

	<%
		String userID = null;

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 

		if(userID == null) {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

		

		int bdID = 0;

		if (request.getParameter("bdID") != null) {
			bdID = Integer.parseInt(request.getParameter("bdID"));
		}

		if (bdID == 0) {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");

		}

		Board bd = new BoardDAO().getBd(bdID);

		if (!userID.equals(bd.getUserID())) {
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");				
		}
	%>

	<!-- 네비게이션  -->

	<%@ include file = "header.jsp"%>

	<!-- 게시판 --> 

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bdID=<%= bdID %> ">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"	style="background-color: #eeeeee; text-align: center;">글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bdTitle" maxlength="50" value="<%= bd.getBdTitle() %>" ></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bdContent" maxlength="2048" style="height: 350px;" ><%= bd.getBdContent() %></textarea></td>
						</tr>
					</tbody>
				</table>	
				<button type="submit" class="btn btn-primary pull-right" >글 수정</button>
			</form>
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>