<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="formMethod" value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction" value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel" value="${empty param.formButtonLabel ? 'Save' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}" commandName="team" class="form-horizontal" role="form">
	<div class="form-group" >
		<form:label path="name" cssClass="col-sm-2 control-label">Nazwa Drużyny</form:label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" />
			<form:errors path="name" cssClass="control-label" />
		</div>
	</div>
	<div class="form-group">
		<form:label path="coach" cssClass="col-sm-2 control-label">Trener</form:label>
		<div class="col-sm-10">
			<form:select path="coach.coachId" cssClass="form-control"	required="True" >
				<form:option value="">Wybierz trenera którego chcesz przypisać do drużyny...</form:option>
				<c:forEach items="${coachs}" var="coach">
					<form:option value="${coach.coachId}">${coach.firstname} ${coach.lastname}</form:option>
				</c:forEach>
			</form:select>
			<form:errors path="coach" cssClass="alert alert-warning" />
		</div>
	</div>
 <%--  
	<div class="form-group">
		<form:label path="team.name" cssClass="col-sm-2 control-label">Team</form:label>
		<div class="col-sm-10">
			<form:input path="team.name" cssClass="form-control" />
			<form:errors path="team.name" cssClass="control-label" />
		</div>
	</div>
	 --%>
	<%-- 
	<div class="form-group<test:validClass field="email" cssClass=" has-error" errors="${errors}" />">
		<form:label path="email" cssClass="col-sm-2 control-label">Email</form:label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email" cssClass="control-label" />
		</div>
	</div>
--%> 
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btn-large"><c:out value="${formButtonLabel}" /></button>
		</div>
	</div>

</form:form>
