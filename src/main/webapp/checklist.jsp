<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="/finalProject/resources/styles/jquery-ui.css" >
<title>Check List</title>
<style>
.checklist-item-check-box {
	backgournd: #fff;
	border-radius: 3px;
	box-shadow: 0 2px 3px rgba(0, 0, 0, .1);
	border: 1px solid #d6dadc;
	border-bottom-color: #c4c9cc;
	font-weight: 700;
	position: absolute;
	left: 5px;
	line-height: 18px;
	over-flow: hidden;
	text-align: center;
	text-indent: 100%;
	top: -1px;
	height: 18px;
	width: 18px;
	white-space: nowrap;
}
.ui-icon.ui-icon-check.unchecked {
	display: inline;
}
.checklist-item {
	clear: both;
	margin: 0 0 6px;
	padding: 0 0 4px 38px;
	position: relative;
}
.window-module {
	clear: both;
	margin-bottom: 20px;
	position: relative;
}
.checklist {
	margin-bottom: 16px;
}
.checklist-item-details-text{
	min-height: 18px;
	margin-bottom: 0;
}
p {
	margin: 0 0 8px;
}
.editing .hide-on-edit {
	display: none!important;
}
.editable .current {
	cursor: pointer;
}
.markeddown {
	word-wrap: break-word;
}

/* 텍스트 수정 중일 때 */
.editing .edit {
	display: block;
	float: left;
	padding-bottom: 9px;
	z-index: 100;
	width: 100%;
}

.edit {
	display: none;
	position: relative;
}
</style>
<script type="text/javascript">
	$(function(){
		$('.checklist-item-check-box').click(function(event) {
			
			if($(this).find('span.checklist-item-checkbox-check').is('.checked')) {
				$(this).find('span.checklist-item-checkbox-check').removeClass('checked');
				$(this).find('span.checklist-item-checkbox-check').addClass('unchecked');
			} else {
				$(this).find('span.checklist-item-checkbox-check').removeClass('unchecked');
				$(this).find('span.checklist-item-checkbox-check').addClass('checked');
			}
		});
		$('.editable').click(function(event) {
			$(this).addClass('editing');
			var text = $(this).find('.js-checkitem-name')[0].innerHTML;
			$(this).find('textarea').val(text);
			//alert($(this).find('.js-checkitem-name').innerHTML);
		});
	});
</script>
</head>
<body>
	<div class="window-module">
		<div class="checklist">
			<div style="min-height: 8px">
				<div class="checklist-item">
					<div class="checklist-item-check-box ui-icon-check checked">
						<span class="ui-icon ui-icon-check checklist-item-checkbox-check"></span>
					</div>
					<div class="checklist-item-details non-empty editable">
						<p class="checklist-item-details-text">된다아</p>
					</div>
				</div>
				<div class="checklist-item">
					<div class="checklist-item-check-box ui-iconcheck">
						<span class="ui-icon ui-icon-check checklist-item-checkbox-check unchecked"></span>
					</div>
					<div class="checklist-item-details non-empty editable" style="text-decoration: line-through">
						<p class="checklist-item-details-text current hide-on-edit markeddown js-checkitem-name">될까?</p>
						<div class="edit delete convert options-menu">
							<textarea class="field full single-line js-checkitem-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>