<div class='attachmentForm'>
	<form action="insertAttachment.action" id="uploadForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="cardno" value=${cardno } />
		<input type="hidden" id="boardno" value=${boardno } />
		<input class="window-uploadbutton" type='file' class="" name='file' style="border:none;"/>
		<br/>
		&nbsp;&nbsp;
		<input class="window-uploadbutton" type='submit' value='Upload' onclick="document.forms[0].submit();" />
	</form>
</div>