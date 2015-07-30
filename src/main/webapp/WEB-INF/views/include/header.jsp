<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="Stylesheet" href="/finalProject/resources/styles/header.css" />
<link rel="Stylesheet" href="/finalProject/resources/styles/jquery-ui.min.css" />
<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		var list =[];
		var dialog;
		
		dialog = $( "#dialogform" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 350,
		      buttons:{
		    	  "Add" : function(){
		    		  var friendNo = $(this).data("friendNo");
		    		  $.ajax({
		    			 url : '/finalProject/board/addFriend.action', 
		    			 type : 'get',
		    			 data : {friendNo : friendNo},
		    			 success : function(){
		    				 $(".searchtext").val("");
		    				 dialog.dialog("close");
		    			 }
		    		  });
		    	  },
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
						height : 100,
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
									hidden : list.no,
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
					ui.item.dialog.dialog("open").data("friendNo",ui.item.hidden);
				}
			},
			minLength: 2
		});
		$(".mainpageimg").click(function(){
			var url = "/finalProject/board/boardmain.action"
				$(location).attr('href', url);
		});
		$(".mypage").click(function(){
			var url = "/finalProject/member/"
				$(location).attr('href', url);
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
	<div class="mainpage">
		<img class="mainpageimg" src="/finalProject/resources/images/mainpage.png">
	</div>
	<div class="alarm">
		♬
	</div>
 	<div class="mypage">
		My Page
	</div> 
	
	<div id="dialogform" title="Add Member...">
	  <form>
		  <br/>
	     <label for="name" style="text-align: center">Do you want to add this member?</label>
	 
	      <!-- Allow form submission with keyboard without duplicating the dialog button -->
	      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	
	  </form>
	</div>
	
</body>
</html>
