<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Team Planner Account</title>
<style>
html {
	font-size: 20px;
}
.section-background-blue {
	background-color: #e4f0f6;
}

.section-home-login {
	padding: 2em 1em;
	text-align: center;
}

.section-wrapper {
	margin: 0 auto;
	max-width: 1300px;
}

.text-center {
	text-align: center;
}

div {
	display: block;
}

.login-form {
	width: 400px;
}

.wrapper-signup {
	display: block;
	max-width: 585px;
	margin: 0 auto;
	position: relative;
	text-align: left;
}

label {
	display: block;
}

textarea, input[type="text"], input[type="email"], input[type="password"], input[type="number"] {
	background: #edeff0;
	border-radius: 4px;
	border: 1px solid #cdd2d4;
	box-sizing: border-box;
	padding: .5em;
	max-width: 400px;
	width: 100%;
	margin: 0 0 1.2em;
}

button, input, select, textarea {
	color: inherit;
	font: inherit;
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
						var url = '/finalProject/board/boardmain.action';
						$(location).attr('href', url);
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