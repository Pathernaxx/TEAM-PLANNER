<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet" href="/finalProject/resources/styles/jquery.webui-popover.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/finalProject/resources/js/jquery.webui-popover.js"></script>


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
</script>
<title>Settings</title>
</head>
<body>
	<div class="headmenu">
		<%-- <c:import url="/WEB-INF/views/include/header.jsp"/> --%>
	</div>
	<div class="user-profile">
		<span></span>
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
								<c:when test="${ action.backLink != '#' || action.backLink != null}">
									<a href="${ action.frontLink }">${ action.frontText }</a>
								</c:when>
								<c:otherwise>
									<span>${ action.frontText }</span>
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