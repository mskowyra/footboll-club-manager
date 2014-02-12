<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<table summary="" class="table table-hover">
	<thead>
		<tr><th id="status">#</th>
			<th id="name">NAZWISKO I IMIE</th>
			<th id="time">GRUPA ZAWODNIKÓW</th>	
			<th id="options">OPCJE</th>			
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${players}" var="player" >
		
		<c:url value="/player/show=${player.id}" var="show" />
		<c:url value="/player/edit=${player.id}" var="edit" />
		<c:url value="/player/delete=${player.id}" var="delete" />
		<tr>
			<td></td>
			<td>${player.lastname}&nbsp;${player.firstname}</td>
			<td>${player.team.name}</td>
			<td><a href="${show}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${edit}">EEDYCJA&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${delete}">USUŃ&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a></td>
		
		
		</tr>
		</c:forEach>
	</tbody>
</table>

