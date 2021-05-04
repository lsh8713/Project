<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

		int bdID = 0;
		if (request.getParameter("bdID") != null) {
			bdID = Integer.parseInt(request.getParameter("bdID"));
		}

		if (bdID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Board bd = new BoardDAO().getBd(bdID);
	%>

	<!-- 네비게이션  -->

	<%@ include file = "header.jsp"%>

	<!-- 게시판 -->

	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"	style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>

					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="2"><%= bd.getBdTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= bd.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일시</td>	
							<td colspan="2"><%= bd.getBdDate()%></td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bd.getBdContent() %></td>
						</tr>
					</tbody>
				</table>	

				<a href = "board.jsp" class="btn btn-primary">목록</a>

				<%
				
				//글작성자 본인확인
					if(userID != null && userID.equals(bd.getUserID())){

				%>
						<a class="btn btn-success" href="update.jsp?bdID=<%= bdID %>" class="btn btn-primary">수정</a>
						<a class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bdID=<%= bdID %>">삭제</a>
				<%					
					}
				%>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>

</html>
