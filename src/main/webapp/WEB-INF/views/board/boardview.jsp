<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
</head>
<body>
	<div class="content">
		<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div>
		
		<div id="content" class="clearfix">
			<div>
			
				<!-- 보드이름 나오는 부분 -->
				<div>
					<a href="#">
						<span>보드이름</span>
					</a>
					<div class="board-header-btns mod-left">
						<a href="#" title="This board is public">
							<span>보드 공개 상태</span>
						</a>
					</div>
					<div class="board-header-btns mod-right">
						<a href="#">
							<span></span>
							<span>Show Menu</span>
						</a>
					</div>
				</div>
				
				<!-- tab부분
				<div class="board-menu js-fill-board-menu"></div>
				 -->
				 
				 <!-- 보드화면 메인부분 -->
				 <div>
					 <div>
					 	<div> <!-- 리스트부분 -->
					 		<div>
					 			<h2>리스트 이름</h2>
					 			<span></span>
					 		</div>
					 	</div>
					 </div>
				 </div>
				 
			</div>
		</div>
		
	</div>	
</body>
</html>