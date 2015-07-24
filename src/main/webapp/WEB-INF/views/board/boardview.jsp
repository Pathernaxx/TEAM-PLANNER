<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/board.css" />

<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript" src="/finalProject/resources/js/jquery.scrollTo.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$('#mask').css({'height':$('#panel-1').height()});	
	$('#panel').width(parseInt($('#mask').width() * $('#panel div').length));
	$('#panel div').width($('#mask').width());
	$('a[rel=panel]').click(function () {
		var panelheight = $($(this).attr('href')).height();
		$('a[rel=panel]').removeClass('selected');
		$(this).addClass('selected');
		$('#mask').animate({'height':panelheight},{queue:false, duration:500});			
		$('#mask').scrollTo($(this).attr('href'), 800);		
		return false;
	});
	
	$.ajax({
		url: "/finalProject/board/boardview.action",
		async: true,
		data: {
			boardno : 1
		},
		method: "post",
		success: function(result) {
			
			$.each(result, function(index, item) {
				var output="";
				output += '<div class="list">';
				output += '<div class="list-header u-clearfix">'; 
				output += '<h2 class="list-header-name">' + item.name + '</h2>';
				output += '</div>';
				output += '<div class"list-cards u-clearfix">'
				for(var card in item.cards) {
					output += '<div class="list-card"><div class="list-card-details"><a class="list-card-title" href="#">'
								+ item.cards[card].name +
								'</a></div></div>';
				};
				output += '</div>'
				output += '<div class="add-card"><a class="open-card" href="#">Add a card...</a></div>';
				output += '</div>';
				$(".canvas").append(output);
				
				$(".list").sortable({
					connectWith: ".list"
				}).disableSelection();
			});
			
		},
		error: function() {
			alert("error");
		}
	});
	
	$('#pollSlider-button').click(function() {
		if($(this).css("margin-right")=="300px") {
			$('.pollSlider').animate({"margin-right":'-=300'});
			$('#pollSlider-button').animate({"margin-right":'-=300'});
		} else {
			$('.pollSlider').animate({"margin-right":'+=300'});
			$('#pollSlider-button').animate({"margin-right":'+=300'});
		}
	});
	
});

</script>

</head>
<body style="background-color: #ab0c67">
	<div class="content">
		<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div>
		
		<div id="content" class="clearfix">
			<div class="wrapper">
			
				<div class="header">
					<a class="header-btn header-btn-name" href="#">
						<span class="header-btn-text">프로젝트명</span>
					</a>
					<div class="header-btns">
						<!-- <a class="header-btn show-menu" href="#">
							<span class="header-btn-icon"></span>
							<span id="showMenu" class="header-btn-text">Show Menu</span>
						</a> -->
						<div class="pollSlider">
							<div id="scroller-header">
								<a href="#panel-1" rel="panel" class="selected">Activity</a>
								<a href="#panel-2" rel="panel">Team List</a>
								<a href="#panel-3" rel="panel">Files</a>
								<a href="#panel-4" rel="panel">Archived</a>							
							</div>
							<div id="scroller-body">
								<div id="mask">
								<div id="panel">
									<div id="panel-1">액티비티</div>
									<div id="panel-2">멤버리스트</div>
									<div id="panel-3">첨부파일</div>
									<div id="panel-4">archived</div>
								</div>
							</div>
						</div>
						<div id="pollSlider-button"><span class="ui-icon"></span></div>	
					</div> 
					
				</div>
				
				<div class="canvas">
				</div>	
				
			</div>
		</div>
		</div>
	</div>	
</body>
</html>