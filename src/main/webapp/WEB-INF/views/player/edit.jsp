<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/player" var="indexUrl" />

<div class="page-header background">
<blockquote>
	<h1>ZARZĄDZANIE ZAWODNIKAMI</h1>
	<footer>EDYCJA ZAWODNIKA ${player.firstname}&nbsp;${player.lastname}</footer>
</blockquote>
</div>
<div class="background2">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>

<div class="flowline-med">
	<c:if test="${!empty errors}">
		<div class="alert alert-danger">
			<strong>Uh oh!</strong>
			<ul>
				<c:forEach items="${errors}" var="err">
					<li>${err.defaultMessage}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:import url="/WEB-INF/views/player/partials/playerForm.jsp">
		<c:param name="team" value="${team}" />
		<c:param name="teams" value="${teams}" />
		<c:param name="player" value="${player}" />
		<c:param name="formMethod" value="post" />
		<c:param name="formAction" value="/player/show=${player.id}" />
		<c:param name="formButtonLabel" value="Aktualizuj" />
	</c:import>
</div>
</div>