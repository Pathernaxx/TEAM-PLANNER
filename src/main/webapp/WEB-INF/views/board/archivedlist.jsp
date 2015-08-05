<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
//$("#test").click(function() {
$("#archived-slide").on("click", "#test", function() {
	alert("qqq")
	/* var cardno = $("#cardno").val();
	$.ajax({
		url: '/finalProject/card/returnCard.action',
		type: 'GET',
		data: {cardno: cardno},
		success: function() {
			alert("ok")
		},
		error: function() {
			alert("error");
		}
	}); */
});
</script>

<div id="archived-slide">
	<c:choose>
		<c:when test="${ empty archivedCards }">
			<br/><br/>
			<span class="attachment-details-title">NO ARCHIVED CARD :(</span>
		</c:when>
		<c:otherwise>
			<c:forEach var="archivedlist" items="${archivedCards }">
				<a id="test">
				<input type="hidden" id="cardno" value="${archivedlist.no}" />
				${archivedlist.name }
				</a><br/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>