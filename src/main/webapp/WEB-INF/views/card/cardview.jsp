<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
function addBoard(){}

$(function() {
	var boardno = $("#boardno").val();
	var cardno = $("#cardno").val();
	var cardinfo = $("#cardinfo").val();

	var attachmentdialog = $('#attachmentdialog').dialog({
		autoOpen: false,
		height: 160,
		width: 280
	});	
	$('#attachmentbtn').click(function() {
		attachmentdialog.dialog("open");
	});
	
	$("#comment-save").click(function() {
		var content = $(".activity-comment").val();
		var cardno = ${cardno}
		$.ajax({
			url: '/finalProject/card/insertComment.action',
			type: 'POST',
			data: {
				content: content,
				cardno: cardno
			},
			success: function(message) {
				$(".activity-comment").val(" ");
			},
			error: function() {
				alert("error")
			}
		});
	});
	
	$("#uploadForm").submit(function(event) {
		event.preventDefault();
		var formData = new FormData(this);
		var string = "<div class='atttr attachment-title'>" +
						"<span class='icon-space'><img src='/finalProject/resources/styles/images/icons/1.png' class='window-icon2' /></span>" +
						"<span class='content-space'>Attachment</span>" +
					 "</div>";
		$.ajax({
			url: '/finalProject/card/insertAttachment.action',
			type: 'POST',
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			success: function(result) {
				 if($("#last-attachment") != null && $("#last-attachment").length > 0 ) {
					$("#last-attachment").before(result);
				} else {
					$(".window-attachment").after(result).after(string);
					//$(".window-attachment").append(result);
				}
				attachmentdialog.dialog("close");
			},
			error: function(xhr, status, ex) {
				alert(status+ex);
			}
		});
		
	}); 
	
	$('.window-header').on('click', "#filedelete", function() {
		//$(this).parent("#atttr").slideUp('fast', function(){$(this).remove();});
		//alert($(this).parents(".attachment-options").find('input').val());
		var tempthis = $(this);
		$.ajax({
			url: '/finalProject/card/deleteAttachment.action',
			type: 'GET',
			data: {
				fileno : $(this).parents(".attachment-options").find('input').val()
			},
			success: function(message) {
				if(message == "success") {
					tempthis.parents(".atttr").remove();
					alert("삭제완료")
				} else {
					alert("삭제실패")
				}
			}
		});
	});
	
	$("#cancelbtn").click(function() {
		attachmentdialog.dialog("close");
	});
	
	$('body .window-attachment').on("click", ".js-save-edit", function() {
		
		var text = $(".js-cardinfo-input").val();
		$.ajax({
			url: "/finalProject/card/writecardinfo.action",
			async: true,
			type: "post",
			data: {
				boardno: '${boardno}',
				listno: '${listno}',
				cardno: '${cardno}',
				information: text
			},
			success: function() {
				$(".js-cardinfo-name").text(text);
				$(".js-cardinfo-input").val("");
			},
			error: function(xhr, status, ex) {
				alert(status + ex);
			}
		});
		
		$(this).parents(".card-info-details").removeClass('editing');
		$('.inline-edit').append($('.edit-controls'));
		
		return false;
	});
	
	$('.window-attachment').on("click", ".js-cardinfo-input", function() {
		return false;
	});

	
	$("body").on("click", ".js-cardinfo-name", function() {
		var text = $(this)[0].innerHTML;
		
		$(this).parents(".card-info-details").find(".js-cardinfo-input").val(text);
		
		$(this).parents(".card-info-details").addClass('editing');
		
		$(this).parents(".card-info-details").find(".js-cardinfo-input").after($(".edit-controls"));
		
		return false;
	});
	
	$('body').on('click', "#archivebtn", function() {
		$.ajax({
			url: "/finalProject/card/archiveCard.action",
			typd: "GET",
			data: {"cardno" : cardno},
			success: function() {
				//alert("aaa");
				//카드다이얼로그 꼭대기에 "this card is archived" 띄우고 archive버튼 아래에 "return to board" 버튼 삽입
				$("#dialog-header").before("<div id='notice'><h2 style='color:red;'>THIS CARD IS ARCHIVED</h2></div>");
				$("#returnbtn").css("visibility", "visible");
				$("#returnbtn").css("display", "block");
			}, 
			error: function() {
				alert("error");
			}
		});
		
		//$('.js-list-find'+cardno).remove();
		
	});
	
	$("#returnbtn").click(function() {
		$.ajax({
			url: "/finalProject/card/returnCard.action",
			typd: "GET",
			data: {"cardno" : cardno},
			success: function() {
				//alert("aaa");
				$(".window-wrapper").find("#notice").remove();
				$("#returnbtn").css("visibility", "hidden");
				$("#returnbtn").css("display", "none");
			}, 
			error: function() {
				alert("error");
			}
		});
	});
	
	/*///////////////////동윤/////////////////////////// */

	
	var target = $("#tagMemberbtn");
	var tagdialog = $( "#tagMemberForm" ).dialog({
	      autoOpen: false,
	      height: 200,
	      width: 250,
	      position: { my: 'left', at: 'right' ,of : target},
	      buttons:{
	    	  Cancel: function(){
	    		  $("#tagmemberlist").val("");
	    		  tagdialog.dialog("close");
	    	  }
	      }
	});
	
	function searchKeyup(event) {
		var text = $("#searchmember").val();
		if(text == "") {
			return;
		}
		$.ajax({
			url: "/finalProject/card/searchCardTagMember.action",
			type: "get",
			data: {
				text : text,
				boardNo : boardno,
				cardNo : cardno
			},
			success : function(members){
				var html;
				//var div = $("#tagmemberlist");
				var div = tagdialog.find("#tagmemberlist");
				/* for(var key in members){
					html+="<div class='tagonemember'><img class='member-avatar' src='/finalProject/resources/images/user.png' width='40px' height='40px'>"
					+ "&nbsp;&nbsp;" + members[key].userName+ "</div>";
				}
				div.html(html); */
				div.html('');
				$.each(members, function(index, member) {
					div.append("<div class='tagonemember' id='"+member.no+"'><img class='member-avatar' src='/finalProject/resources/images/user.png' width='40px' height='40px'>"
							+ "&nbsp;&nbsp;" + member.userName+ "</div>");
				});	
			}
		});	
	}
	
	$('body').on('click', '.tagonemember', function() {
		var id = $(this).attr('id');
		$.ajax({
			url : '/finalProject/card/selectCardMemberInCard.action',
			type: "get",
			data : {
				tagNo : id,
				cardNo : cardno,
				boardNo : boardno
			},
			success : function(member){
				$('.appendcardtag').append("<img class='member-avatar' src='/finalProject/resources/images/user.png' width='40px' height='40px' title="+member.userName+">");
				$("#tagmemberlist").val("");
				tagdialog.dialog("close");
			}
		
		}) 
	
	});
	
	$("#tagMemberbtn").click(function(){
		var input = tagdialog.find("#searchmember");
		input.val('');
		input.keyup(searchKeyup);
		tagdialog.dialog("open");
		
	});
	
	
	
	
	
	
	
	
	//////////////////////////// 녕수 ////////////////////////////
	var checklistdialog = $('#checklistdialog').dialog({
		autoOpen: false,
		height: 130,
		width: 280
	});	
	
	$('.js-checklist-add-btn').click(function() {
		checklistdialog.dialog("open");
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
		$('body .js-add-checklist').on('click', function(event) {
			removeControls();
			
			var title = $('#title').val();
			
			if( title == "") {
				return;
			}
			var no;
			$.ajax({
				url: '/finalProject/card/insertchecklist.action',
				type: 'post',
				async: 'false',
				data : {
					name: title,
					cardno: cardno
				},
				success: function(data) {
					$('.window-module').append(
						'<div class="checklist" id="' + data + '">' +
							'<div class="window-module-title window-module-title-no-divider">' +
								'<span class="window-module-title-icon icon-lg icon-checklist"></span>' +
								'<div class="editable non-empty checklist-title">' +
									'<h3 class="current hide-on-edit">' + title + '</h3>' +
									'<div class="window-module-title-options">' +
										'<a class="hide-on-edit js-confirm-delete">Delete...</a>' +
									'</div>' +
									'<div class="edit edit-heavy">' +
										'<textarea class="field full single-line" style="overflow: hidden; word-wrap: break-word; resize: none; height: 54px"></textarea>' +
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
						'</div>'
					);
					//alert('checklist insert complete');
				},
				error: function() {
					//alert('checklist insert error');
				}
			});		
			
			$('.focus .js-new-checklist-item-input').after($('.add-controls'));
			$('#title').val("");
			event.stopPropagation();
		});
		
		function progressPercent(current) {
			var a = current.parents('.checklist-items-list').find('.checklist-item');
			var b = current.parents('.checklist-items-list').find('.complete-checklist');
			var c = $.percentage(b.length , a.length) + '%';
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-percent').text(c);
			current.parents('.checklist').find('.checklist-progress').find('.js-checklist-progress-bar').css('width', c);
		}
		
		$(".window-module").on("click", '.js-toggle-checklist-item', function(event) {
			//event.preventDefault();
			var id = $(this).parents('.checklist-item').attr('id');
			var check;
			if($(this).parents('.checklist-item').hasClass('complete-checklist')) {
				
				check = false;
				
				$(this).parents('.checklist-item').removeClass('complete-checklist');
				progressPercent($(this));
			} else {
				$(this).parents('.checklist-item').addClass('complete-checklist');
				
				check = true;
				
				progressPercent($(this));
			}
			//alert(id);
			$.ajax({
				url: '/finalProject/card/updatecheckitembycheck.action',
				type: 'post',
				data: {
					checkitemno : id,
					checked : check
				},
				success: function() {
					//alert('toggle complete');
				},
				error: function() {
					//alert('toggle error');
				}
			});
			//event.stopPropagation();
		});
		
		var text = "";
		
		$('.window-module').on('click', '.js-new-checklist-item-input', function(event) {
			removeControls();
			
			$(this).parents('.js-new-checklist-item').addClass('focus');
			
			$(this).after($('.add-controls'));
			event.stopPropagation();
		});
		
		$('.window-module').on('click', '.js-checkitem-name', function(event) {
			removeControls();
			
			//var id = $(this).parents('.checklist-item').attr('id');
			
			$(this).parents('.editable').addClass('editing');
			
			text = $(this)[0].innerHTML;
			$(this).parents().find('.js-checkitem-input').val(text);
			
			$(this).parents().find('.editing .js-checkitem-input').after($('.edit-controls'));
			event.stopPropagation();
		});
		
		$('.window-module').on('click', '.js-checkitem-input', function(event) {
			//event.preventDefault();
			//event.stopPropagation();
			return false;
		});
		
		$('.window-module').on('click', '.js-delete-item', function(event){
			var id = $(this).parents('.checklist-item').attr('id');
			var currentitem = $(this).parents('.checklist-item');
			$.ajax({
				url: '/finalProject/card/deletecheckitem.action',
				type: 'post',
				data: {
					checkitemno : id
				},
				success: function() {
					removeControls();
					currentitem.remove();
				},
				error: function() {
					
				}
			})
		});
		
		$('.window-module').on('click', '.js-confirm-delete', function(event){
			var id = $(this).parents('.checklist').attr('id');
			var currentlist = $(this).parents('.checklist');
			$.ajax({
				url: '/finalProject/card/deletechecklist.action',
				type: 'post',
				data: {
					checklistno : id
				},
				success: function() {
					currentlist.remove();
				},
				error: function() {
					
				}
			});
		});
		
		$('.window-module').on('click', '.js-save-edit', function(event) {
			var message = $(this).parents('.editing').find('.js-checkitem-input').val();
			
			// null Check
			if(message == "") {
				alert('입력 해주세요.');
				return;
			}
			
			//alert(message);
			
			if( text == message ) {
				//alert('변경 없음');
			} else {
				//alert('변경 있음');
				$('.editing .js-checkitem-name').text(message);
				
				// ajax 요청
				var id = $(this).parents('.checklist-item').attr('id');
				
				$.ajax({
					url: '/finalProject/card/updatecheckitemname.action',
					type: 'post',
					data: {
						checkitemno : id,
						name : message
					},
					success: function() {
						//alert('itemName complete');
					},
					error: function() {
						//alert('toggle error');
					}
				});
			}
			$('.editable.editing').removeClass('editing');
			$('.inline-edit').append($('.edit-controls'));
			event.stopPropagation();
		});
		
		$('.window-module').on('click', '.js-save-add', function(event) {
			//event.preventDefault();
			var message = $(this).parents('.focus').find('textarea.js-new-checklist-item-input');
			var id = $(this).parents('.checklist').attr('id');
			//alert(id);
			// null Check
			if(message == "") {
				alert('입력해주세요.');
				return;
			}
			//alert(message.val());
			var checklist = $(this).parents('.checklist').find('.checklist-items-list');
			
			$.ajax({
				url: '/finalProject/card/insertcheckitem.action',
				type: 'post',
				async: false,
				data: {
					checklistno : id,
					name : message.val()
				},
				success: function(result) {
					checklist.append('<div class="checklist-item" id="' + result + '">' +
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
					//alert('item insert complete');
				},
				error: function() {
					//alert('item insert error');
				}
			});
			
			message.val("");
			
			var current = $(this).parents('.checklist');
			var a = current.find('.checklist-items-list').find('.checklist-item');
			var b = current.find('.checklist-items-list').find('.complete-checklist');
			var c = $.percentage(b.length , a.length) + '%';
			current.find('.checklist-progress').find('.js-checklist-progress-percent').text(c);
			current.find('.checklist-progress').find('.js-checklist-progress-bar').css('width', c);
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
		<div class="window-header u-clearfix" id="dialog-header">
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
				<div class="attachment-title">
					<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/133.png" class="window-icon2" /></span>
					<span class="content-space">Card Detail</span>
				</div>
					<div class="card-info">
						<div class="card-info-details non-empty editable">
							<p class="card-info-details-text current hide-on-edit markeddown js-cardinfo-name">${ cardinfo eq null ? "Write a Discription.." : cardinfo }</p>
							<div class="edit delete convert options-menu">
								<textarea class="field full single-line js-cardinfo-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="window-boardComment">
					<div class="window-header">
						<div id="attachment-title" class="attachment-title">
							<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/13.png" class="window-icon2" /></span>
							<span class="content-space">Members</span>
						</div>
							<c:forEach var="member" items="${cardMembers}">
								<img class="member-avatar" src="/finalProject/resources/images/user.png" width="40px" height="40px" title="${member.userName }"><a style="text-decoration: none;">&nbsp;&nbsp;</a>
							</c:forEach>
							<a class="appendcardtag" style="text-decoration: none">&nbsp;</a>
							<br/>
						<!-- choose -->
						<c:choose>
							<c:when test="${ empty attachments }">
							</c:when>
							<c:otherwise>
								<div class="atttr attachment-title">
									<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/1.png" class="window-icon2" /></span>
									<span class="content-space">Attachment</span>
								</div>
							<c:forEach var="attlist" items="${attachments }">
								<div id="last-attachment" class="atttr card-elements" >
									<span class="icon-space"></span>
									<span class="content-space u-clearfix">
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
														<a id="filedownload" href="/finalProject/card/filedownload.action?fileno=${attlist.no }" style="text-decoration: underline">Download</a>
														&nbsp;&nbsp;
														<a id="filedelete" style="text-decoration: underline">Delete</a>
													</span>
												</p>
											</div>
										</span>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
						<div class="attachment-title">
							<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/133.png" class="window-icon2" /></span>
							<span class="content-space">CheckList</span>
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
											</div>
											<div class="edit edit-heavy">
												<textarea class="field full single-line" style="overflow: hidden; word-wrap: break-word; resize: none; height: 54px"></textarea>
											</div>
										</div>
									</div>
									<div class="checklist-progress">
										<span class="checklist-progress-percentage js-checklist-progress-percent">${ checklist.percentage }%</span>
										<div class="checklist-progress-bar">
											<div class="checklist-progress-bar-current js-checklist-progress-bar" style="width: ${ checklist.percentage }%;"></div>
										</div>
									</div>
									<div class="checklist-items-list js-checklist-items-list js-no-higher-edits ui-sortable">
										<c:if test="${ checklist.checkItems ne null }" >
											<c:forEach var="checkitem" items="${ checklist.checkItems }">
											<div class="checklist-item ${ checkitem.checked == true ? 'complete-checklist' : '' }" id="${ checkitem.no }">
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
								</c:forEach>
							</c:if> 
						</div>
						<div class="card-elements js-activity-view">
							<div class="attachment-title">
								<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/199.png" class="window-icon2" /></span>
								<span class="content-space">Activity</span>
							</div>
						</div>
						<div class="card-elements">
							<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/2.png" class="window-icon2" /></span>
							<span class="content-space"><input class="activity-comment" type="text" value="write a comment..." onfocus="this.value=''" /></span><br/>
							<button id="comment-save">save</button><br/>
						</div>
						
					</div>
					<div class="card-elements">
						<span class="icon-space"></span>
						<span class="content-space">누적 activity</span>
					</div>
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
						</a> <a class="window-sidebutton js-checklist-add-btn"> <span class="icon-sm"> <img
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
					</a> <a class="window-sidebutton" id="archivebtn"> <span class="icon-sm">
							<img src="/finalProject/resources/styles/images/icons/111.png" class="window-icon2" /> Archived
					</span>
					</a> <a class="window-sidebutton" id="returnbtn" style="visibility:visible;display:none"> <span class="icon-sm">
							<img src="/finalProject/resources/styles/images/icons/9.png" class="window-icon2" /> Return
					</span>
					</a>
					
				</div>
			</div>
		</div>
		
		<div class="inline-edit">
			<!-- <div class="comp"></div> -->
			<div class="edit-controls">
				<input class="primary confirm js-save-edit" type="submit" value="save" />
				<a class="ui-icon ui-icon-closethick" href="#"></a>
				<a class="option delete js-delete-item">Delete</a>
			</div>
			<div class="add-controls">
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
					<br/>&nbsp;&nbsp;
					<input class="window-uploadbutton" type='button' id="cancelbtn" value='Cancel' />
				</form>
			</div>
			<%-- <c:import  url="/WEB-INF/views/card/upload.jsp"/> --%>
		</div>
		
		<!-- Checklistdialog  -->
		<div id="checklistdialog">
			<form id="checklistForm">
				<label for=""></label>
				<input type="hidden" name="cardno" value="${ cardno }"/>
				<label for="title">Title</label>
				<input type="text" name="title" id="title" tabindex="1" placeholder="Checklist">
				<input class="js-add-checklist" id="Add" type="button" tabindex="2" value="Add">
			</form>
		</div>
		
		<!-- tagdialog -->
		<div id='tagMemberForm'>
			<form>

				<input type="text" id="searchmember" style="width: 90%;" />
				<br/><br/>
				<div id="tagmemberlist"><br/>
					
				</div>

			</form>
		</div>
		
	</div>	
</div>
