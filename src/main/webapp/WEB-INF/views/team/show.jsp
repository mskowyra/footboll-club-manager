<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/team" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE DRUŻYNĄ</h1>
	<footer>DRUŻYNA ${team.name}</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Nazwa drużyny</dt><dd><c:out value="${team.name}" /></dd>
		<dt>Trener</dt><dd><c:out value="${team.coach.firstname} ${team.coach.lastname}" /></dd>
		
	</dl>
</div>

<c:url value="/team/edit=${team.teamId}" var="editTeamUrl" />
<a href="${editTeamUrl}" class="btn btn-primary btn-large">edycja</a>

<c:import url="/WEB-INF/views/team/partials/teamDeleteForm.jsp">
	<c:param name="team" value="${team}" />
</c:import>

<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




