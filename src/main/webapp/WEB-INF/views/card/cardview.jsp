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
	

	//$('#cardinfo').on('click', ".updateinfo", function() {
	$(".updateinfo").click(function() {
	
		$('.editinfo').css('visibility', 'visible');
		$('.editinfo').css('display', 'block');
		
		$('#information').css('onfocus', 'this.value=""');
		
	});
	
	$(".editinfo").click(function() {
		$(".window-attachment").html(' ');
		$(".window-attachment").append('<div class="editform">');
		$(".window-attachment").append('<form id="editcontent" action="writecardinfo.action" method="post" enctype="multipart/form-data">');
		$(".window-attachment").append('<input id="information" type="text" class="edit-cardinfo"/>');
		$(".window-attachment").append('<input type="hidden" id="boardno" value="${boardno }">');
		$(".window-attachment").append('<input type="hidden" id="cardno" value="${cardno }">');
		$(".window-attachment").append('<input type="hidden" id="listno" value="${listno }">');
		$(".window-attachment").append('</form><br/>');
		$(".window-attachment").append('<input type="button" value="save" id="infosubmit" class="window-sidebutton" style="float:right;text-align:center"/>');
		$(".window-attachment").append('<input type="button" value="cancel" id="cancel" class="window-sidebutton" style="float:right;text-align:center" />');
		$(".window-attachment").append('</div>');
		
		$("#infosubmit").click(function(e) {
			$.ajax({
				url: "/finalProject/card/writecardinfo.action",
				async: true,
				type: "post",
				data: {
					boardno: '${boardno}',
					listno: '${listno}',
					cardno: '${cardno}',
					information: $("#information").val()
				},
				success: function(result) {
					$(".window-attachment").html(' ');
					$(".window-attachment").append(result);
				},
				error: function(xhr, status, ex) {
					alert(status + ex);
				}
			});
			e.preventDefault();
		});
		
		$("#cancel").click(function() {
			$(".window-attachment").html(' ');
			$(".window-attachment").append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
			$(".window-attachment").append('<span id="cardinfo">');
			$(".window-attachment").append('<a class="editinfo" style="cursor: pointer;">');
			$(".window-attachment").append('<img src="/finalProject/resources/styles/images/icons/234.png" class="window-icon2" />&nbsp;');
			$(".window-attachment").append('Write the Discription</a></span>');
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
			c = $('#tagMemberbtn').webuiPopover({
				constrains: 'horizontal',
				trigger: 'click',
				multi: false,
				placement: 'right',
				width: 300,
				closeable: true,
				arrow: false,
				title: 'Tag Member',
				content: result,

			});

		},
		error: function() {
			alert("tag error");
		}
	});
	
	$('.cardinfo-text').click(function() {
	
		$(this).parents(".cardinfo-edittable").addClass("editing");
	});
	
});


</script>

<style>
.cardinfo-edittable {
	
}

.info-edit{
	display: none;
	
}

.editing .info-edit{
	display: block;
}

.editing .cardinfo-text{
	display: none;
}

</style>

<div class="window-wrapper">
	
	<input type="hidden" id="cardno" value=${cardno } />
	<input type="hidden" id="boardno" value=${boardno } />
	<input type="hidden" id="cardinfo" value=${cardinfo } />
	<input type="hidden" id="listno" value=${listno } />
	
	
	<div class="card-detail-window">
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
					<!-- <div id="cardinfo"> -->
						<c:choose>
							<c:when test="${ empty cardinfo }">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span id="cardinfo">
									<a class="editinfo" style="cursor: pointer;">
										<img src="/finalProject/resources/styles/images/icons/234.png"
										class="window-icon2" />&nbsp;
										Write the Discription
									</a>
								</span>
								<span><img src="/finalProject/resources/styles/images/icons/234.png" class="window-icon2" /></span>
								<span class="cardinfo-edittable">
									<span><p class="cardinfo-text">Write the Discription</p></span>
									<span class="info-edit">
										<textarea class="js-info-input" style="overflow:hidden;resize:none;word-wrap:break-word;height:60px"></textarea>
									</span>
								</span>
							</c:when>
							<c:otherwise>
							<span>&nbsp;&nbsp;&nbsp;${ cardinfo}</span><br/>
							<span>
								<a class="editinfo" style="float:right;color:#8c8c8c;font-size: small;cursor:pointer">
								Edit the Discription</a>
							</span>
							</c:otherwise>
						</c:choose>
					<!-- </div> -->
				</div>
				<div class="window-boardComment">
					<div class="window-header">
						<div id="attachment-title" class="attachment-title">
							<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/13.png" class="window-icon2" /></span>
							<span class="content-space">Members</span>
						</div>
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
														<a id="filedownload" href="/finalProject/card/filedownload.action?fileno=${attlist.no }" style="text-decoration: underline">
															Download</a>
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
						
						<div class="attachment-title">
							<span class="icon-space"><img src="/finalProject/resources/styles/images/icons/199.png" class="window-icon2" /></span>
							<span class="content-space">Activity</span>
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
	</div>
	
	
	
</div>
