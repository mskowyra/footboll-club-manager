<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/team/new" var="newTeamUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE DRUŻYNĄ</h1>
	<footer>LISTA DRUŻYN</footer>
</blockquote>
</div>

<a href="${newTeamUrl}">Utwórz nową drużynę&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>

<div class="flowline-med">
	<c:choose>
		<c:when test="${!empty teams}">
			<c:import url="/WEB-INF/views/team/partials/teamList.jsp">
			<%-- <c:param name="players" value="${teams}" />--%>
			<c:param name="teams" value="${teams}" />
			</c:import>
		</c:when>
		<c:otherwise>
			<p class="lead ">Brak dodanych drużyn!</p>
		</c:otherwise>
	</c:choose>
</div>
