<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/main.css" />
</head>
<body>

	<div class="tabbed-pane-header-wrapper u-clearfix">
		<a class="tabbed-pane-header-image profile-image is-editable js-change-avatar-profile " href="#">
			<span class="profile-image-initials">T</span>
			<span class="profile-image-change-text">Change Avatar</span>
		</a>
		
		<div class="tabbed-pane-header-details">
		
			<div class="js-current-details hide">
				<div class="tabbed-pane-header-details-name">
					<h1 class="u-inline">tiger83</h1>
					<p class="window-title-extra quiet">@tiger83</p>
				</div>
				
				<div class="tabbed-pane-header-details-content"></div>
				
				<a class="button-link tabbed-pane-header-details-edit js-edit-profile" href="#">
					<span class="icon-sm icon-edit"></span> Edit profile
				</a>
			</div>
			
			<form class="js-profile-form">
				<p class="error js-profile-form-error hide"></p>
				<label>Full Name</label>
				<input type="text" name="fullName" value="tiger83">
				<label>Username</label>
				<input type="text"name="username" value="tiger83">
				<label>Initials</label>
				<input type="text" name="initials" value="T">
				<label>Bio <span class="quiet">(optional)</span></label>
				<textarea name="bio"></textarea>
				<input class="primary wide js-submit-profile" type="submit" value="Save">
				<input class="js-cancel-edit-profile" type="button" value="Cancel">
			</form>
		</div>
		
	</div>

</body>
</html>