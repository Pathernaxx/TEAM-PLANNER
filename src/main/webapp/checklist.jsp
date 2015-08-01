<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
<!-- <link rel="stylesheet" href="/finalProject/resources/styles/jquery-ui.css" > -->
<title>Check List</title>
<style>

/* 체크리스트 생성시 style*/
.checklist {
	margin-bottom: 16px;
}

.window-module-title-no-divider {
	border-bottom: none;
}

.window-module-title-icon {
	left: -38px;
    position: absolute;
    top: 2px;
}

.window-module-title h3 {
	display: inline-block;
    width: auto;
    margin: 0 2px 0 0;
    min-height: 18px;
    min-width: 40px;
}

h3 {
	font-size: 16px;
    line-height: 1.25em;
    margin: 0 0 6px;
}

.window-module-title-options {
    float: right;
    margin-right: 2px;
}

.checklist .edit {
	clear: both;
	margin-top : -5px;
}

.edit-heavy .field {
	font-size: 15px;
	font-weight: 700;
	line-height: 18px;
}

/* checklist AddItem */
.u-gutter {
	margin-left: 38px;
}

.focus .add-controls {
    display: block;
}

.checklist-new-item-text, .checklist-new-item-text:hover {
    background: 0 0;
    border-color: transparent;
    box-shadow: none;
    color: #8c8c8c;
    cursor: pointer;
    margin-bottom: 4px;
    max-height: 32px;
    overflow: hidden;
    resize: none;
    text-decoration: none;
}

textarea {
    height: 150px;
    -webkit-transition: background 85ms ease-in,border-color 85ms ease-in;
    transition: background 85ms ease-in,border-color 85ms ease-in;
    resize: vertical;
    width: 100%;
}

textarea {
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-appearance: none;
    background-color: #e2e4e6;
    border: 1px solid #cdd2d4;
    border-radius: 3px;
    display: block;
    margin-bottom: 12px;
    min-height: 34px;
    padding: 7px;
}

.add-controls {
    display: none;
}

.ui-icon-check {
	background-position: -64px -144px;
}

.icon-team {
	background-image: url("/finalProject/resources/styles/images/ui-icons_222222_256x240.png");
	display: inline-block;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-style: normal;
    font-weight: 400;
    text-align: center;
    text-decoration: none;
}

.icon-team {
	height: 18px;
    font-size: 12px;
    line-height: 18px;
    width: 18px;
}

.icon-lg {
	height: 30px;
    font-size: 20px;
    line-height: 30px;
    width: 30px;
}

.icon-lg, .icon-team {
	color: #999;
}

.checklist-item-checkbox {
	background: #fff;
	border-radius: 3px;
	box-shadow: 0 2px 3px rgba(0, 0, 0, .1);
	border: 1px solid #d6dadc;
	border-bottom-color: #c4c9cc;
	font-weight: 700;
	position: absolute;
	left: 5px;
	line-height: 18px;
	overflow: hidden;
	text-align: center;
	text-indent: 100%;
	top: -1px;
	height: 18px;
	width: 18px;
	white-space: nowrap;
}

.complete-checklist .checklist-item-checkbox {
	background-color: #edeff0;
	border-color: #d6dadc #d6dadc #c4c9cc;
	box-shadow: none;
	text-indent: 0; 
}

/* .ui-icon.ui-icon-check.unchecked {
	display: inline;
} */

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

