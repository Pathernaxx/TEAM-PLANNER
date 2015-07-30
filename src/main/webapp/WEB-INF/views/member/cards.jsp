<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="cards">
	<div class="js-activity">
		<h2>Card</h2>
	</div>
	<div>
		<c:if test="${ cards != null }">
			<c:forEach var="card" items="${ cards }">
				<div></div>
			</c:forEach>
		</c:if>
	</div>
</div>