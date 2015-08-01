<script>
	 $(function() {
		/* $(".submit").click(function() {
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
		}); */
		

		$("form#uploadForm").submit(function() {
			var formData = new FormData($(this)[0]);
			$.ajax({
				url: "/finalProject/card/insertAttachment.action",
				type: "post",
				data: formData,
				async: false,
				success: function() {
					alert("success");
				},
				error: function() {
					alert("error");
				},
				cache: false,
				contentType: false,
				processData: false
			});
			
			return false;
		});
		
	});
	
	
</script>

<div class='attachmentForm'>
	<form id="uploadForm" method="post" enctype="multipart/form-data"> <!-- action="insertAttachment.action"  -->
		<input type="hidden" name="cardno" id="cardno" value=${cardno } />
		<input type="hidden" name="boardno" id="boardno" value=${boardno } />
		<input class="window-uploadbutton" type='file' class="" id="file" name='file' style="border:none;"/>
		<br/>
		&nbsp;&nbsp;
		<input class="window-uploadbutton" type='submit' name="submit" value='Upload' />
	</form>
</div>