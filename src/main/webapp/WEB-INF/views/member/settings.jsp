<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet" href="/finalProject/resources/styles/jquery.webui-popover.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/finalProject/resources/js/jquery.webui-popover.js"></script>


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
		$('#changename').webuiPopover({
			constrains: 'horizontal', 
            trigger:'click',
            multi: true,
            placement:'right-bottom',
            width:100,
			closeable: true,
			title: 'Change Name',
            content: '아아<br>마이크 테스트'
		});
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
				<div>
					<a href="" id="changename">Change Name, Initails</a>
				</div>
				<div>
					<a href="#!" id="changeavatar">Change Avatar</a>
				</div>
				<div>
					<a href="#!" id="changepass">Change Password</a>
				</div>
			</div>
			<h1>Notification</h1>
			<hr/>
			<div>
				<a href="#" id="changenotifi">Change Notification for Email</a>
			</div>
		</div>
	</div>
</div>
<div class="pop-over" style="left:1042px; top: 41px;">
	
</div>
</body>
</html>