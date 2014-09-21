<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/team" var="indexUrl" />

<div class="page-header background">
	<blockquote>
	<h1>PANEL AMINISTARCYJNY</h1>
	<footer>DODAJ NOWEGO UŻYTKOWNIKA</footer>
</blockquote>
</div>
<div class="background">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>

<div class="flowline-med">
	<c:if test="${!empty error}">
		<div class="alert alert-danger"><strong>Uh oh!</strong> ${error}</div>
	</c:if>


	<c:import url="/WEB-INF/views/admin/partials/coachForm.jsp">
		<c:param name="coach" value="${coach}" />
	</c:import> 
</div>
</div>