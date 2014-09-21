<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:url var="deleteTeamUrl" value="/team/delete=${team.teamId}" />

<form:form method="delete" action="${deletePlayerUrl}" commandName="contact" role="form">
	
	<input type="hidden" name="_method" value="DELETE" />

	
			<button type="button" class="btn btn-danger btn-large btn-block" data-toggle="modal" data-target="#modal">Usuń</button>
	

</form:form>

<c:import url="/WEB-INF/views/team/partials/partials/modal.jsp">
	<c:param name="modalTitle" value="UsunÄÄ DruÅ¼ynÄ?" />
	<c:param name="modalBody" value="UCzy jesteÅÂ pewien Å¼eby usunÄÄ druÅ¼ynÄ?Â ${team.name} z listy?" />
	<c:param name="deletePlayerUrl" value="/team/delete=${team.teamId}" />
	
</c:import>

