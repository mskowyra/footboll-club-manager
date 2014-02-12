<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table summary="" class="table">
	<thead>
		<tr>
			<th id="name">NAZWA DRUŻYNY</th>
			<th id="coach">TRENER</th>	
			<th id="options">OPCJE</th>			
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${teams}" var="team" >
		
		<c:url value="/team/show=${team.teamId}" var="url" />
		<tr>
			<td>${team.name}</td>
			<td>${team.coach.firstname}&nbsp;${team.coach.lastname}</td>
			<td><a href="${url}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;</td>
		</tr>
		</c:forEach>
	</tbody>
</table>