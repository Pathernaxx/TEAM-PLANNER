<script>
	$()
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