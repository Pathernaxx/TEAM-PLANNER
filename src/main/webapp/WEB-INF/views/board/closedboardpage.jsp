<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/closedboardpage.css" />
<link rel="Stylesheet" href="/finalProject/resources/jquery-ui-1.11.4.custom/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/finalProject/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		var boardNo = ${ boardNo }
		var url = '/finalProject/board/openClosedBoardPage.action?boardNo='+boardNo
		$("#font").click(function(){
			$(location).attr('href', url);	
		});
		
		
	});
</script>
</head>
<body style="background-color:  #dddddd">
	<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
	</div><br/><br/><br/>
	<div align="center" style="text-align: center;">
		<h1>This board is closed</h1><br/>
		<h2 align="center">if you want to open this board,<br/>Click this 'Button'<br/>↓</h2><br/><br/>
		<div id="fontarea">
			<p id="font">CLICK</p>
			
			
		</div>
	</div>
</body>
</html>