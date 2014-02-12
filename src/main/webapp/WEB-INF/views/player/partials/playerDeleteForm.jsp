<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:url var="deletePlayerUrl" value="/player/delete=${player.id}" />

<form:form method="delete" action="${deletePlayerUrl}" commandName="contact" class="form-horizontal" role="form">
	
	<input type="hidden" name="_method" value="DELETE" />

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary btn-large" data-toggle="modal" data-target="#modal">Delete</button>
		</div>
	</div>

</form:form>

<c:import url="/WEB-INF/views/player/partials/partials/modal.jsp">
	<c:param name="modalTitle" value="Usunąć Zawodnika?" />
	<c:param name="modalBody" value="Czy jesteś pewien żeby usunąć ${player.firstname} ${player.lastname} z listy piłkarzy?" />
	<c:param name="deletePlayerUrl" value="/player/delete=${player.id}" />
	
</c:import>

