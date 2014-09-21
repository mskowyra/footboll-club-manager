<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin/new" var="newCoachUrl" />

<div class="page-header background">
	<blockquote>
	<h1>PANEL ADMINISTARCYJNY</h1>
	<footer>ZARZĄDZANIE KLUBEM </footer>
</blockquote>
</div>
<div class="background2">
<div class="btn-group btn-group-justified">
  <div class="col-sm-offset-4 col-sm-4">
			<a href="/admin/coach" type="button" class="btn btn-primary btn-large btn-block">Zarządzanie Użytkownikami</a>
			<a href="/team" type="button" class="btn btn-primary btn-large btn-block">Zarządzanie Drużynami</a>
			<a href="/player" type="button" class="btn btn-primary btn-large btn-block">Zarządzanie Zawodnikami</a>
			<a href="/match" type="button" class="btn btn-primary btn-large btn-block">Rezerwacja Boiska</a>
</div>
</div>
</div>