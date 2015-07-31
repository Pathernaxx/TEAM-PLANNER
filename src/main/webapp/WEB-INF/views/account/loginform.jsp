<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Team Planner Account</title>
<link rel="stylesheet" href="/finalProject/resources/styles/account.css" />
<style>
.section-home-login {
	padding: 2em 1em;
	text-align: center;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#join").click(function(event)
		{
			$.ajax({
				url: "/finalProject/account/login.action",
				async: false,
				type: "post",
				data: {
					user: $("#user").val(),
					password : $("#password").val()
				},
				success : function(result) {
					if(result=="complete")
					{
						var returnurl = '${returnurl}';
						
						if( returnurl == null || returnurl.length == 0) {
							returnurl = '/finalProject/board/boardmain.action';
						}
						
						$(location).attr('href', returnurl);
					} else {
						alert('Not User Find');
					}
				},
				error : function() {
					alert('fail');
				}
			});
			
			event.preventDefault();
		});
	});

</script>
</head>
<body>
	<section class="section-background-blue section-home-login">
		<div class="section-wrapper">
			<div class="text-center">
				<h1>Welcome back to Team Planner!</h1>
			</div>
			<div class="wrapper-signup login-form">
				<input type="hidden" name="returnurl" value="${ returnurl != '' || returnurl ne null ? returnurl : '' }"/>
				<label for="user">Email<span style="color:#999;">(or username)</span></label>
				<input type="email" name="user" id="user" tabindex="1" placeholder="e.g., test@example.com">
				<label for="password">Password</label>
				<input type="password" name="password" id="password" tabindex="2" placeholder="e.g.,  ••••••••••••">
				<input id="join" type="button" tabindex="3" value="Join">
			</div>
		</div>
		<div>
			<a href="/finalProject/account/signup.action">회원가입</a>
		</div>
	</section>
	
</body>
</html>