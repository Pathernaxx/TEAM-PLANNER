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
#tabs-wrapper {
	margin: 0 auto;
	max-width: 850px;
	padding: 32px;
	position: relative;
}
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

.big-link {
	border-radius: 3px;
	display: block;
	margin: 6px 0 6px 40px;
	padding: 11px;
	position: relative;
	text-decoration: none;
	font-size: 16px;
	line-height: 20px;
}

.tabs li {
display: inline;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tabs-test").tabs();
		
		$.ajax({
			url: "/finalProject/member/changenameform.action",
			type: "get",
			success: function(result) {
				$('#changename').webuiPopover({
					constrains: 'horizontal', 
		            trigger:'click',
		            multi: false,
		            placement:'bottom',
		            width:300,
					closeable: true,
					arrow: false,
					title: 'ChangeName',
		            content: result
				});
			},
			error: function() {
				alert('error');
			}
		});


		$.ajax({
			url: "/finalProject/member/changepassform.action",
			type: "get",
			success: function(result) {
				$('#changepass').webuiPopover({
					constrains: 'horizontal', 
		            trigger:'click',
		            multi: false,
		            placement:'bottom',
		            width:300,
					closeable: true,
					arrow: false,
					title: 'Change Password',
		            content: result 
				});
			},
			error: function() {
				alert('error');
			}
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
				<a href="#" id="changename" class="big-link js-change-name">
					<span class="text">Change Name, Initails</span>
				</a>
				<a href="#" id="changeavatar" class="big-link js-change-avatar">
					<span class="text">Change Avatar</span>
				</a>
				<a href="#" id="changepass" class="big-link js-change-password">
					<span class="text">Change Password</span>
				</a>
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