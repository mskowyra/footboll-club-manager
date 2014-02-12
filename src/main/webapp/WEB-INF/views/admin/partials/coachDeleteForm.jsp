<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:url var="deleteCoachUrl" value="/admin/delete=${coach.coachId}" />

<form:form method="delete" action="${deleteCoachUrl}" commandName="coach" class="form-horizontal" role="form">
	
	<input type="hidden" name="_method" value="DELETE" />

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary btn-large" data-toggle="modal" data-target="#modal">Usuń</button>
		</div>
	</div>

</form:form>

<c:import url="/WEB-INF/views/admin/partials/partials/modal.jsp">
	<c:param name="modalTitle" value="Usunąć Trenera?" />
	<c:param name="modalBody" value="Czy jesteś pewien żeby usunąć trenera ${coach.firstname} ${coach.lastname} z listy?" />
	<c:param name="deleteCoachUrl" value="/admin/delete=${coach.coachId}" />
</c:import>

