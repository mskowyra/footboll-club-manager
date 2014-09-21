<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin" var="indexUrl" />

<div class="page-header background">
	<blockquote>
	<h1>PANEL ADMINISTARCYJNY</h1>
	<footer>TRENER ${coach.firstname}&nbsp;${coach.lastname} </footer>
</blockquote>
</div>
<div class="background2">
<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>

<div class="form-group" >
<div class="col-sm-4"></div>
<div class="col-sm-9 col-md-offset-3">
<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Imię i Nazwiko</dt><dd><c:out value="${coach.firstname} ${coach.lastname}" /></dd>
		<dt>Data urodzenia</dt>
		<dt>Adres</dt>
		<dt>Telefon</dt>
		<dt>Email</dt>
	</dl>
</div>
</div>
</div>

 <div class="btn-group btn-group-justified">
  <div class="col-sm-offset-3 col-sm-2">
<c:url value="/admin/edit=${coach.coachId}" var="editCoachUrl" />
<a href="${editCoachUrl}" class="btn btn-primary btn-large btn-block">Edycja</a>
</div>
<div class="col-sm-2">	
<c:import url="/WEB-INF/views/admin/partials/coachDeleteForm.jsp">
	<c:param name="coach" value="${coach}" />
</c:import>
</div>
</div>
</div>
<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




