<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin" var="indexUrl" />

<div class="page-header">
	<blockquote>
	<h1>PANEL ADMINISTARCYJNY</h1>
	<footer>TRENER ${coach.firstname}&nbsp;${coach.lastname} </footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Imię i Nazwiko</dt><dd><c:out value="${coach.firstname} ${coach.lastname}" /></dd>
		
	</dl>
</div>

<c:url value="/admin/edit=${coach.coachId}" var="editCoachUrl" />
<a href="${editCoachUrl}" class="btn btn-primary btn-large">edycja</a>

<c:import url="/WEB-INF/views/admin/partials/coachDeleteForm.jsp">
	<c:param name="coach" value="${coach}" />
</c:import>

<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




