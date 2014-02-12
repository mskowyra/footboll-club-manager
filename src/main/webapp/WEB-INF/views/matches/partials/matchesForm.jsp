<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="formMethod" value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction" value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel" value="${empty param.formButtonLabel ? 'Save' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}" commandName="matches" class="form-horizontal" role="form">
	<div class="form-group" >
		<form:label path="opponent" cssClass="col-sm-2 control-label">Nazwa Drużyny przeciwnej</form:label>
		<div class="col-sm-10">
			<form:input path="opponent" cssClass="form-control" />
			<form:errors path="opponent" cssClass="control-label" />
		</div>
	</div>
	<div class="form-group">
		<form:label path="dateMatches" cssClass="col-sm-2 control-label">Data Meczu</form:label>
		<div class="col-sm-10">
			<form:input path="dateMatches" cssClass="form-control" placeholder="DD-MM-YYYY"/>
			</div>
			<form:errors path="dateMatches" cssClass="alert alert-warning" />
	</div>
 
	<div class="form-group">
		<form:label path="typeMatches" cssClass="col-sm-2 control-label">Rodzaj Meczu</form:label>
		<div class="col-sm-10">
			<form:input path="typeMatches" cssClass="form-control" />
			<form:errors path="typeMatches" cssClass="control-label" />
		</div>
	</div>
<%-- 	
	<div class="form-group">
		<form:label path="player" cssClass="col-sm-2 control-label">Drużyna</form:label>
		<div class="col-sm-10">
			<form:select path="player.id" cssClass="form-control"	required="True" >
				<form:option value="">Wybierz drużynę do której chcesz przypisać zawodnika...</form:option>
				<c:forEach items="${player}" var="player">
					<form:option value="${player.id}">${player.firstname}</form:option>
				</c:forEach>
			</form:select>
			<form:errors path="team.name" cssClass="alert alert-warning" />
		</div>
	</div>
	
	
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
