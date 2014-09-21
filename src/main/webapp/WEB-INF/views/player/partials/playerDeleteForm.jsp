<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:url var="deletePlayerUrl" value="/player/delete=${player.id}" />

<form:form method="delete" action="${deletePlayerUrl}" commandName="contact" class="form-horizontal" role="form">
	
	<input type="hidden" name="_method" value="DELETE" />


			<button type="button" class="btn btn-danger btn-large btn-block" data-toggle="modal" data-target="#modal">Usuń</button>
	

</form:form>

<c:import url="/WEB-INF/views/player/partials/partials/modal.jsp">
	<c:param name="modalTitle" value="Usuwanie Zawodnika?" />
	<c:param name="modalBody" value="Czy jestes pewien zeby usunac ${player.firstname} ${player.lastname} z listy pilkarzy?" />
	<c:param name="deletePlayerUrl" value="/player/delete=${player.id}" />
	
</c:import>

