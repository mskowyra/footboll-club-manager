<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/match" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE MECZAMI</h1>
	<footer>DODAJ NOWY MECZ</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

<div class="flowline-med">
	<c:if test="${!empty error}">
		<div class="alert alert-danger"><strong>Uh oh!</strong> ${error}</div>
	</c:if>

	<c:import url="/WEB-INF/views/matches/partials/matchesForm.jsp">
	<c:param name="matches" value="${matches}" />
	<c:param name="player" value="${player}" />
	</c:import> 
</div>