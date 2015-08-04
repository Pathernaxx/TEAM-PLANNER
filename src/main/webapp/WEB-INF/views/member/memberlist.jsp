<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="text/plain; charset=utf-8">
<div class="js-activity">
	<h2>Member List</h2>
	<c:forEach var="member" items="${ members }" >
		<div style="margin: 0.1px"> ${ member.userName } / ${ member.email } </div>
	
	</c:forEach>
</div>


<div>
	<c:if test="${ activity }">
		<c:forEach var="action" items="${ activity }">
			<div></div>
		</c:forEach>
	</c:if>
</div>