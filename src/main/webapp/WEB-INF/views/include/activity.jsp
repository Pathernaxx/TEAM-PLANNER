<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div id="profile">
			<div class="js-activity">
				<h2>Activity</h2>
			</div>
				<div>
				<c:if test="${ prints != null }">
					<c:forEach var="action" items="${ prints }">
					<div style="margin: 18px">
						<div class="creator member js-show-mem-menu">
						<span>
				<img class="pic2" src="/finalProject/resources/images/user.png">
				</span></div>
						<span><span class="action-user">${ action.userName }</span></span>&nbsp;<a id="color">${ action.type }</a>
						<c:choose>
							<c:when test="${ action.frontLink != '#' }">
								<a href="${ action.frontLink }">${ action.frontText }</a>
							</c:when>
							<c:otherwise>
								<span>${ action.frontText }</span>
							</c:otherwise>
						</c:choose>
						<c:if test="${ action.backLink != null || action.backText != null}">
							<c:choose>
								<c:when test="${ action.backLink != '#' && action.backLink != null}">
									<a href="${ action.backLink }">${ action.backText }</a>
								</c:when>
								<c:otherwise>
								
									<span>${ action.backText }</span>
								</c:otherwise>
							</c:choose>
						</c:if>
						</div>
						
					</c:forEach>
					
				</c:if>
				</div>
		</div>