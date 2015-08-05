<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="u-clearfix attachment-list">
	<c:choose>
		<c:when test="${ empty attachments }">
			<br/><br/>
			<span class="attachment-details-title">NO ATTACHMENT :(</span>
		</c:when>
		<c:otherwise>
			<c:forEach var="attlist" items="${attachments }">
				<div class="attachment-thumnail-slide" style="float:left;align:center">
						<span class="attachment-icon">
							${attlist.fileType }
						</span>
					<br/>
						<span style="overflow:hidden">${attlist.fileName }</span>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
