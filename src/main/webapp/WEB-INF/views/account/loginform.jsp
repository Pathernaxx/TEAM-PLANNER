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
	<section>
		<div class="section-wrapper">
			<div class="wrapper-signup">
				<h1>Welcome back to Team Planner!</h1>
				<label for="user">Email<span style="color:#999;">(or username)</span></label>
				<input type="email" name="user" id="user" tabindex="1" placeholder="e.g., test@example.com">
				<label for="password">Password</label>
				<input type="password" name="password" id="password" tabindex="2" placeholder="e.g.,  ••••••••••••">
				<input id="join" type="button" tabindex="3" value="Join">
			</div>
		</div>
	</section>
</body>
</html>