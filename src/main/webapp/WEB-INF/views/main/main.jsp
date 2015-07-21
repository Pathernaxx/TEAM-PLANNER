<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/main.css" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("div").click(function(){
			alert("성공@!");
		});
		
	});
</script>
</head>
<body>
	<div class="content">
		<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div><br/><br/><br/>
		
		<div class="mainboard">
			<div class="boardlisttitle">
				<p>◎  My Board</p>
			</div>
			<div>
				<ul>
				<li><div class="board"><p>Board name<p></div></li>	
				<li><div class="createBoard"><p class="createBoardName">Create Board</p></div></li>
				</ul>
			</div>			
		</div>
	</div>
	<div class="clickclosedboard">
		<a href="#">Closed List</a>
	</div>
</body>
</html>