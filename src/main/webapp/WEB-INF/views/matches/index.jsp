<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/match/new" var="newMatchesUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE MECZAMI</h1>
	<footer>LISTA MECZY</footer>
</blockquote>
</div>

<a href="${newMatchesUrl}">Utwórz nowe spotkanie&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>

<div class="flowline-med">
	<c:choose>
		<c:when test="${!empty matches}">
			<c:import url="/WEB-INF/views/matches/partials/matchesList.jsp">
			<c:param name="matches" value="${matches}" />
			</c:import>
		</c:when>
		<c:otherwise>
			<p class="lead ">Brak meczy!</p>
		</c:otherwise>
	</c:choose>
</div>
