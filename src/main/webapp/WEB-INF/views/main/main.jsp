<%@page import="java.util.List"%>
<%@page import="com.teamplanner.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/main.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/jquery-ui.min.css" />

<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<script>
	$(document).ready(function(){
		var dialog;
		function addBoard(event){
			var title = $("#title").val();
			var check = /^[\s]+$/;
			var checkTitle = check.test(title);
			
			if(checkTitle==false && title != ""){
				$.ajax({
					url:'/finalProject/board/insertboard.action',
					type: 'get',
					data: {
						title : title
					},
					success: function(message){
						if(message == "complete"){
							$("#title").val("");
							dialog.dialog("close");
							var url = '/finalProject/board/boardmain.action';
							$(location).attr('href', url);
						}else if(message == "check"){
							alert("이름이 중복됩니다.")
						}else{
							alert("error - can't make board");
						}						
					},
					error:function(){
						$("#title").val("");
						alert("데이터가 전송되지않음");
					}					
				});
			}else{
				$("#title").val("");
				return;
			}
			event.preventDefault();
		}
		dialog = $( "#dialog-form" ).dialog({
		      autoOpen: false,
		      height: 230,
		      width: 300,
		      buttons:{
		    	  "CREATE" : addBoard,
		    	  Cancel: function(){
		    		  $("#title").val("");
		    		  dialog.dialog("close");
		    		  $(".createBoard").css("display","block");
		    	  }
		      }
		});
		$('.createBoard').click(function(){
			dialog.dialog("open");
			$(".createBoard").css("display","none");
		});
		
		$(".getclosedboardlist").css("display","none");
		function toggleEffect(event){
			var selectedEffect = "blind";
			var options = {};
			$.ajax({
				url:'/finalProject/board/closedboardview.action',
				type: 'get',
				success : function(boards){
					var html = "<ul style='padding-left: 5%;list-style: none;height:100%;'>"
					var div = $(".getclosedboardlist");
					for(var key in boards){
						html+="<li class='closedboard'>●&nbsp;&nbsp;<a class='closedboardlink' href='/finalProject/board/closedBoardPage.action?boardNo="+boards[key].no+"'>"
						+ boards[key].name +"&nbsp;-&nbsp;&nbsp;" + boards[key].regdate + "</a></li>";
					}
					html +="</ul>";
					if(boards.length>0){
						div.html(html);
					}else{
						alert('잠겨있는 보드가 없습니다.');
					}
				}
			});
		    $( ".getclosedboardlist" ).toggle( selectedEffect, options, 500 );
		    event.preventDefault();
		}
		$(".clickclosedlist").click(function(){
			toggleEffect();
		});
		$(".board").click(function(){
			var id = $(this).attr('id');
			var url = '/finalProject/board/boardview.action?boardno='+id;
			$(location).attr('href', url);
		});
		
	});
</script>
</head>
<body>
	<div class="content">
		<div class="headmenu">
			<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		</div><br/><br/><br/>
		
		<div class="mainboard">
			<div class="boardlisttitle">
				<p>◎  My Board</p>
			</div>
			<div>
			<% List<Board> boards = (List<Board>)request.getAttribute("boards");%>
				<ul>
			<%for(Board board : boards){ %>	
				<li class="boardicon"><div class="board" id="<%= board.getNo() %>"><p><%=board.getName() %><p></div></li>	
			<%} %>
				<li class="boardicon"><div class="createBoard"><p class="createBoardName">New Board.....</p></div></li>
				</ul>
			</div>			
		</div>
	</div>
	<div class="clickclosedboard">
		<br/><br/>
		<p class="clickclosedlist" >◎ Closed Board List</p>
		<br/><br/>
		<div class="getclosedboardlist">
		</div>
	</div>
<div id="dialog-form" title="Create New Board">
  <form>
	  <br/>
      <label for="name" style="text-align: center">Create Board Title...</label><br/>
      <br/><br/>
      <input type="text" name="title" id="title">
     
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">

  </form>
</div>

</body>
</html>
