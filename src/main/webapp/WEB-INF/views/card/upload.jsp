<script>
	$(function() {
		$(".submit").click(function() {
			var formData = $('#uploadForm').serialize();
			//new FormData();
			//formData.append("file", $("input[name=file]")[0].files[0]);
			
			$.ajax({
				url: "/finalProject/card/insertAttachment.action",
				method: "post",
				data: formData,
				processData: false,
				contentType: false,
				success: function() {
					alert("success");
				},
				error: function() {
					alert("error");
				}
			});
		});
	});
</script>

<div class='attachmentForm'>
	<form action="insertAttachment.action" id="uploadForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cardno" id="cardno" value=${cardno } />
		<input type="hidden" name="boardno" id="boardno" value=${boardno } />
		<input class="window-uploadbutton" type='file' class="" name='file' style="border:none;"/>
		<br/>
		&nbsp;&nbsp;
		<input class="window-uploadbutton" type='submit' name="submit" value='Upload' />
	</form>
</div>