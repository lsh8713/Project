<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>


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
			
			int result = userDAO.delete(request.getParameter("userID"));		

			if(result == -1){

				PrintWriter script = response.getWriter();

				script.println("<script>");
				script.println("alert('탈퇴에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
				
			else {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'logoutAction.jsp'");
				script.println("</script>");
			}
	%>

</body>
</html>