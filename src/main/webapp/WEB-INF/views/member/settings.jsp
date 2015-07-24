<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>
.tab-in {
	text-align: center;
}
.tabs {
	text-align: center;
}

.tabs ul {
	diplay: inline-block;
	margin: 0;
	padding: 0;
}

.tabs li {
display: inline;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tabs-test").tabs();
	});
</script>
<title>Settings</title>
</head>
<body>
	<div id="">
	</div>
	<div id="tabs-test">
		<div id="tabs" class="tabs">
			<ul class="tab-in">
				<li class="tab-nav-item"><a href="#profile">Profile</a></li>
				<li class="tab-nav-item"><a href="#cards">Cards</a></li>
				<li class="tab-nav-item"><a href="#settings">Settings</a></li>
			</ul>
		</div>
	<div id="tabs-wrapper">
		<div id="profile">
			<p>첫번째</p>
		</div>
		<div id="cards">
			<p>두번째</p>
		</div>
		<div id="settings">
			<p>세번째</p>
			<h1>Account Details</h1>
			<hr/>
			<div>
				<a href="#">Change Name, Initails</a>
				<a href="#">Change Avatar</a>
				<a href="#">Change Password</a>
			</div>
			<h1>Notification</h1>
			<hr/>
			<div>
				<a href="#">Change Notification for Email</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>