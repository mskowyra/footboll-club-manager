<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/player/new" var="newPlayerUrl" />

<div class="page-header background">
	<blockquote>
	<h1>ZARZĄDZANIE ZAWODNIKAMI</h1>
	<footer>LISTA ZAWODNIKÓW</footer>
</blockquote>
</div>
<div class="background2">
<div class="row">
  <div class="col-xs-6 col-md-4">
  	<a href="${newPlayerUrl}">Dodaj nowego zawodnika&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>
  </div>
  <div class="col-xs-6 col-md-4"></div>
  <div class="col-xs-6 col-md-4">
  		<form action="#" method="get">
                <div class="input-group">
                    <input class="form-control" id="system-search" name="q" placeholder="Szukaj..." required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </form>
        </div>
</div>

<div class="flowline-med">
	<c:choose>
		<c:when test="${!empty players}">
			<c:import url="/WEB-INF/views/player/partials/playerList.jsp">
				<c:param name="players" value="${players}" />
				<c:param name="teams" value="${teams}" />
			</c:import>
		</c:when>
		<c:otherwise>
			<p class="lead ">No contacts in your contact list</p>
		</c:otherwise>
	</c:choose>
</div>
</div>