<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<table summary="" class="table table-hover">
	<thead>
		<tr><th id="status">#</th>
			<th id="name">Czas gry</th>
			<th id="time">gole</th>	
			<th id="options">czerwone kartki</th>			
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${player}" var="player" >
		<tr>
			<td></td>
			<td>${player.playerMatches.goal}</td>
			
			<td><a href="${show}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${edit}">EEDYCJA&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${delete}">USUŃ&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a></td>
		
		
		</tr>
		</c:forEach>
	</tbody>
</table>