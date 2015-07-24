<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	$(document).ready(function(){
		var a = ["aseqwe","asd","qwe","zxc"];
		$(".searchtext").autocomplete({
			source : a
		});
	});
</script>
</head>
<body>
	<div class="searchName">
		Search
	</div>
	<div class="search">
		<input class="searchtext" type="text"/>
	</div>
</body>
</html>