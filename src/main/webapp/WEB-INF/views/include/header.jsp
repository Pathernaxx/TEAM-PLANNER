<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/jquery-ui-1.11.4.custom/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/finalProject/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		var list =[];
		var dialog;
		
		
		
		dialog = $( "#dialogform" ).dialog({
		      autoOpen: false,
		      height: 300,
		      width: 350,
		      buttons:{
		    	  "CREATE" : {},
		    	  Cancel: function(){
		    		  $("#title").val("");
		    		  $(".searchtext").val("");
		    		  dialog.dialog("close");
		    		  
		    	  }
		      }
		});
		$(".searchtext").autocomplete({
			
			source : function(request , response){
				var value = $(".searchtext").val();
				if(value.length < 2){
					
				} else if(value[0] == '#'){
					$.ajax({
						url : '/finalProject/board/searchboard.action',
						type : 'get',
						dataType : "json",
						data : {
							key : request.term
						},
						success : function(searchs){
							response($.map(searchs, function(list) {
								return {
									label : list.name,
									value : list.name,
									url : '/finalProject/board/boardview.action?boardno='+list.no
								}
							}));
							
						}
					});
					
				}else if(value[0] == '@'){
					
					$.ajax({
						url : '/finalProject/board/searchmember.action',
						type : 'get',
						dataType : "json",
						data : {
							key : request.term
						},
						success : function(searchs){
							response($.map(searchs, function(list) {
								return {
									label : list.userName,
									value : list.userName,
									dialog : dialog
								}
							}));
						}
					});
				}
			},
			select : function(event,ui){
				if(ui.item.url != null){
					window.location = ui.item.url;
				}else{
					ui.item.dialog.dialog("open")
				}
			},
			minLength: 2
		});
	});
</script>
</head>
<body>

	<div class="searchName">
		SEARCH
	</div>
	<div class="search">
		<input class="searchtext" type="text"/>
	</div>
	<div class="searchbutton">
		☜
	</div>
	<div class="mainpage">
		<img class="mainpageimg" src="/finalProject/resources/images/mainpage.png">
	</div>
	<div class="alarm">
		♬
	</div>
 	<div class="mypage">
		MyPage
	</div> 
	
	<div id="dialogform" title="Create New Board">
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