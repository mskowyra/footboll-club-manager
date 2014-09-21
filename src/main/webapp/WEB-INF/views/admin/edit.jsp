<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/team" var="indexUrl" />

<div class="page-header background">
	<blockquote>
	<h1>PANEL ADMINISTARCYJNY</h1>
	<footer>EDYCJA TRENERA ${coach.firstname} ${coach.lastname}</footer>
</blockquote>
</div>
<div class="background">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>

<div class="flowline-med">
	<c:if test="${!empty errors}">
		<div class="alert alert-danger">
			<strong>Uh oh!</strong>
			<ul>
				<c:forEach items="${errors}" var="err">
					<li>${err.defaultMessage}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>


	<c:import url="/WEB-INF/views/admin/partials/coachForm.jsp">
		<c:param name="coach" value="$coach}" />
		<c:param name="formMethod" value="post" />
		<c:param name="formAction" value="/admin/show=${coach.coachId}" />
		<c:param name="formButtonLabel" value="Aktualizuj" />
	
	</c:import>
</div>
</div>