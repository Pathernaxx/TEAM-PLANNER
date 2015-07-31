<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/core.css" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>

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
				alert('error  20자 이하로 변경 가능');
			}
		});
		event.preventDefault();
	});
});

$(function() {
	$('#dialog').dialog({
		autoOpen: false,
		resizable: false,
	
	});
	$('#button_open_dialog').click( function(){
		$('#dialog').dialog('open');
	});
});

$(function() {
	$('#dialog2').dialog({
		autoOpen: false,
		resizable: false,
	
	});
	$('#button_open_dialog').click( function(){
		$('#dialog2').dialog('open');
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
		
			<a href="#" id="button_open_dialog" class="tabbed-pane-header-image profile-image is-editable js-change-avatar-profile "> 
				<span class="profile-image-change-text">Change Avatar</span>
			</a>
<!--        ---------------------- avatarchange 구문------------------------------------      -->
			<div id="dialog" title="Change Avatar">	
				
				<div>
					<a class="avatar-option js-use-uploaded-avatar active" href="#">
						<img class="pic" src="/finalProject/resources/images/TinyTacoTalking.png">
							<span class="text">Uploaded Picture
								<span class="icon-sm icon-check"></span>
							</span>
					</a>
					<hr>
					
					<a class="avatar-option js-no-avatar " href="#">
							<span class="pic member">
							<img class="pic" src="/finalProject/resources/images/TinyTacoTalking.png">
								<span class="member-initials"></span>
							</span>
							<span class="text">Initials (no avatar)
								<span class="icon-sm icon-check"></span>
							</span>
					</a>
					<hr>
							
						<div class="uploader">
						  <form class="realfile" action="" method="post" enctype="multipart/form-data">
							  <input type="hidden" name="token" value="">
					 		  <input type="hidden" name="format" value="http">
					          <input class="js-upload-avatar" type="file" name="file" 
					          		 style="margin-bottom: 0;" tabindex="-1" accept="image/*;capture=camera">
				 		 </form>
							  <a class="button-link fakefile">
								  <span class="icon-sm icon-attachment"></span> Upload a new picture
					 		  </a>
				  	   </div>
					
				</div>
			</div>
				
<!--         ----------------------------avatarchange 구문 끝------------------------------         -->
  				
			</br>	
			
			<div id="dialog2" title="Change Avatar">	
				
				<form class="memberupdate">
				
					<label>Full Name</label> <input type="text" id="fullName" value="${ member.fullName }">
					
					<label>Username</label> <input type="text" id="username" value="${ member.userName }">
				
					<input id="memberupdate" type="submit" value="Save"> 
					<input class="js-cancel-edit-profile" type="button" value="Cancel">
				</form>
			</div>
		</div>


	</div>

</body>
</html>