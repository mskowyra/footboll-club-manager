<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/new" var="newCoachUrl" />

<div class="page-header">
	<blockquote>
	<h1>PANEL ADMINISTARCYJNY</h1>
	<footer>ZARZĄDZANIE KLUBEM </footer>
</blockquote>
</div>

<a href="${newCoachUrl}">Dodaj trenera&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>

<div class="flowline-med">
	<c:choose>
		<c:when test="${!empty coach}">
			<c:import url="/WEB-INF/views/admin/partials/coachList.jsp">
			<%-- <c:param name="players" value="${teams}" />--%>
			<c:param name="coach" value="${coach}" />
			</c:import>
		</c:when>
		<c:otherwise>
			<p class="lead ">Brak trenerów!</p>
		</c:otherwise>
	</c:choose>
</div>
