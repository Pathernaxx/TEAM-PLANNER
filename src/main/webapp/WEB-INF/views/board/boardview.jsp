<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/board.css" />
</head>
<body style="background-color: #ab0c67">
	<div class="content">
		<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div>
		
		<div id="content" class="clearfix">
			<div class="wrapper">
			
				<div class="header">
					<a class="header-btn header-btn-name" href="#">
						<span class="header-btn-text">프로젝트명</span>
					</a>
					<div class="header-btns">
						<a class="header-btn show-menu" href="#">
							<span class="header-btn-icon"></span>
							<span class="header-btn-text">Show Menu</span>
						</a>
					</div> 
				</div>

				<div class="canvas">
					<div class="list">
						<div class="list-name">
							<a href="#">리스트이름</a>
						</div>
						<div class="list-cards">
							<div class="card">카드1</div>
						</div>
					</div>
				</div>				
				
			</div>
		</div>
		
	</div>	
</body>
</html>