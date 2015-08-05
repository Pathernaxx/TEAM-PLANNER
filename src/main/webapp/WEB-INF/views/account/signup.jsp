<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Team Planner Account</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/account.css" />
<style>
.section-signup {
	padding: 2em 1em;
	text-align: center;
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
					if(result != null) {
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