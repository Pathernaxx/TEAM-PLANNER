<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	$(document).ready(function(){
		var text= $(".searchtext").val();
		$(".searchtext").autocomplete({
			source : function(request , response){
				$.ajax({
					url : '/finalProject/board/searchview.action',
					type : 'get',
					data : {
						text : request.term
					},
					success : function(result){
						
					}
				});
			}
		});
	});
</script>
</head>
<body>

	<div class="searchName">
		SEARCH
	</div>
	<div class="search">
		<input class="searchtext" type="text"/>
	</div>
	<div class="searchbutton">
		☜
	</div>
	<div class="mainpage">
		<img class="mainpageimg" src="/finalProject/resources/images/mainpage.png">
	</div>
	<div class="alarm">
		알람
	</div>
 	<div class="mypage">
		My Page
	</div> 
	
	
	
</body>
</html>