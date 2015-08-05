<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

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
		$('.dialogimage').click( function(){
			$('#dialog2').dialog('open');
		});
	});
	
	$(function() {
	$("#cancel").click(function() {
		$('#dialog2').dialog('close');
		
		});
	});
	
</script>
		<div id="profile">
			<div class="js-activity">
				<h2>Activity</h2>
			</div>
					<div>
				<c:if test="${ prints != null }">
					<c:forEach var="action" items="${ prints }">
					<div style="margin: 18px; padding-top: 3px" >
						 <div class="tabbed-pane-header-image profile-image is-editable js-change-avatar-profile ">
							<a href="#"	class="dialogimage"  > 
								<img  class="pic2" src="/finalProject/resources/images/user.png">
								<span class="profile-image-change-text">변경</span>
							</a>
						</div> 
						
						<span><span class="action-user">${ action.userName }</span></span>&nbsp;<a id="color">${ action.type }</a>
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