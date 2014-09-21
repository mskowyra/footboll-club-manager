<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:url var="deleteTeamUrl" value="/team/delete=${team.teamId}" />

<form:form method="delete" action="${deletePlayerUrl}" commandName="contact" class="form-horizontal" role="form">
	
	<input type="hidden" name="_method" value="DELETE" />

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary btn-large" data-toggle="modal" data-target="#modal">Usuń</button>
		</div>
	</div>

</form:form>

<c:import url="/WEB-INF/views/team/partials/partials/modal.jsp">
	<c:param name="modalTitle" value="Usunąć Drużynę?" />
	<c:param name="modalBody" value="UCzy jesteś pewien żeby usunąć drużynę? ${team.name} z listy?" />
	<c:param name="deletePlayerUrl" value="/team/delete=${team.teamId}" />
	
</c:import>

