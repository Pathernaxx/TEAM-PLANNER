<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<style>
.ui-autocomplete{z-index: 10001!important;opacity:0.7;position: absolute;}
</style>
<script>


	$(document).ready(function(){
		var boardno = '${boardNo}';
		
		$("#tagcontent").autocomplete({
			
			source : function(request , response){
					
					$.ajax({
						url : '/finalProject/board/searchTagMember.action',
						type : 'get',
						dataType : "json",
						data : {
							key : request.term,
							boardno : boardno
						},
						success : function(members){
							response($.map(members, function(list) {
								return {
									label : list.userName,
									value : list.userName,
									hidden : list.no
								}
							}));
						},
					});
				
			},
			select : function(event,ui){
				$("#tagMemberNo").val(ui.item.hidden);		
			},
			minLength: 2
		});
		
		function addMember(event){
			var tagMemberNo = $("#tagMemberNo").val();
				$.ajax({
					url:'/finalProject/board/addTagMember.action',
					type: 'get',
					data: {
						boardNo : boardno,
						tagMemberNo : tagMemberNo
					},
					success: function(members){
						if(members==null){
							alert("데이터가 전송되지않았습니다.")
						}else{
							$("#tagcontent").val("");
							$('.teamIcon').append("123");
							 $("#addMemberbtn").css("display","block");
							 
							dialog.dialog("close");
						}		
					},
					error:function(){
						$("#title").val("");
						alert("데이터가 전송되지않음");
					}					
				});
			
			event.preventDefault();
		}
		var target = $("#addMemberbtn")
		
		var dialog = $( "#dialog-form" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 250,
		      position: { my: 'right', at: 'left' ,of : target},
		      buttons:{
		    	  "ADD" : addMember,
		    	  Cancel: function(){
		    		  $("#tagcontent").val("");
		    		  dialog.dialog("close");
		    		  $("#addMemberbtn").css("display","block");
		    	  }
		      }
		});
		$('#addMemberbtn').click(function(){
			dialog.dialog("open");
			$("#addMemberbtn").css("display","none");
		});
		
		///////////////////////////////////////////////////////
		function addFriend(event){
			$('#addFriendbtn').click(function(){
				$("#addFriendbtn").css("display","none");
				$.ajax({
					url:'/finalProject/board/selectTagFriend.action',
					type: 'get',
					data: {
						boardNo : boardno
					},
					success: function(members){
						if(members==null){
							alert("데이터가 전송되지않았습니다.")
						}else{
							
							dialog2.dialog("open");
						}		
					},
					error:function(){
						$("#title").val("");
						alert("데이터가 전송되지않음");
					}					
				});
			});
				
			
			event.preventDefault();
		}
		var target = $("#addFriendbtn")
		
		var dialog2 = $( "#dialog-form2" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 250,
		      position: { my: 'right', at: 'left' ,of : target},
		      buttons:{
		    	  "ADD" : addFriend,
		    	  Cancel: function(){
		    		  dialog.dialog("close");
		    		  $("#addFriendbtn").css("display","block");
		    	  }
		      }
		});
		
		
		
		
		
	});
</script>

<hr/>
<div class="teamList-header">
	<div class="teamIcon">		
		<img class="member-avatar" src="/finalProject/resources/images/aaa.jpg" width="40px" height="40px">
		<img class="member-avatar" src="/finalProject/resources/images/user.png" width="40px" height="40px">
		<img class="member-avatar" src="/finalProject/resources/images/user.png" width="40px" height="40px">
	</div>
	
</div>
<hr/>
<div>
	<div class="teamList-addMember">
			<div id="addMemberbtn" class="memberAddButton">Tag Members...    </div><br/>
	</div>
	<div class="teamList-addMember">
			<div id="addFriendbtn" class="memberAddButton">Tag Friends...    </div><br/>
	</div>
</div>

<div class="teamList-addMember close" >
		<div class="memberAddButton close">CLOSE</div><br/>
</div>

<input type="hidden" id="tagMemberNo" value=""/>
<div id="dialog-form">
  <form>
	  <br/>
      <label for="name" style="text-align: center;font-weight: bold;">Search Member...</label><br/>
      <br/><br/>
      <input type="text" name="content" id="tagcontent">
     
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" style="position:absolute; top:-1000px">

  </form>
</div>

<div id="dialog-form2">
  <form>
	  <br/>
      <label for="name" style="text-align: center;font-weight: bold;">Search Member...</label><br/>
      <br/><br/>
      <div class="friendIcon">
      	
      </div> 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" style="position:absolute; top:-1000px">

  </form>
</div>
