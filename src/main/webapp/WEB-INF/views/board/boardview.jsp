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

<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$.ajax({
		url: "/finalProject/board/boardview.action",
		async: true,
		data: {
			boardno : 1
		},
		method: "post",
		success: function(result) {
			
			$.each(result, function(index, item) {
				var output="";
				output += '<div class="list">';
				output += '<div class="list-name" style="background-color:white">' + item.name + '</div>';
				for(var card in item.cards) {
					output += '<div class="list-card" style="background-color:blue">'+ item.cards[card].name +'</div>';
				};
				output += '<div class="list-insert">리스트추가</div>';
				output += '</div>';
				$(".canvas").append(output);
			});
			
		},
		error: function() {
			alert("error");
		}
	});
	
	
});

</script>

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
				</div>		
				
			</div>
		</div>
		
	</div>	
</body>
</html>