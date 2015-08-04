<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
//$('.window-header').on('click', "#filedelete", function() {
$("#filedelete").click(function() {
	//$(this).parent("#atttr").slideUp('fast', function(){$(this).remove();});
	//alert($(this).parents(".attachment-options").find('input').val());
	var tempthis = $(this);
	$.ajax({
		url: '/finalProject/card/deleteAttachment.action',
		type: 'GET',
		data: {
			fileno : $(this).parents(".attachment-options").find('input').val()//$(this).parent(".attachment-options").children()[0].value
		},
		success: function(message) {
			if(message == "success") {
				tempthis.parents(".atttr").remove();
				alert("삭제완료")
			} else {
				alert("삭제실패")
			}
		}
	});
});
</script>

<div id="last-attachment" class='atttr card-elements' > 
<span class='icon-space'></span> 
<span class='content-space u-clearfix'> 
		<div class='attachment-thumnail'> 
			<a class='attachment-preview'> 
				<span class='attachment-preview-src'>${type }</span> 
			</a> 
			<p class='attachment-details'> 
				<a class='attachment-details-title'>${name }<br/> 
					<span class='attachment-date' style='font-size: x-small;'>${date }</span> 
				</a> 
				<span class='attachment-options' style='font-size: small;'> 
					<input type='hidden' value='${no }' /> 
					<a id='filedownload' href="/finalProject/card/filedownload.action?fileno=${no }" style='text-decoration: underline'> 
						Download</a> 
					&nbsp;&nbsp; 
					<a id='filedelete' style='text-decoration: underline'>Delete</a> 
				</span> 
			</p> 
		</div> 
	</span> 
</div>