.editing .hide-on-edit {
	display: none!important;
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

/* textarea button */
.editable.editing {
	cursor: auto;
}

.add-controls, .edit-controls {
	clear: both;
	margin-top: 8px;
}

.button, button, input[type=button], input[type=submit] {
    background: -webkit-linear-gradient(top,#c4c9cc 0,#b6bbbf 100%);
    background: linear-gradient(to bottom,#c4c9cc 0,#b6bbbf 100%);
    border: none;
    box-shadow: 0 1px 0 #8c8c8c;
    cursor: pointer;
    display: inline-block;
    font-weight: 700;
    line-height: 22px;
    margin: 8px 4px 0 0;
    padding: 7px 20px;
    text-align: center;
}

.add-controls input[type=submit], .edit-controls input[type=submit] {
	float: left;
	height: 32px;
	margin-top: -2px;
	padding-top: 5px;
	padding-bottom: 5px;
}

input[type=submit].primary {
	background: linear-gradient(to bottom, #61bd4f 0, #5aac44 100%);
	box-shadow: 0 1px 0 #4d4d4d;
	color: #fff;
}

.inline-edit .edit-controls {
	height: 0;
	margin: 0;
	overflow: hidden;
}

/* 체크리스트 텍스트 관련 */
.complete-checklist .checklist-item-details-text {
	color: #8c8c8c;
	font-style: italic;
	text-decoration: line-through;
}

.editable .current {
	cursor: pointer;
}

.checklist-item-details-text{
	min-height: 18px;
	margin-bottom: 0;
}

.markeddown {
	word-wrap: break-word;
}

p {
	margin: 0 0 8px;
}

a {
    color: #999;
    text-decoration: underline;
    cursor: auto;
}
</style>
<script type="text/javascript">
	$(function(){
		$('.check').click(function() {
			$('.activity').before('<div class="checklist-list window-module">'+ 
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
						'<div class="checklist-items-list js-checklist-items-list js-no-higher-edits ui-sortable"></div>' +
						'<div class="checklist-new-item u-gutter js-new-checklist-item">' +
							'<textarea class="checklist-new-item-text js-new-checklist-item-input" placeholder="Add an item..." style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>'+
							'<div class="add-controls u-clearfix">' +
								'<input class="primary confirm js-add-checklist-item" type="submit" value="Add" />' +
								'<a class="icon-lg icon-close dark-hover cancle js-cancle-checklist-item" href="#"></a>' +
							'</div>' +
						'</div>' +
					'</div>');
		});
		
		$('.checklist-item-checkbox').click(function(event) {
			
			if($(this).parents('.checklist-item').hasClass('complete-checklist')) {
				$(this).parents('.checklist-item').removeClass('complete-checklist');
			} else {
				$(this).parents('.checklist-item').addClass('complete-checklist');
			}
			
		});
		
		var text = "";
		$('.js-checkitem-name').click(function(event) {
			//$(this).addClass('editing');
			$(this).parents('.editable').addClass('editing');
			//var text = $(this).find('.js-checkitem-name')[0].innerHTML;
			text = $(this)[0].innerHTML;
			$(this).parents().find('textarea').val(text);
			//alert($(this).find('.js-checkitem-name').innerHTML);
			$(this).parents().find('.editing textarea').after($('div.edit-controls'));
			//$(this).find('textarea').after('<div></div>').addClass('edit-controls').addClass('u-clearfix');
		});
		
		$('.js-save-edit').click(function() {
			var message = $(this).parents('.editing .options-menu').find('textarea').val();
			alert(message);
			
			if( text == message ) {
				alert('변경 없음');
			} else {
				alert('변경 있음');
				$('.editing .checklist-item-details-text').text(message);
				// ajax 요청
			}
			$('.editable.editing').removeClass('editing');
			$('.inline-edit .comp').after($('.edit-controls'));
		});
	});
</script>
</head>
<body>
	
	<div class="activity">
	</div>
	<div class="window-module">
		<div class="checklist">
			<div style="min-height: 8px">
				<div class="checklist-item">
					<div class="checklist-item-checkbox ui-icon-check">
						<span class="icon-team ui-icon-check checklist-item-checkbox-check"></span>
					</div>
					<div class="checklist-item-details non-empty editable">
						<p class="checklist-item-details-text current hide-on-edit markeddown js-checkitem-name">된다아</p>
						<div class="edit delete convert options-menu">
							<textarea class="field full single-line js-checkitem-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
						</div>
					</div>
				</div>
				<div class="checklist-item">
					<div class="checklist-item-checkbox ui-iconcheck">
						<span class="icon-team ui-icon-check checklist-item-checkbox-check"></span>
					</div>
					<div class="checklist-item-details non-empty editable">
						<p class="checklist-item-details-text current hide-on-edit markeddown js-checkitem-name">될까?</p>
						<div class="edit delete convert options-menu">
							<textarea class="field full single-line js-checkitem-input" type="text" style="overflow: hidden; word-wrap: break-word; resize: none; height: 52px"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="inline-edit">
		<div class="comp"></div>
		<div class="edit-controls u-clearfix">
			<input class="primary confirm js-save-edit" type="submit" value="save" />
			<a class="ui-icon ui-icon-closethick" href="#"></a>
		</div>
		<div class="add-controls u-clearfix">
			<input class="primary confirm js-save-add" type="submit" value="add" />
			<a class="ui-icon ui-icon-closethick" href="#"></a>
		</div>
	</div>
	<input type="button" class="check" value="테스트" />
</body>
</html>