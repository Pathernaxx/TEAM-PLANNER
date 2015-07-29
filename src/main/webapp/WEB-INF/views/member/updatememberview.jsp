<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/core.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/core2.css" />

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>

$(function () {
	$("#memberupdate").click(function(event) {
		/* alert($("#username").val()); */
		$.ajax({
			url: "/finalProject/member/updatemember.action",
			type: "get",
			data: {"username" : $("#username").val(), "fullname" : $("#fullName").val()},
			success: function(result) {
				alert('변경 완료');
				
			},
			error: function() {
				alert('error');
			}
		});
		event.preventDefault();
	});
});

$(function() {
	$("#changeavatar").tabs();
	
	$.ajax({
		url: "/finalProject/member/changeavatarform.action",
		type: "get",
		success: function(result) {
			$('#changeavatar').webuiPopover({
				constrains: 'horizontal', 
	            trigger:'click',
	            multi: false,
	            placement:'bottom',
	            width:300,
				closeable: true,
				arrow: false,
				title: 'changeavatar',
	            content: result
			});
		},
		error: function() {
			alert('error');
		}
	});

});
</script>

</head>
<body>

	<div class="headmenu">
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
	</div>
	
	<div class="tabbed-pane-header-wrapper u-clearfix">
		<div class="tabbed-pane-header-details">
			<a href="#" id="changeavatar" > 
				<span class="profile-image-initials">A</span> 
				<span class="profile-image-change-text">Change Avatar</span>
			</a>
			</br>

			<div class="js-current-details hide">
				<div class="tabbed-pane-header-details-name">
					<h1 class="u-inline"></h1>
					<p class="window-title-extra quiet"></p>
				</div>

			</div>

			<form class="memberupdate">
			
				<label>Full Name</label> <input type="text" id="fullName" value="${ member.fullName }">
				
				<label>Username</label> <input type="text" id="username" value="${ member.userName }">
			
				<input id="memberupdate" type="submit" value="Save"> 
				<input class="js-cancel-edit-profile" type="button" value="Cancel">
			</form>
			
		</div>


	</div>

</body>
</html>