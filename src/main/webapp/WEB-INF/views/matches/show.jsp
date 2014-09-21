<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/team" var="indexUrl" />

<div class="page-header background">
	<blockquote>
	<h1>ZARZĄDZANIE DRUŻYNĄ</h1>
	<footer>DRUŻYNA ${team.name}</footer>
</blockquote>
</div>

<div class="background2">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>
<div class="form-group" >
<div class="col-sm-4"></div>
<div class="col-sm-9 col-md-offset-3">
<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Nazwa drużyny przeciwnej</dt><dd><c:out value="${matches.opponent}" /></dd>
		<dt>Data meczu</dt><dd><c:out value="${matches.dateMatches}" /></dd>
		<dt>Rodzaj meczu</dt><dd><c:out value="${matches.typeMatches}" /></dd>
	</dl>
</div>
</div>
</div>

	
	
  <div class="btn-group btn-group-justified">
  <div class="col-sm-offset-3 col-sm-2">
		<c:url value="/matches/edit=${matches.matchesId}" var="editTeamUrl" />
		<a href="${editTeamUrl}" type="button" class="btn btn-primary btn-large btn-block">Edycja</a>
</div>

<div class="col-sm-2">	
	<c:import url="/WEB-INF/views/team/partials/teamDeleteForm.jsp">
		<c:param name="team" value="${team} "  />
	</c:import>
</div>
	</div>
</div>	
	
<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




