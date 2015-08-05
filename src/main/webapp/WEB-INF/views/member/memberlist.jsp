<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<link rel="Stylesheet" href="/finalProject/resources/styles/core2.css" />


<script type="text/javascript">

</script>
</head>
<body>


	<div class="js-activity">
		<h2>Member List</h2>
		
		<c:forEach var="member" items="${ members }">
			<div style="margin: 18px; padding-top: 3px">
				<div class="creator member js-show-mem-menu">
					<span> <img class="pic2"
						src="/finalProject/resources/images/user.png">
					</span>
				</div>
				${ member.userName } <a style="color: red;">/</a> ${ member.email }
			</div>
		</c:forEach>
	</div>

	<div>
		<c:if test="${ activity }">
			<c:forEach var="action" items="${ activity }">
				<div></div>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>