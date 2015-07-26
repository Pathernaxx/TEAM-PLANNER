<%@page import="com.teamplanner.dto.Card"%>
<%@page import="com.teamplanner.dto.BoardList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/board.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/jquery-ui.min.css" />

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
	
	//////////////////////////////////////////////////리스트추가 다이얼로그
	function addList() {
			var listname = $("#listname").val();
			var boardNo = $("#boardNo").val();
			$.ajax({
				url:'/finalProject/board/insertlist.action',
				type:'get',
				data: {
					listname: listname,
					boardno: boardNo
				},	
				success: function(message) {
					if(message == "complete") {
						$("#listname").val("");
						dialog.dialog("close");
						var url = '/finalProject/board/boardview.action?boardno='+boardNo;
						$(location).attr('href', url);
					} else {
						alert("등록실패");
					}
				}
			});
		}
		
		dialog = $(".addlist-dialog").dialog({
			autoOpen: false,
			height:100,
			widht:300,
			buttons: {
				"Add": addList,
				Cancel: function() {
					$("#listname").val("");
					dialog.dialog("close");
					$(".add-list").css("display","block");
				}
			}
		});
		$(".add-list").click(function() {
			dialog.dialog("open");
			
		});
		//////////////////////////////////////////////////카드추가 다이얼로그
		function addCard() {
			var cardname = $("#cardname").val();
			var boardNo = $("#boardNo").val();
			var listNo = $("#listNo").val();
			$.ajax({
				url: '/finalProject/board/insertcard.action',
				type: 'get',
				data: {
					cardname: cardname,
					boardno: boardNo,
					listno: listNo
				},
				success: function(message) {
					if(message == "complete") {
						$("#cardname").val();
						dialog.dialog("close");
						var url = '/finalProject/board/boardview.action?boardno='+boardNo;
						$(location).attr('href', url);
					} else {
						alert("등록실패");
					}
				}
			});
		}
		dialog = $(".addcard-dialog").dialog({
			autoOpen: false,
			height:100,
			widht:300,
			buttons: {
				"Add": addCard,
				Cancel: function() {
					$("#cardname").val("");
					dialog.dialog("close");
					$(".add-card").css("display","block");
				}
			}
		});
		$(".add-card").click(function() {
			dialog.dialog("open");
		});
		
		//////////////////////////////////////////////////
		
		
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
									<div id="panel-1"><%@include file="teamlist.jsp"%></div>
									<div id="panel-2">멤버리스트</div>
									<div id="panel-3">첨부파일</div>
									<div id="panel-4">archived</div>
								</div>
							</div>
						</div>
						<div id="pollSlider-button"></div>	
						<!-- <span class="ui-icon ui-icon-transferthick-e-w"></span> -->
					</div> 
				</div>
	
				<div class="canvas">
				<div>
					<%List<BoardList> boardLists = (List<BoardList>)request.getAttribute("boardLists"); %>
						<%for(BoardList list : boardLists) { %>
						<%int boardNo = list.getBoardNo(); %>
						<input type="hidden" id="boardNo" value=<%=boardNo %> />
						<div class="list">
							<div class="list-header u-clearfix">
								<h2 class="list-header-name"><%=list.getName() %></h2>
							</div>
							<div class="list-cards u-clearfix">
							<%for(Card card : list.getCards()) { %>
							<div class="list-card">
								<div class="list-card-details">
									<a class="list-card-title" href="#"><%=card.getName() %></a>
								</div>
							</div>
							<%} %>
							</div>
							<!-- <div class="list-card"> -->
							<%int listNo = list.getNo(); %>
							<input type="hidden" id="listNo" value=<%=listNo %> />
								<div class="add-card"><a class="open-card" href="#">Add a card...</a></div>
							<!-- </div> -->
						</div>
						<%}%>
					<div class="list">
						<div class="add-list"><a class="open-list">Add a list...</a></div>
					</div>
				</div>
				</div>
					<!-- list 추가 -->
					<div class="addlist-dialog">
						<form>
							<input class="newlistname" type="text" name="listname" id="listname" value="Add a list..." />
							<input id="position" type="hidden" value="1" />
						</form>
					</div>
					
					<!-- card 추가 -->
					<div class="addcard-dialog">
						<form>
							<input class="newcardname" type="text" name="cardname" id="cardname" value="Add a card..." />
							<input id="position" type="hidden" value="1" />
						</form>
					</div>
				
			</div>
		</div>
		</div>
	</div>	
</body>
</html>
