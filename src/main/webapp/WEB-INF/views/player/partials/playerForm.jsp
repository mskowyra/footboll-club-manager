<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>

<c:set var="formMethod"
	value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction"
	value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel"
	value="${empty param.formButtonLabel ? 'Save' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}"
	commandName="player" class="form-horizontal" role="form">
	<div class="form-group">
		<form:label path="firstname" cssClass="col-sm-2 control-label">ImiÄ</form:label>
		<div class="col-sm-10">
			<form:input path="firstname" cssClass="form-control" placeholder="ImiÄ"/>
			</div>
			<form:errors path="firstname" cssClass="alert alert-warning" />
	</div>

	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-2 control-label">Nazwisko</form:label>
		<div class="col-sm-10">
			<form:input path="lastname" cssClass="form-control" placeholder="Nazwisko"/>
			</div>
		<form:errors path="lastname" ccssClass="alert alert-warning" />
	</div>

	<div class="form-group">
		<form:label path="team" cssClass="col-sm-2 control-label">Drużyna</form:label>
		<div class="col-sm-10">
			<form:select path="team.teamId" cssClass="form-control"	required="True" >
				<form:option value="">Wybierz drużynę do której chcesz przypisać zawodnika...</form:option>
				<c:forEach items="${teams}" var="team">
					<form:option value="${team.teamId}">${team.name}</form:option>
				</c:forEach>
			</form:select>
			<form:errors path="team.name" cssClass="alert alert-warning" />
		</div>
	</div>
	
	<div class="form-group">
		<form:label path="birthday" cssClass="col-sm-2 control-label">Data Urodzenia</form:label>
		<div class="col-sm-10">
			<form:input path="birthday" cssClass="form-control" placeholder="DD-MM-YYYY"/>
			</div>
			<form:errors path="birthday" cssClass="alert alert-warning" />
	</div>
	
	<div class="form-group">
		<form:label path="adress" cssClass="col-sm-2 control-label">Adres</form:label>
		<div class="col-sm-10">
			<form:input path="adress" cssClass="form-control" placeholder="Adres"/>
			</div>
			<form:errors path="adress" cssClass="alert alert-warning" />
	</div>
	<div class="form-group">
		<form:label path="phone" cssClass="col-sm-2 control-label">Telefon</form:label>
		<div class="col-sm-10">
			<form:input path="phone" cssClass="form-control" placeholder="XX-XXX-XXX-XXX"/>
			</div>
			<form:errors path="phone" cssClass="alert alert-warning" />
	</div>
	
	<div class="form-group">
		<form:label path="email" cssClass="col-sm-2 control-label">Email</form:label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" placeholder="xxx@xxx.xx"/>
			</div>
			<form:errors path="email" cssClass="alert alert-warning" />
	</div>
	
	<div class="form-group">
		<form:label path="medicalTest" cssClass="col-sm-2 control-label">Badanie lekarskie</form:label>
		<div class="col-sm-10">
			<form:input path="medicalTest" cssClass="form-control" placeholder="Data ostatnich badaÅ lekarskich DD-MM-YYYY"/>
			</div>
			<form:errors path="medicalTest" cssClass="alert alert-warning"/>
	</div>
	 
	

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btn-large">
				<c:out value="${formButtonLabel}" />
			</button>
		</div>
	</div>

</form:form>

