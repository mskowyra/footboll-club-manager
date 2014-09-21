<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="formMethod" value="${empty param.formMethod ? 'post' : param.formMethod}" />
<c:set var="formAction" value="${empty param.formAction ? '' : param.formAction}" />
<c:set var="formButtonLabel" value="${empty param.formButtonLabel ? 'Zapisz' : param.formButtonLabel}" />



<form:form method="${formMethod}" action="${formAction}" commandName="coach" class="form-horizontal" role="form">
  
  	<div class="col-sm-6 col-md-offset-3">
	<blockquote>
		<p>Dane użytkownika<p>
	</blockquote>
	</div>
	
	<div class="form-group">
		<form:label path="firstname" cssClass="col-sm-4 control-label">Imię</form:label>
		<div class="col-sm-4">
			<form:input path="firstname" cssClass="form-control" placeholder="Imię"/>
		</div>
		<div>	
		<form:errors path="firstname" cssClass="alert alert-warning" />
</div>
	</div>


	<div class="form-group" >
		<form:label path="lastname" cssClass="col-sm-4 control-label">Nazwisko</form:label>
		<div class="col-sm-4">
			<form:input path="lastname" cssClass="form-control" placeholder="Nazwisko"/>
			</div>
		<form:errors path="lastname" cssClass="alert alert-warning" />
	</div>

  
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-4 control-label">Data Urodzenia</form:label>
		<div class="col-sm-4">
			<form:input path="" cssClass="form-control" placeholder="DD-MM-YYYY"/>
			</div>
			<form:errors path="" cssClass="alert alert-warning" />
	</div>
	
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-4 control-label">Adres</form:label>
		<div class="col-sm-4">
			<form:input path="" cssClass="form-control" placeholder="Adres"/>
			</div>
			<form:errors path="" cssClass="alert alert-warning" />
	</div>
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-4 control-label">Telefon</form:label>
		<div class="col-sm-4">
			<form:input path="" cssClass="form-control" placeholder="XX-XXX-XXX-XXX"/>
			</div>
			<form:errors path="" cssClass="alert alert-warning" />
	</div>
	
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-4 control-label">Email</form:label>
		<div class="col-sm-4">
			<form:input path="" cssClass="form-control" placeholder="xxx@xxx.xx"/>
			</div>
			<form:errors path="" cssClass="alert alert-warning" />
	</div>
	
	<div class="col-sm-6 col-md-offset-3">
	<blockquote>
		<p>Dane do logowania<p>
	</blockquote>
	</div>
	
	<div class="form-group">
		<form:label path="lastname" cssClass="col-sm-4 control-label">Login</form:label>
		<div class="col-sm-4">
			<form:input path="" cssClass="form-control" placeholder="Login"/>
			<form:errors path="" cssClass="control-label" />
		</div>
	</div>

	 <div class="form-group">
    <label for="inputPassword" class="col-sm-4 control-label">Hasło</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="inputPassword" placeholder="Hasło">
    </div>
  </div>
  

	<div class="form-group" >
	<form:label path="firstname" cssClass="col-sm-4 control-label">Rola</form:label>
	<div class="col-sm-4">
	<select class="form-control" >
 	 <option>Trener</option>
 	 <option>Administrator</option>
 	</select>
 	</div>
	</div>

	
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-4">
			<button type="submit" class="btn btn-primary btn-large btn-block"><c:out value="${formButtonLabel}" /></button>
		</div>
	</div>

</form:form>
