<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
//$("#archived-item").click(function() {
$("#panel-4").on("click", ".archived-item", function() {
	//alert("aa");
	//alert($(this).children()[0].value);//(".item-clicked").find
	
	var cardno = $(this).children()[0].value;
	//var id= $(this).attr("id");
	//alert(cardno);
	$.ajax({
		url: '/finalProject/card/returnCard.action',
		type: 'GET',
		data: {cardno: cardno},
		success: function() {
		},
		error: function() { 
			alert("error");
		}
	});
	
	$(this).remove();
	//$(this).hide();
	
});
</script>

<div class="archived-slide">
	<c:choose>
		<c:when test="${ empty archivedCards }">
			<br/><br/>
			<span class="attachment-details-title">NO ARCHIVED CARD :(</span>
		</c:when>
		<c:otherwise>
		<!-- <span class="item-clicked"> -->
			<c:forEach var="archivedlist" items="${archivedCards }">
				<a class="archived-item" id="${archivedlist.no}" style="cursor: pointer;">
				<input type="hidden" value="${archivedlist.no}" />
					<font style="color:black;text-shadow: aqua;font-weight: bold;font-size: large;">${archivedlist.name }</font><br/>
					<font style="font-size: small;" >${redate }</font>
				<br/></a><br/><br/>
			</c:forEach>
		<!-- </span> -->
		</c:otherwise>
	</c:choose>
</div>