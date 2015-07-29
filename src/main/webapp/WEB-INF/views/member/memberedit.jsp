<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/core.css" />


</head>
<body>

	<div class="headmenu">
		<%
			pageContext.include("/WEB-INF/views/include/header.jsp");
		%>
	</div>

	<div class="tabbed-pane-header-wrapper u-clearfix">


		<div class="tabbed-pane-header-details">
			<a
				class="tabbed-pane-header-image profile-image is-editable js-change-avatar-profile "href="#"> 
				<span class="profile-image-initials">T</span>
				<span class="profile-image-change-text">Change Avatar</span>
			</a>

			<div class="js-current-details hide">
				<div class="tabbed-pane-header-details-name">
					<h1 class="u-inline"></h1>
					<p class="window-title-extra quiet"></p>
				</div>

				<div class="tabbed-pane-header-details-content"></div>

				<a
					class="button-link tabbed-pane-header-details-edit js-edit-profile"
					href="#"> <span class="icon-sm icon-edit"></span> Edit profile
				</a>
			</div>

			<form class="js-profile-form">
				<p class="error js-profile-form-error hide"></p>

				<label>Full Name</label> <input type="text" name="fullName" value="">
				<label> Username</label> <input type="text" name="username" value="">
				<label>Initials</label> <input type="text" name="initials" value="">
				<label>Bio <span class="quiet">(optional)</span></label>
				<textarea name="bio"></textarea>
			 
				<input class="primary wide js-submit-profile" type="submit"
					value="Save"> <input class="js-cancel-edit-profile"
					type="button" value="Cancel">
			</form>
		</div>


	</div>

</body>
</html>