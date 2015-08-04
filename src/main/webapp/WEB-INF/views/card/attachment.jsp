<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="u-clearfix attachment-list">
<%-- <h1>${attchments[0].regDate }</h1> --%>
	<c:choose>
		<c:when test="${ empty attachments }">
			<br/><br/>
			<span class="attachment-details-title">NO ATTACHMENT :(</span>
		</c:when>
		<c:otherwise>
			<c:forEach var="attlist" items="${attachments }">
				<%-- <h1>${attlist.userFileName }</h1> --%>
				<div class="attachment-thumnail-slide" style="float:left;align:center">
					<!-- <a class="attachment-preview2"> -->
						<span class="attachment-icon">
							${attlist.fileType }
						</span>
					<!-- </a> -->
					<br/>
						<span style="overflow:hidden">${attlist.fileName }</span>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>


<%-- 
		<div class="attachment-thumnail">
			<a class="attachment-preview">
				<span class="attachment-preview-src">file type</span>
			</a>
			<p class="attachment-details">
				<a class="attachment-details-title">${list.userFileName }
					<span class="attachment-date">${attlist.regDate}</span>
				</a>
				<span class="attachment-options">
					<a>Download</a>&nbsp;&nbsp;<a>Delete</a>
				</span>
			</p>
		</div> --%>