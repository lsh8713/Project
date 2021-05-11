<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="user" class="user.user" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>이상훈 게시판 웹사이트</title>

</head>

<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null ){
			userID = (String) session.getAttribute("userID");

		}
		
			UserDAO userDAO = new UserDAO();
			
			int result = userDAO.delete(request.getParameter("userID"), user.getUserPassword());		

			if(result == -1){

				PrintWriter script = response.getWriter();

				script.println("<script>");
				script.println("alert('비밀번호가 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			else if(result == -2){

				PrintWriter script = response.getWriter();

				script.println("<script>");
				script.println("alert('탈퇴에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
				
			else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				session.invalidate();
				script.println("location.href = 'index.jsp'");
				script.println("alert('회원탈퇴 되었습니다.')");
				script.println("</script>");
			}
	%>

</body>
</html>