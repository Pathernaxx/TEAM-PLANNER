<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
function addBoard(){}
	
$(function() {
	
	var boardno = $("#boardno").val();
	var cardno = $("#cardno").val();
	var cardinfo = $("#cardinfo").val();

	/* 첨부파일 팝업버젼
	
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
	}); */
	
	/* 첨부파일 다이얼로그 버젼 */

	var attachmentdialog = $('#attachmentdialog').dialog({
		autoOpen: false,
		height: 130,
		width: 280
	});	
	$('#attachmentbtn').click(function() {
		attachmentdialog.dialog("open");
	});
	///////////////////////////////////////////
	
	$("#uploadForm").submit(function(event) {
		event.preventDefault();
		var formData = new FormData(this);//$(this).serialize();
		
		$.ajax({
			url: '/finalProject/card/insertAttachment.action',
			type: 'POST',
			data: formData,
			dataType:'json',
			cache: false,
			contentType: false,
			processData: false,
			success: function(message) {
				if(message == "success") {
					alert("success");
					attachmentdialog.dialog("close");
				} else {
					alert("error");
				}
				
			}
		});
		//return false;
		
	}); 
	
	$("#filedownload").click(function() {
		//alert($(".attachment-options").children()[0].value);
		//var fileno = $(".attachment-options").children()[0].value;
		$.ajax({
			url: '/finalProject/card/filedownload.action',
			type: 'GET',
			data: {
				fileno : $(".attachment-options").children()[0].value
			},
			success: function(message) {
				if(message == "success") {
					alert("다운로드완료")
				} else {
					alert("다운로드실패")
				}
			}
		});
	});
	
	$("#filedelete").click(function() {
		$.ajax({
			url: '/finalProject/card/deleteAttachment.action',
			type: 'GET',
			data: {
				fileno : $(".attachment-options").children()[0].value
			},
			success: function(message) {
				if(message == "success") {
					alert("삭제완료")
					
				} else {
					alert("삭제실패")
				}
			}
		});
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
	
	
	//////////////////////////// 녕수 ////////////////////////////
	var checklistdialog = $('#checklistdialog').dialog({
		autoOpen: false,
		height: 130,
		width: 280
	});	
	
	$('#attachmentbtn').click(function() {
		attachmentdialog.dialog("open");
	});
	
	function removeControls() {
		$('.focus').removeClass('focus');
		$('.inline-edit').append($('.add-controls'));
		$('.editing').removeClass('editing');
		$('.inline-edit').append($('.edit-controls'));
	}
	
	$(document).ready(function(){
		
		$(document).click(function(event) {
			removeControls();
		});
		
		$.extend({
			percentage: function(a, b) {
				return Math.round((a / b) * 100);
			}
		});
		
		//body는 카드 다이얼로그
		$('body #check').on('click', function(event) {
			removeControls();
			$('.activity').before(
					'<div class="checklist-list window-module">'+ 
						'<div class="checklist">' +
							'<div class="window-module-title window-module-title-no-divider">' +
								'<span class="window-module-title-icon icon-lg icon-checklist"></span>' +
								'<div class="editable non-empty checklist-title">' +
									'<h3 class="current hide-on-edit">' + 'Tile Name' + '</h3>' +
									'<div class="window-module-title-options">' +
										'<a class="hide-on-edit js-confirm-delete">Delete...</a>' +
										'<div class="edit edit-heavy">' +
											'<textarea class="field full single-line" style="overflow: hidden; word-wrap: break-word; resize: none; height: 54px"></textarea>' +
										'</div>' +
									'</div>' +
								'</div>' +
							'</div>' +
							'<div class="checklist-progress">' +
								'<span class="checklist-progress-percentage js-checklist-progress-percent">0%</span>' +
								'<div class="checklist-progress-bar">' +
									'<div class="checklist-progress-bar-current js-checklist-progress-bar" style="width: 0%;"></div>' +
								'</div>' +
							'</div>' +
							'<div class="checklist-items-list js-checklist-items-list js-no-higher-edits ui-sortable"></div>' +
							'<div class="checklist-new-item u-gutter js-new-checklist-item focus">' +
								'<textarea class="checklist-new-item-text js-new-checklist-item-input" placeholder="Add an item..." style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>'+
							'</div>' +
						'</div>' +
					'</div>');
			
			$('.focus .js-new-checklist-item-input').after($('.add-controls'));
			event.stopPropagation();
		});
		
		function progressPercent(current) {
			var a = current.parents('.checklist-items-list').find('.checklist-item');
			var b = current.parents('.checklist-items-list').find('.complete-checklist');
			var c = $.percentage(b.length , a.length) + '%';
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-percent').text(c);
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-bar').css('width', c);
		}
		
		$("body").on("click", '.js-toggle-checklist-item', function(event) {
			//event.preventDefault();
			if($(this).parents('.checklist-item').hasClass('complete-checklist')) {
				$(this).parents('.checklist-item').removeClass('complete-checklist');
				progressPercent($(this));
			} else {
				$(this).parents('.checklist-item').addClass('complete-checklist');
				progressPercent($(this));
			}
			//event.stopPropagation();
		});
		
		var text = "";
		
		$('body').on('click', '.js-new-checklist-item-input', function(event) {
			removeControls();
			
			$(this).parents('.js-new-checklist-item').addClass('focus');
			
			$(this).after($('.add-controls'));
			event.stopPropagation();
		});
		
		$('body').on('click', '.js-checkitem-name', function(event) {
			removeControls();
			
			$(this).parents('.editable').addClass('editing');
			
			text = $(this)[0].innerHTML;
			$(this).parents().find('.js-checkitem-input').val(text);
			
			$(this).parents().find('.editing .js-checkitem-input').after($('.edit-controls'));
			event.stopPropagation();
		});
		
		$('body').on('click', '.js-save-edit', function(event) {
			var message = $(this).parents('.editing').find('.js-checkitem-input').val();
			
			// null Check
			
			alert(message);
			
			if( text == message ) {
				alert('변경 없음');
			} else {
				alert('변경 있음');
				$('.editing .js-checkitem-name').text(message);
				// ajax 요청
			}
			$('.editable.editing').removeClass('editing');
			$('.inline-edit').append($('.edit-controls'));
			event.stopPropagation();
		});
		
		$('body').on('click', '.js-save-add', function(event) {
			//event.preventDefault();
			var message = $(this).parents('.focus').find('textarea.js-new-checklist-item-input');
			
			// null Check
			
			alert(message.val());
			var checklist = $(this).parents('.checklist').find('.checklist-items-list');
			checklist.append('<div class="checklist-item">' +
								'<div class="checklist-item-checkbox ui-icon-check js-toggle-checklist-item">' + 
									'<span class="icon-team ui-icon-check checklist-item-checkbox-check"></span>' +
								'</div>' +
								'<div class="checklist-item-details non-empty editable">' +
									'<p class="checklist-item-details-text current hide-on-edit markeddown js-checkitem-name">'+ message.val() +'</p>' +
									'<div class="edit delete convert options-menu">' +
										'<textarea class="field full single-line js-checkitem-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>' +
									'</div>' +
								'</div>' +
							'</div>'
							);
			message.val("");
			//progressPercent($(this));
			var current = $(this).parents('.window-module-title');
			var a = current.find('.checklist-items-list').find('.checklist-item');
			var b = current.find('.checklist-items-list').find('.complete-checklist');
			var c = $.percentage(b.length , a.length) + '%';
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-percent').text(c);
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-bar').css('width', c);
			$(this).parents('.focus').removeClass('focus');
			$('.inline-edit').append($('.add-controls'));
		});
	});
	
});
</script>
<div class="window-wrapper">
	
	<input type="hidden" id="cardno" value=${cardno } />
	<input type="hidden" id="boardno" value=${boardno } />
	<input type="hidden" id="cardinfo" value=${cardinfo } />
	<input type="hidden" id="listno" value=${listno } />
	
	
	<div class="card-detail-window">
	<!-- <a class="close-button">x</a> -->
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
						<c:choose>
							<c:when test="${ empty attachments }">
								
							</c:when>
							<c:otherwise>
								<tr>
									<td><img
											src="/finalProject/resources/styles/images/icons/1.png"
											class="window-icon2" /></td>
									<td>Attachment</td>
								</tr>
								<c:forEach var="attlist" items="${attachments }">
									<tr>
										<td></td>
										<td>
											<%-- <c:import url="/WEB-INF/views/card/attachment.jsp" /> --%>
											<div class="u-clearfix attachment-list">
												<div class="attachment-thumnail">
													<a class="attachment-preview">
														<span class="attachment-preview-src">${attlist.fileType }</span>
													</a>
													<p class="attachment-details">
														<a class="attachment-details-title">${attlist.fileName }<br/>
															<span class="attachment-date" style="font-size: x-small;">${uploadDate }</span>
														</a>
														<span class="attachment-options" style="font-size: small;">
															<input type="hidden" value="${attlist.no }" />
															<a id="filedownload" style="text-decoration: underline">
																Download</a>
															&nbsp;&nbsp;
															<a id="filedelete" style="text-decoration: underline">Delete</a>
														</span>
													</p>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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
					<div class="checklist-list window-module">
						<c:if test="${ checklists ne null }">
						<c:forEach var="checklist" items="${ checklists }">
						<div class="checklist" id="${ checklist.no }">
							<div class="window-module-title window-module-title-no-divider">
								<span class="window-module-title-icon icon-lg icon-checklist"></span>
								<div class="editable non-empty checklist-title">
									<h3 class="current hide-on-edit">${ checklist.name }</h3>
									<div class="window-module-title-options">
										<a class="hide-on-edit js-confirm-delete">Delete...</a>
										<div class="edit edit-heavy">
											<textarea class="field full single-line" style="overflow: hidden; word-wrap: break-word; resize: none; height: 54px"></textarea>
										</div>
									</div>
								</div>
								<div class="checklist-progress">
									<span class="checklist-progress-percentage js-checklist-progress-percent">0%</span>
									<div class="checklist-progress-bar">
										<div class="checklist-progress-bar-current js-checklist-progress-bar" style="width: 0%;"></div>
									</div>
								</div>
								<div class="checklist-items-list js-checklist-items-list js-no-higher-edits ui-sortable">
									<c:if test="${ checkItems }" >
									<c:forEach var="checkitem" items="${ checkItems }">
									<div class="checklist-item ${ checkitem.checked ? 'complete-checklist' : '' }" id="${ checkitem.no }">
										<div class="checklist-item-checkbox ui-icon-check js-toggle-checklist-item">
											<span class="icon-team ui-icon-check checklist-item-checkbox-check"></span>
										</div>
										<div class="checklist-item-details non-empty editable">
											<p class="checklist-item-details-text current hide-on-edit markeddown js-checkitem-name">${ checkitem.name }</p>
											<div class="edit delete convert options-menu">
												<textarea class="field full single-line js-checkitem-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
											</div>
										</div>
									</div>
									</c:forEach>
									</c:if>
								</div>
								<div class="checklist-new-item u-gutter js-new-checklist-item">
									<textarea class="checklist-new-item-text js-new-checklist-item-input" placeholder="Add an item..." style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:if> 
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
						</a> <a class="window-sidebutton attachmentbtn" id="attachmentbtn"> <span class="icon-sm"> <img
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
		
		<div class="inline-edit">
			<!-- <div class="comp"></div> -->
			<div class="edit-controls u-clearfix">
				<input class="primary confirm js-save-edit" type="submit" value="save" />
				<a class="ui-icon ui-icon-closethick" href="#"></a>
			</div>
			<div class="add-controls u-clearfix">
				<input class="primary confirm js-save-add" type="submit" value="add" />
				<a class="ui-icon ui-icon-closethick" href="#"></a>
			</div>
		</div>
		<!-- 다이얼로그 -->
		<div id="attachmentdialog">
		<div class='attachmentForm'>
			<form id="uploadForm" method="post" enctype="multipart/form-data"> <!-- action="insertAttachment.action"  -->
				<input type="hidden" name="cardno" id="cardno" value=${cardno } />
				<input type="hidden" name="boardno" id="boardno" value=${boardno } />
				<input class="window-uploadbutton" type='file' class="" id="file" name='file' style="border:none;"/>
				<br/>
				&nbsp;&nbsp;
				<input class="window-uploadbutton" type='submit' name="submit" id="submitbtn" value='Upload' /> <!--  onclick="javascript:Upload();" -->
			</form>
		</div>
			<%-- <c:import  url="/WEB-INF/views/card/upload.jsp"/> --%>
		</div>
	</div>
	
	
	
</div>
