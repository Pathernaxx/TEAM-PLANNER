<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
.ui-autocomplete{z-index: 10001!important;opacity:0.7;position: absolute;}
.memberAddButton{width:100px;}
.member-avatar{
	text-decoration:none; 
	color:#6b0741;
}
.choicefriend{
	cursor: pointer;
}
.appendtag{
	text-decoration: none;
}
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
					success: function(member){
						if(member==null){
							alert("데이터가 전송되지않았습니다.")
						}else{
							$("#tagcontent").val("");
							$('.appendtag').append("<img class='member-avatar' src='/finalProject/resources/images/user.png' width='40px' height='40px' title="+member.userName+">");
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
		      width: 240,
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
		///////////////////////////////////////////////////////////////////////
		
		var target2 = $("#addMemberbtn")
		
		var dialog2 = $( "#dialog-form2" ).dialog({
		      autoOpen: false,
		      height: 200,
		      width: 250,
		      position: { my: 'right', at: 'left' ,of : target2},
		      buttons:{
		    	  Cancel: function(){
		    		  dialog2.dialog("close");
		    		  $("#addFriendbtn").css("display","block");
		    	  }
		      }
		});
		
		var target3 = $( "#dialog-form2" );
		var dialog3 = $( "#dialog-form3" ).dialog({
		      autoOpen: false,
		      height: 150,
		      width: 250,
		      position: { my: 'right', at: 'left' ,of : target3},
		      buttons:{
		    	  ADD : function(){
		    		  var friendNo = $(this).data("friendNo");
		    		  $.ajax({
		    				url:'/finalProject/board/addTagFriend.action',
		    				type: 'get',
		    				data: {
		    					friendNo : friendNo,
		    					boardNo : boardno
		    				},
		    				success : function(member){
		    					$('.appendtag').append("<img class='member-avatar' src='/finalProject/resources/images/user.png' width='40px' height='40px' title="+member.userName+">");
		    					dialog2.dialog("close");
		    					dialog3.dialog("close");
								$("#addMemberbtn").css("display","block");
		    				}
		    			});
		    		  
		    	  },
		    	  Cancel: function(){
		    		  dialog3.dialog("close");
		    	  }
		      }
		});
		
		///////////////////////////////////////////////////////
		
		$('#addFriendbtn').click(function(){
			
			$.ajax({
				url:'/finalProject/board/selectTagFriend.action',
				type: 'get',
				data: {
					boardNo : boardno
				},
				success : function(members){
					
					var html = "<ul style='padding-left: 5%;list-style: none;height:100%;'>"
					var div = $(".friendIcon");
					for(var key in members){
						html+="<li class='friendlist'>●&nbsp;&nbsp;<a class='choicefriend' id="+members[key].no+">"+members[key].userName+"</a></li>";
					}
					html +="</ul>";
					if(members.length>0){
						
						div.html(html);
						$("#addFriendbtn").css("display","none");
						dialog2.dialog("open");
					}else{
						div.html("친구가 없습니다.");
					}	
				},
				error:function(){
					alert("데이터가 전송되지않음");
				}
			});
		});
		$('body').on('click', ".choicefriend", function(){
			var friendNo = $(this).attr('id');
			dialog3.dialog('open').data('friendNo',friendNo);
		});
		
		$("#closebutton").click(function(){
			var url = '/finalProject/board/closedBoard.action?boardNo='+boardno;
			$(location).attr('href', url);
		});
		
		$("#exitbutton").click(function(){
			var url2 = '/finalProject/board/exitBoard.action?boardNo='+boardno;
			$(location).attr('href', url2);
		});
		
		
		
		
		
		
	});
</script>

<hr/>
<div class="teamList-header">
	<div class="teamIcon">
		<c:forEach var="member" items="${members}">
			<img class="member-avatar" src="/finalProject/resources/images/user.png" width="40px" height="40px" title="${member.userName }"><a style="text-decoration: none;">&nbsp;&nbsp;</a>
		</c:forEach>
		<a class="appendtag"></a>
	</div>
</div>

<hr/>
<div style="width:100px">
	<div class="teamList-addMember" style="width:100px">
			<div id="addMemberbtn" class="memberAddButton" style="width:100px!important">Tag Members...    </div><br/>
	</div>
	<div class="teamList-addMember" style="width:100px">
			<div id="addFriendbtn" class="memberAddButton" style="width:100px!important">Tag Friends...    </div><br/>
	</div>
</div>

<c:if test="${userType == 0}">
	<div class="teamList-addMember close" >
			<div id="closebutton" class="memberAddButton close">CLOSE</div><br/>
	</div>
</c:if>
<c:if test="${userType == 1}">
	<div class="teamList-addMember close" >
			<div id="exitbutton" class="memberAddButton exit">EXIT</div><br/>
	</div>
</c:if>

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
      <label for="name" style="text-align: center;font-weight: bold;">Search Friend...</label><br/>
      <div class="friendIcon">
      	
      </div> 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" style="position:absolute; top:-1000px">

  </form>
</div>
<div id="dialog-form3">
  <form>
	  <label for="name" style="text-align: center;font-weight: bold;">Add Friend..?</label><br/>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" style="position:absolute; top:-1000px">

  </form>
</div>
