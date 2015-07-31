<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<style>
.error {
	color: #eb5a46;
	margin: 0 0 8px;
}
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

 <link rel="Stylesheet" href="/finalProject/resources/styles/account.css" />

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet" href="/finalProject/resources/styles/jquery.webui-popover.css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/finalProject/resources/js/jquery.webui-popover.js"></script>
<link rel="Stylesheet" href="/finalProject/resources/styles/core2.css" />

<script type="text/javascript">
	$(function() {
		
		$('.tabs a[href]').click(function(e) {
			var url = $(this);

			$.ajax({
				url: url.attr('href') + ".action",
				type: "post",
				success: function(result) {
					$("#tabs-wrapper").html(result);
				},
				error: function(xhr, status, e2) {
					alert(status + e2)
				}
			});
			e.preventDefault();
		});		
		
	});
	
	$(function () {
		$("#memberupdate").click(function(event) {
			/* alert($("#username").val()); */
			$.ajax({
				url: "/finalProject/member/updatemember.action",
				type: "get",
				data: {"username" : $("#username").val(), "fullname" : $("#fullName").val()},
				success: function(result) {
					$('#dialog2').dialog('close');
					var url = "/finalProject/member/"
					$(location).attr("href", url);
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
		$('#button_open_dialog2').click( function(){
			$('#dialog2').dialog('open');
		});
	});
	
	$(function() {
	$("#cancel").click(function() {
		$('#dialog2').dialog('close');
		
		});
	});
	
</script>

<title>Settings</title>
</head>
<body>
	<div class="headmenu">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
	</div>
	<div class="user-profile">
	<!--       ------------------------------- 석운 ---------------------------------------------- -->
	<div class="tabbed-pane-header-wrapper u-clearfix">
			
			
		<div class="tabbed-pane-header-details"> 
		
		 &nbsp;&nbsp;	<h1 class="u-inline">${ member.userName }</h1>
		 <span> @${ member.userName }</span>
			<a href="#" id="button_open_dialog" class="tabbed-pane-header-image profile-image is-editable js-change-avatar-profile "> 
				<img src="/finalProject/resources/images/TinyTacoTalking.png" />
				<span  class="profile-image-change-text">Change Avatar</span>
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
						
							<img class="pic" src="/finalProject/resources/images/TinyTacoTalking.png">
								<span class="member-initials"></span>
								
							<span class="text">Initials (no avatar)
								<span class="icon-sm icon-check"></span>
							</span>
					</a>
					<hr>
						<!-- <div class="uploader"> -->
						  <!-- <form class="realfile" action="" method="post" enctype="multipart/form-data">
							  <input type="hidden" name="token" value="">
					 		  <input type="hidden" name="format" value="http">
					          <input class="js-upload-avatar" type="file" name="file" 
					          		 style="margin-bottom: 0;" tabindex="-1" accept="image/*;capture=camera">
				 		 </form> -->
							  <a class="button-link fakefile">
								  <span class="icon-sm icon-attachment"></span> Upload a new picture
					 		  </a>
				  	  <!--  </div> -->
				</div>
			</div>
<!--         ----------------------------avatarchange 구문 끝------------------------------         -->
  			</br>	
			<div>
				 <a class="button-link tabbed-pane-header-details-edit js-edit-profile"  id="button_open_dialog2" href="#">
				 <span class="icon-sm icon-edit">
				 </span> Edit profile</a>
				<div id="dialog2" title="Change Avatar">	
					<form class="memberupdate">
						<label>Full Name</label> <input type="text" id="fullName" value="${ member.fullName }">
						<label>Username</label> <input type="text" id="username" value="${ member.userName }">
						<input id="memberupdate" type="submit" value="Save"> 
						<input class="js-cancel-edit-profile" type="button" id="cancel" value="Cancel">
					</form>
				</div>
			</div>
		</div>
	</div>
		<!--       ------------------------------- 석운 끝 ---------------------------------------------- -->
	</div>
	<div id="tabs-test">
		<div id="tabs" class="tabs">
			<ul class="tab-in">
				<li class="tab-nav-item"><a href="/finalProject/member/">Profile</a></li>
				<li class="tab-nav-item"><a href="cards">Cards</a></li>
				<li class="tab-nav-item"><a href="settings">Settings</a></li>
				<li class="tab-nav-item"><a href="list">Member List</a></li>
			</ul>
		</div>
	<div id="tabs-wrapper">
		<div id="profile">
			<div class="js-activity">
				<h2>Activity</h2>
			</div>
			<div>
				<c:if test="${ prints != null }">
					<c:forEach var="action" items="${ prints }">
						<div>
						<span><span class="action-user">${ action.userName }</span></span>&nbsp;${ action.type }
						<c:choose>
							<c:when test="${ action.frontLink != '#' }">
								<a href="${ action.frontLink }">${ action.frontText }</a>
							</c:when>
							<c:otherwise>
								<span>${ action.frontText }</span>
							</c:otherwise>
						</c:choose>
						<c:if test="${ action.backLink != null || action.backText != null}">
							<c:choose>
								<c:when test="${ action.backLink != '#' && action.backLink != null}">
									<a href="${ action.backLink }">${ action.backText }</a>
								</c:when>
								<c:otherwise>
									<span>${ action.backText }</span>
								</c:otherwise>
							</c:choose>
						</c:if>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>