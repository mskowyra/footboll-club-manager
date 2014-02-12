<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="formMethod" value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction" value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel" value="${empty param.formButtonLabel ? 'Save' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}" commandName="playerMatches" class="form-horizontal" role="form">
 	<div class="form-group">
		<form:label path="matches" cssClass="col-sm-2 control-label">Mecz</form:label>
		<div class="col-sm-10">
			<form:select path="matches.matchesId" cssClass="form-control"	required="True" >
				<form:option value="">Wybierz trenera którego chcesz przypisać do drużyny...</form:option>
				<c:forEach items="${matches}" var="matches">
					<form:option value="${matches.matchesId}">${matches.opponent}</form:option>
				</c:forEach>
			</form:select>
		</div>
	</div>
	
	

	<div class="form-group">
		<form:label path="player" cssClass="col-sm-2 control-label">Zawodnik</form:label>
		<div class="col-sm-10">
			<form:select path="player.id" cssClass="form-control"	required="True" >
				<form:option value="">Wybierz trenera którego chcesz przypisać do drużyny...</form:option>
				<c:forEach items="${player}" var="player">
					<form:option value="${player.id}">${player.firstname}</form:option>
				</c:forEach>
			</form:select>
			
		</div>
	</div>
	
	<div class="form-group">
		<form:label path="timePlay" cssClass="col-sm-2 control-label">Czas gry (min)</form:label>
		<div class="col-sm-10">
			<form:input path="timePlay" cssClass="form-control" placeholder="min"/>
			</div>
			<form:errors path="timePlay" cssClass="alert alert-warning" />
	</div>
	<div class="form-group">
		<form:label path="goals" cssClass="col-sm-2 control-label">Bramki zawodnika</form:label>
		<div class="col-sm-10">
			<form:input path="goals" cssClass="form-control" />
			</div>
			<form:errors path="goals" cssClass="alert alert-warning" />
	</div>
	<div class="form-group">
		<form:label path="yellowCard" cssClass="col-sm-2 control-label">Żółte kartki</form:label>
		<div class="col-sm-10">
			<form:input path="yellowCard" cssClass="form-control" />
			</div>
			<form:errors path="yellowCard" cssClass="alert alert-warning" />
	</div>
	<div class="form-group">
		<form:label path="redCard" cssClass="col-sm-2 control-label">Czerwone kartki</form:label>
		<div class="col-sm-10">
			<form:input path="redCard" cssClass="form-control" />
			</div>
			<form:errors path="redCard" cssClass="alert alert-warning" />
	</div>
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btn-large"><c:out value="${formButtonLabel}" /></button>
		</div>
	</div>

</form:form>
