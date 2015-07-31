<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
function addBoard(){}
	
$(function() {
	
	var boardno = $("#boardno").val();
	var cardno = $("#cardno").val();
	var cardinfo = $("#cardinfo").val();

	
	$.ajax({
		url: "/finalProject/card/insertAttachmentForm.action",
		type: "get",
		data: {
			"cardno" : cardno,
			"boardno" : boardno
		},
		success: function(result) { 
			$('.attachmentbtn').webuiPopover({
			constrains: 'horizontal',
			trigger: 'click',
			multi: false,
			placement: 'bottom',
			width: 300,
			closeable: true,
			arrow: false,
			title: 'Attachment',
			content: result
			});
		},
		error: function() {
			alert('error');
		}
	});
	/*///////////////////동윤/////////////////////////// */
	$.ajax({
		url: "/finalProject/card/tagMemberForm.action",
		type: "get",
		data: {
			"cardno" : cardno,
			"listno" : "${listno}",
			"boardno" : boardno
		},
		success: function(result) { 
			$('#tagMemberbtn').webuiPopover({
				constrains: 'horizontal',
				trigger: 'click',
				multi: false,
				placement: 'bottom',
				width: 300,
				closeable: true,
				arrow: false,
				title: 'Tag Member',
				content: result
			});
		},
		error: function() {
			alert("tag error");
		}
	});
});
</script>
<div class="window-wrapper">
	
	<input type="hidden" id="cardno" value=${cardno } />
	<input type="hidden" id="boardno" value=${boardno } />
	<input type="hidden" id="cardinfo" value=${cardinfo } />
	<input type="hidden" id="listno" value=${listno } />
	
	
	<div class="card-detail-window">
	<a class="close-button">x</a>
		<div class="window-header u-clearfix">
			<table>
				<tr>
				<td style="text-align: justify"><img src="/finalProject/resources/styles/images/icons/12.png" class="window-icon" /></td>
				<td style="text-align: justify"><h3 class="text-line">${cardname}</h3></td>
				<td style="text-align: justify"><h5 class="text-line">&nbsp;&nbsp;in list&nbsp;&nbsp;</h5></td>
				<td style="text-align: justify"><h4 class="text-line">${listname}</h4></td>
				</tr>			
			</table>
		</div> 
		
		<div class="window-main-middle u-clearfix">
			<div class="window-main-left">
				<div class="window-attachment">
				<c:choose>
					<c:when test="${ empty cardinfo }">
						<c:import url="/WEB-INF/views/card/information.jsp" />
					</c:when>
					<c:otherwise>
					<span>&nbsp;&nbsp;&nbsp;${ cardinfo}</span><br/>
					<span>
						<a class="updateinfo" style="float:right;color:#8c8c8c;font-size: small;cursor:pointer">
						Edit the Discription</a>
					</span>
					</c:otherwise>
				</c:choose>
					
				</div>
				<div class="window-boardComment">
					<div class="window-header">
						<table class="window-table">
						
						<tr>
							<td><img
									src="/finalProject/resources/styles/images/icons/13.png"
									class="window-icon2" /></td>
							<td>Members</td>
						</tr>
						<!-- attachement -->
						<tr>
							<td><img
									src="/finalProject/resources/styles/images/icons/1.png"
									class="window-icon2" /></td>
							<td>Attachment</td>
						</tr>
						<tr>
							<td colspan='2'>
								<c:import url="/WEB-INF/views/card/attachment.jsp" />
							</td>
						</tr>
						<!--  -->
						
						<!-- checklist -->
						<tr>
							<td><img
									src="/finalProject/resources/styles/images/icons/133.png"
									class="window-icon2" /></td>
							<td>CheckList</td>
						</tr>
						<!--  -->
						
							<tr>
								<td><img
									src="/finalProject/resources/styles/images/icons/199.png"
									class="window-icon2" /></td>
								<td>Activity</td>
							</tr>
							<tr>
								<td><img src="/finalProject/resources/styles/images/icons/2.png" 
								class="window-icon2" /></td>
								<td>
									<input class="activity-comment" type="text"  />
								</td>
							</tr>
						</table>
					</div>
					<div class="window-checklist">checklist</div>
					<div class="window-activity">activity</div>
				</div>
			</div>
			<div class="window-main-sidebar" style="position:relative;">
			<div class="window-sidebar-add u-clearfix">
					<h3>Add</h3>
					<div class="u-clearfix">
						<a id="tagMemberbtn" class="window-sidebutton"> <span class="icon-sm"> <img
								src="/finalProject/resources/styles/images/icons/13.png"
								class="window-icon2" /> Members
						</span>
						</a> <a class="window-sidebutton"> <span class="icon-sm"> <img
								src="/finalProject/resources/styles/images/icons/133.png"
								class="window-icon2" /> CheckList
						</span>
						</a> <a class="window-sidebutton"> <span class="icon-sm"> <img
								src="/finalProject/resources/styles/images/icons/14.png"
								class="window-icon2" /> DueDate
						</span>
						</a> <a class="window-sidebutton attachmentbtn"> <span class="icon-sm"> <img
								src="/finalProject/resources/styles/images/icons/1.png"
								class="window-icon2" /> Attachment
						</span>
						</a>
					</div>

				</div>
			<div class="window-sidebar-actions">
					<h3>Actions</h3>
					<a class="window-sidebutton"> <span class="icon-sm"> <img
							src="/finalProject/resources/styles/images/icons/5.png"
							class="window-icon2" /> Move
					</span>
					</a> <a class="window-sidebutton"> <span class="icon-sm">
							<img src="/finalProject/resources/styles/images/icons/122.png"
							class="window-icon2" /> Copy
					</span>
					</a> <a class="window-sidebutton"> <span class="icon-sm">
							<img src="/finalProject/resources/styles/images/icons/111.png"
							class="window-icon2" /> Archived
					</span>
					</a>
				</div>
			</div>
		</div> 
	</div>
	
	
	
</div>
