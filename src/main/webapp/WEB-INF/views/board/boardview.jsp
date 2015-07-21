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
			<div class="board-wrapper">
				<div class="board-header u-clearfix js-boardd-header">
				<a class="board-header-btn board-header-btn-name js-rename-board" href="#">
					<span class="voard-header-btn-text">보드이름</span>
				</a>
				</div>
				<div class="board-header-btns mod-left">
					<a id="permission-level" class="board-header-btn js-change-vis" href="#" title="This board is public">
					<span class="board-header-btn-text">보드 공개 상태</span>
					</a>
				</div>
				<div class="board-header-btns mod-right">
					<a class="board-header-btn mod-show-menu js-show-sidebar" href="#">
					<span class="icon-sm icon-back board-header-btn-icon"></span>
					<span class="board-header-btn-text u-text-underline">Show Menu</span>
					</a>
				</div>
				
				<!-- tab부분
				<div class="board-menu js-fill-board-menu"></div>
				 -->
				 
				 <div class="board-canvas" style="height:195px">
				 <div id="board" class="u-fancy-scrollbar js-no-higher-edit js-list-sortable ui-sortable">
				 	<div class="list">
				 	</div>
				 </div>
				 </div>
				 
			</div>
		</div>
		
	</div>	
</body>
</html>