<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<c:url value="/player" var="indexUrl" />

<div class="page-header background">
	<blockquote>
		<h1>ZARZADZANIE ZAWODNIKAMI</h1>
		<footer>SZCZEGUŁYY ZAWODNIKA
			${player.firstname}&nbsp;${player.lastname}</footer>
	</blockquote>
</div>

<div class="background3">
	<a href="${indexUrl}"><span
		class="glyphicon glyphicon-chevron-left"></span>&nbsp;cofnij</a>
	<div class="flowline-med">
	<div class="col-sm-6 col-md-offset-3">
	<blockquote>
		<p>Dane zawodnika<p>
	</blockquote>
	</div>
		<div class="col-sm-1 col-md-offset-3">
			<div class="flowline-med"></div>
			<img class="img-circle"
				src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
				alt="User Pic">
		</div>

		<div class="col-sm-6">
			<div class="flowline-med">
				<dl class="dl-horizontal">
					<dt>Imie i Nazwisko</dt>
					<dd>
						<c:out value="${player.firstname} ${player.lastname}" />
					</dd>
					<dt>Grupa</dt>
					<dd>
						<c:out value="${player.team.name}" />
					</dd>
					<dt>Data urodzenia</dt>
					<dd>
						<c:out value="${player.birthday}" />
					</dd>
					<dt>Adres</dt>
					<dd>
						<c:out value="${player.adress}" />
					</dd>
					<dt>Telefon</dt>
					<dd>
						<c:out value="${player.phone}" />
					</dd>
					<dt>E-mail</dt>
					<dd>
						<c:out value="${player.email}" />
					</dd>
					<dt>Badania lekarskie</dt>
					<dd>
						<c:out value="${player.medicalTest}" />
					</dd>
				</dl>
			</div>

<div class="btn-group btn-group-justified">
  <div class="col-sm-offset-2 col-sm-2">
			<c:url value="/player/edit=${player.id}" var="editPlayerUrl" />
			<a href="${editPlayerUrl}" type="button" class="btn btn-primary btn-large btn-block">Edycja</a>
</div>
<div class="col-sm-2">
			<c:import url="/WEB-INF/views/player/partials/playerDeleteForm.jsp">
				<c:param name="player" value="${player}" />
			</c:import>
		</div>
		</div>
	</div>
	<br></br>
	<div class="col-sm-6 col-md-offset-3"></div>
	<div class="flowline-med">
	<div class="col-sm-6 col-md-offset-3">
	<blockquote>
		<p>Statystyki zawodnika</p>
	</blockquote>
	</div>
	</div>
</div>
<div class="col-sm-offset-3 col-sm-6">
   
</div>

  <div class="col-sm-offset-3 col-sm-6">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Min.</th>
                <th>Br.</th>
                <th>Ż.</th>
                <th>Cz.</th>
                <th>Nr.</th>
                <th>Mecz</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>45'</td>
                <td>1</td>
                <td>2</td>
                <td>1</td>
                <td>11</td>
                <td>27.03.2014 - Cracovia Kraków</td>
            </tr>
            <tr>
                <td>90'</td>
                <td>2</td>
                <td>0</td>
                <td>0</td>
                <td>11</td>
                <td>19.02.2014 - Lechia Gdańsk</td>
            </tr>
            <tr>
                <td>64'</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>11</td>
                <td>31.11.2013 - Muszynianka Zdrój</td>
            </tr>
             <tr>
                <td>102'</td>
                <td>1</td>
                <td>2</td>
                <td>1</td>
                <td>11</td>
                <td>02.03.2013 - Podbezkidzie Nowytarg</td>
            </tr>
        </tbody>
    </table>
</div>


<script>
	$('.confirm').click(function() {
		$('form').submit();
	});
</script>
</div>

