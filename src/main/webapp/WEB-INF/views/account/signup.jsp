<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Team Planner Account</title>
<style>
.section-wrapper {
	margin: 0 auto;
	max-width: 890px;
}
.wrapper-signup {
	margin: 0 auto;
	max-width: 585px;
}

label {
	display: block;
}

textarea, input {
	display: block;
	margin: 0 0 1.2em;
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
				success : function() {
					alert('succes');
					location.href("/finalProject/account/login.action");
				},
				error : function() {
					alert('fail');
				}
			});	
		});
	});

</script>
</head>
<body>
	<section>
		<div class="section-wrapper">
			<div class="wrapper-signup">
				<h1>Create a Team Planner Account</h1>
				<label for="name">Name</label>
				<input type="text" name="name" autocorrect="off" id="name" tabindex="1" placeholder="e.g., GuysSon">
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