<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/player" var="indexUrl" />

<div class="page-header">
<blockquote>
	<h1>ZARZĄDZANIE ZAWODNIKAMI</h1>
	<footer>SZCZEGÓŁY ZAWODNIKA ${player.firstname}&nbsp;${player.lastname}</footer>
</blockquote>
</div>

<a href="${indexUrl}"><span class="glyphicon glyphicon-chevron-left"></span>&nbsp;back</a>

<div class="flowline-med">
	<dl class="dl-horizontal">
		<dt>Imie i Nazwisko</dt><dd><c:out value="${player.firstname} ${player.lastname}" /></dd>
		<dt>Grupa</dt><dd><c:out value="${player.team.name}" /></dd>
		<dt>Data urodzenia</dt><dd><c:out value="${player.birthday}" /></dd>
		<dt>Adres</dt><dd><c:out value="${player.adress}" /></dd>
		<dt>Telefon</dt><dd><c:out value="${player.phone}" /></dd>
		<dt>E-mail</dt><dd><c:out value="${player.email}" /></dd>
		<dt>Badania lekarskie</dt><dd><c:out value="${player.medicalTest}" /></dd>
	</dl>
</div>

<c:url value="/player/edit=${player.id}" var="editPlayerUrl" />
<a href="${editPlayerUrl}" class="btn btn-primary btn-large">edit</a>

<c:import url="/WEB-INF/views/player/partials/playerDeleteForm.jsp">
	<c:param name="player" value="${player}" />
</c:import>

<script>
	$('.confirm').click(function () {
		$('form').submit();
	});
</script>




