<script>
	$(document).ready(function(){
		var boardno = '${boardNo}';
		$.ajax({
			url: "/finalProject/board/tagAllMemberForm.action",
			type: "get",
			data: {
				"boardno" : boardno
			},
			success: function(result) { 
				$('#addMemberbtn').webuiPopover({
					constrains: 'horizontal',
					trigger: 'click',
					multi: false,
					placement: 'left',
					width: 300,
					closeable: true,
					arrow: false,
					title: 'Search Member for tag',
					content: result
				});
			},
			error: function() {
				alert("tag error");
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
			<div class="memberAddButton">Tag Friends...    </div><br/>
	</div>
</div>

<div class="teamList-addMember close" >
		<div class="memberAddButton close">CLOSE</div><br/>
</div>
