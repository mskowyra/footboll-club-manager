<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="formMethod" value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction" value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel" value="${empty param.formButtonLabel ? 'Save' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}" commandName="coach" class="form-horizontal" role="form">
  
	<div class="form-group">
		<form:label path="firstname" cssClass="col-sm-2 control-label">Imię</form:label>
		<div class="col-sm-10">
			<form:input path="firstname" cssClass="form-control" />
			<form:errors path="firstname" cssClass="control-label" />
		</div>
	</div>

	<div class="form-group" >
		<form:label path="lastname" cssClass="col-sm-2 control-label">Nazwisko</form:label>
		<div class="col-sm-10">
			<form:input path="lastname" cssClass="form-control" />
			<form:errors path="lastname" cssClass="control-label" />
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
