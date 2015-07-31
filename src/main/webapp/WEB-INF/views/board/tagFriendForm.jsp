<script>
	$(document).ready(function(){
		$("#searchtag").autocomplete({
			
			source : function(request , response){
					
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
	});
</script>

<div class='tagMemberForm'>
	<form action="insertTagMember.action" id="tagMemberForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="cardno" value=${cardno } />
		<input type="hidden" id="boardno" value=${boardno } />
		<input type="hidden" id="listno" value=${listno } />
		<input type="text" id="searchtag" value="tag a member..." onfocus="this.value=''" style="width: 80%;" />
		<br/>
		&nbsp;&nbsp;
		<input class="window-uploadbutton" type='submit' value='ADD' onclick="document.forms[0].submit();" />
	</form>
</div>