<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id="user" class="user.user" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

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
	
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){

				PrintWriter script = response.getWriter();

				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");

			} else{

				UserDAO userDAO = new UserDAO();

				int result = userDAO.update(user);		

				if(result == -1){

					PrintWriter script = response.getWriter();

					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				
				else {

					PrintWriter script = response.getWriter();
					script.println("<script>");
					session.invalidate();
					script.println("location.href = 'index.jsp'");
					script.println("alert('회원정보가 변경되어 로그아웃 되었습니다.')");
					script.println("</script>");
				}
			}
	%>

</body>
</body>
</html>