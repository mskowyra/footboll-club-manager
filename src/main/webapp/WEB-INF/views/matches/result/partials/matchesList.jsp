<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table summary="" class="table">
	<thead>
		<tr>
			<th id="dateMatches">TERMIN</th>
			<th id="opponent">PRZECIWNIK</th>	
			<th id="typeMatches">RODZAJ SPOTKANIA</th>	
			<th id="options">OPCJE</th>			
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${matches}" var="matches" >
		<c:url value="/match/result/edit=${matches.matchesId}" var="resultEdit" />
		<c:url value="/match/show=${matches.matchesId}" var="url" />
		<tr>
			<td>${matches.dateMatches}</td>
			<td>${matches.opponent}</td>
			<td>${matches.typeMatches}</td>
			<td><a href="${resultEdit}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${url}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;</td>
		</tr>
		</c:forEach>
	</tbody>
</table>