<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 	
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
    		<li><a href="board.jsp">게시판</a></li>

  		</ul>
  		<%
  			if(userID == null) {				
  		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
    			<ul class="dropdown-menu">
     				<li class="presentation"><a href="login.jsp">로그인</a></li>
      				<li class="presentation"><a href="Join.jsp">회원가입</a></li>
     			</ul>
     		</li>	
     	</ul>
		<%
  			} else {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><% out.println(userID); %> 님<span class="caret"></span></a>
    			<ul class="dropdown-menu">
    				<li class="presentation"><a href="modify.jsp">회원 정보 수정</a></li>
    				<li role="presentation" class="divider"></li>
     				<li class="presentation"><a href="logoutAction.jsp">로그아웃</a></li>
     			</ul>
     		</li>	
     	</ul>
		<%
  			}
		%>
		
  		</div> 
 	</nav>
 	