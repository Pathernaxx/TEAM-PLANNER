<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/default.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/main.css" />
<!-- <link rel="Stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" /> -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/finalProject/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>


<script>
	$(document).ready(function(){
		var dialog;
		function addBoard(event){
			var title = $("#title").val();
			var check = /^[\s]+$/;
			var checkTitle = check.test(title);
			
			if(checkTitle==false && title != ""){
				$.ajax({
					url:'/finalProject/board/insert.action',
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
		      height: 300,
		      width: 350,
		      buttons:{
		    	  "CREATE" : addBoard,
		    	  Cancel: function(){
		    		  $("#title").val("");
		    		  dialog.dialog("close");
		    	  }
		      }
		      
		    });
		$('.createBoard').click(function(){
			dialog.dialog("open");
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
				<ul>
				<li><div class="board"><p>Board name<p></div></li>	
				<li><div class="createBoard"><p class="createBoardName">New Board.....</p></div></li>
				</ul>
			</div>			
		</div>
	</div>
	<div class="clickclosedboard">
		<a href="#">Closed List</a>
	</div>
<div id="dialog-form">
  <form>

      <label for="name" style="text-align: center">Title</label><br/>
      <input type="text" name="title" id="title">
     
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">

  </form>
</div>
</body>
</html>