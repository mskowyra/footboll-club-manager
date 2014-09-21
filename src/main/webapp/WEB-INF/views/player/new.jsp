<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/player" var="indexUrl" />

<div class="page-header background">
	<blockquote>
	<h1>ZARZĄDZANIE ZAWODNIKAMI</h1>
	<footer>DODAJ NOWEGO ZAWODNIKA</footer>
</blockquote>
</div>

<div class="background2">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>

<div class="flowline-med">
	<c:if test="${!empty error}">
		<div class="alert alert-danger"><strong>Uh oh!</strong> ${error}</div>
	</c:if>
<%--	
	<form:form method="post" action="/" commandName="contact" class="form-horizontal" role="form">
	<div class="form-group">
		<form:label path="firstname" cssClass="col-sm-2 control-label">Firstname</form:label>
		<div class="col-sm-10">
			<form:input path="firstname" cssClass="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-2 control-label">Lastname</form:label>
		<div class="col-sm-10">
			<form:input path="lastname" cssClass="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<form:label path="phone" cssClass="col-sm-2 control-label">Phone</form:label>
		<div class="col-sm-10">
			<form:input path="phone" cssClass="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<form:label path="email" cssClass="col-sm-2 control-label">Email</form:label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btn-large">Save</button>
		</div>
	</div>

</form:form>--%>


	<c:import url="/WEB-INF/views/player/partials/playerForm.jsp">
		<c:param name="player" value="${player}" />
	
		<c:param name="teams" value="${teams}" />
	
	</c:import> 
</div>
</div>