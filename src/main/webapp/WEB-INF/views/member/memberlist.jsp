<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="js-activity">
	<h2>Member List</h2>
</div>
<div>
	<c:if test="${ activity }">
		<c:forEach var="action" items="${ activity }">
			<div></div>
		</c:forEach>
	</c:if>
</div>