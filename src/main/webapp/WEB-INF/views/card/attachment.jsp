<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$("#panel-3").on("click", ".attachment-icon", function() {
	//alert($(this).children()[0].value)
	var fileno = $(this).children()[0].value;
	$.ajax({
		url: '/finalProject/card/filedownload.action',
		type: 'GET',
		data: {fileno: $(this).children()[0].value},
		success: function() {
		},
		error: function() { 
			alert("error");
		}
	});
});
</script>

<div class="u-clearfix attachment-list">
	<c:choose>
		<c:when test="${ empty attachments }">
			<br/><br/>
			<span class="attachment-details-title">NO ATTACHMENT :(</span>
		</c:when>
		<c:otherwise>
			<c:forEach var="attlist" items="${attachments }">
				<div class="attachment-thumnail-slide" style="float:left;align:center">
						<a class="attachment-icon" id="${attlist.no }" 
							style="cursor: pointer;" href="/finalProject/card/filedownload.action?fileno=${attlist.no }" >
						<input type="hidden" value="${attlist.no }" />
							${attlist.fileType }
						</a>
					<br/>
						<span style="overflow:hidden">${attlist.fileName }</span>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
