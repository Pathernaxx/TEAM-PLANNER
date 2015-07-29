<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Team Planner Account</title>
<style>

.section-background-blue {
	background-color: #e4f0f6;
}

.text-center {
	text-align: center;
}

.section-signup {
	padding: 2em 1em;
	text-align: center;
}

.section-wrapper {
	margin: 0 auto;
	max-width: 890px;
}

.wrapper-signup {
	dispaly:blcok;
	margin: 0 auto;
	max-width: 585px;
	width: 400px;
	text-align: left;
}

html {
	font-size: 20px;
}

div {
	display: block;
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
		
		$("#create").click(function(evnet)
		{
			$.ajax({
				url: "/finalProject/account/signup.action",
				async: false,
				type: "post",
				data: {
					name : $("#name").val(),
					email: $("#email").val(),
					password : $("#password").val()
				},
				success : function(result) {
					if(result == null) {
						var url = "/finalProject/account/login.action";
						$(location).attr('href', url);
					} else {
						alert(result);
						return;
					}
				},
				error : function() {
					alert('이미 가입된 Email입니다.');
				}
			});	
		});
	});

</script>
</head>
<body>
	<section class="section-background-blue section-signup">
		<div class="section-wrapper">
			<div class="text-center">
				<h1>Create a Team Planner Account</h1>
			</div>
			<div class="wrapper-signup">
				<label for="name">Name</label>
				<input type="text" name="name" id="name" tabindex="1" placeholder="e.g., GuysSon">
				<label for="email">Email</label>
				<input type="email" name="email" id="email" tabindex="2" placeholder="e.g., test@example.com">
				<label for="password">Password</label>
				<input type="password" name="password" id="password" tabindex="3" placeholder="e.g.,  ••••••••••••">
				<input id="create" type="button" tabindex="4" value="Create New Account">
			</div>
		</div>
	</section>
</body>
</html>