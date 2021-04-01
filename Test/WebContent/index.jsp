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

 	<nav class="navbar navbar-default">
  		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expaned="false">

		    	<span class="icon-bar"></span>
		    	<span class="icon-bar"></span>
				<span class="icon-bar"></span>

    		</button>
   			 <a class="navbar-brand" href="main.jsp">JSP 게시판</a>

  		</div>

	<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav">

    		<li><a href="main.jsp">메인</a></li>
    		<li><a href="bbs.jsp">게시판</a></li>

  		</ul>
  		<%
  			if(userID == null) {				
  		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
    			<ul class="dropdown-menu">
     				<li class="active"><a href="login.jsp">로그인</a></li>
      				<li><a href="Join.jsp">회원가입</a></li>
     			</ul>
     		</li>	
     	</ul>
		<%
  			} else {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
    			<ul class="dropdown-menu">
     				<li class="active"><a href="logoutAction.jsp">로그아웃</a></li>
     			</ul>
     		</li>	
     	</ul>
		<%
  			}
		%>
		
  		</div> 
 	</nav>
 
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