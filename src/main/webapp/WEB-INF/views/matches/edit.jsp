<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/match" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>ZARZĄDZANIE MECZAMI</h1>
	<footer>LISTA MECZY</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

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
<%-- 
	<form:form method="put" action="/${contact.id}" commandName="contact" class="form-horizontal" role="form">
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

	<c:import url="/WEB-INF/views/matches/partials/matchesForm.jsp">
		<c:param name="matches" value="$matches}" />
		<c:param name="formMethod" value="post" />
		<c:param name="formAction" value="/match/show=${matches.matchesId}" />
		<c:param name="formButtonLabel" value="Update" />
	
	</c:import>
</div>