<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="main.mainDAO"%>
<%@ page import="main.main"%>
<%@ page import="java.util.ArrayList"%>
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
		
		int pageNumber = 1; //기본 페이지 번호

		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

	%>

	<%@ include file = "header.jsp"%>
	
	<%
		if (userID != null) {
	%>
	
	
	<div class="container">
		<form method="post" action="searchedmain.jsp">
			<div class="input-group">
				<input type="text" class="form-control pull-right" placeholder="검색" name="searchWord" />
				
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit" >
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</form>
		
		<div>
		 <p></p>
		</div>
	
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
						<th style="background-color: #eeeeee; text-align: center;">적발 횟수</th>
						<th style="background-color: #eeeeee; text-align: center;">나이</th>
						<th style="background-color: #eeeeee; text-align: center;">알콜 농도</th>
						<th style="background-color: #eeeeee; text-align: center;">측정일시</th>
						<th style="background-color: #eeeeee; text-align: center;">관할경찰서</th>
					</tr>
				</thead>

				<tbody>
						<%
							mainDAO mdDAO = new mainDAO();
							ArrayList<main> list = mdDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getNumber()%></td>
							<td><%=list.get(i).getSex()%></td>
							<td><%=list.get(i).getCount()%></td>
							<td><%=list.get(i).getAge()%></td>
							<td><%=list.get(i).getLevel()%></td>
							<td><%=list.get(i).getDate()%></td>
							<td><%=list.get(i).getLocation()%></td>
						</tr>
						<%
							}
						%>
				</tbody>
			</table>	
			
				<!-- 페이지 넘기기 -->

				<%
					if (pageNumber != 1) {
				%>

				<a href="main.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>

				<%
					}
				
					if (mdDAO.nextPage(pageNumber + 1)) {
				%>

				<a href="main.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>

				<%
					}
				%>

				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null

					if (session.getAttribute("userID") != null) {
				%>

				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>

				<%
					} else {
				%>

				<button class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='login.jsp';" type="button">글쓰기</button>
				<%
					}
				%>
			
		</div>
	</div>

	<%
		}
	%>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>