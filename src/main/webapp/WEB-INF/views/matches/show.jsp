<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/match" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE MECZAMI</h1>
	<footer>MECZY Z PRZECIWNIKIEM&nbsp;${matches.opponent}</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Przeciwnik</dt><dd><c:out value="${matches.opponent}" /></dd>
		<dt>Data meczu</dt><dd><c:out value="${matches.dateMatches}" /></dd>
		<dt>Rodzaj spotkania</dt><dd><c:out value="${matches.typeMatches}" /></dd>
	</dl>
</div>

<c:url value="/match/edit=${matches.matchesId}" var="editMatchesUrl" />
<a href="${editMatchesUrl}" class="btn btn-primary btn-large">edycja</a>

<c:import url="/WEB-INF/views/matches/partials/matchesDeleteForm.jsp">
	<c:param name="matches" value="${matches}" />
</c:import>

<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




