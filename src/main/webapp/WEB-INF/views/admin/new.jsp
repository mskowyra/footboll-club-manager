<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/team" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>PANEL DAMINISTARCYJNY</h1>
	<footer>DODAJ NOWEGO TRENERA</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

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


	<c:import url="/WEB-INF/views/admin/partials/coachForm.jsp">
		<c:param name="coach" value="${coach}" />
	</c:import> 
</div>