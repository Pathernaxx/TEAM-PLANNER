<script>
	$(document).ready(function(){
		var boardno = '${boardno}';
		$("#searchtag").autocomplete({
			
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
						}
					});
				
			},
			/* select : function(event,ui){
				if(ui.item.url != null){
					window.location = ui.item.url;
				}else{
					ui.item.dialog.dialog("open").data("friendNo",ui.item.hidden);
				}
			}, */
			minLength: 2
		});
		
	});
</script>

<div class='tagMemberForm'>
	<form action="insertTagMember.action" id="tagMemberForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="boardno" value=${boardno } />
		<input type="hidden" id="tagmemberno" value="" />
		<input type="text" id="searchtag" value="tag a member..." onfocus="this.value=''" style="width: 80%;" />
		<br/>
		&nbsp;&nbsp;
		<input class="window-uploadbutton" type='submit' value='ADD' onclick="document.forms[0].submit();" />
	</form>
</div>