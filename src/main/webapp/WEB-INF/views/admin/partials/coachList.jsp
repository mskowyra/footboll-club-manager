<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table summary="" class="table">
	<thead>
		<tr>
			<th id="name">NAZWISKO I IMIE</th>
			
			
			<th id="options">OPCJE</th>			
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${coach}" var="coach" >
		
		<c:url value="/admin/show=${coach.coachId}" var="url" />
		<tr>
			<td>${coach.lastname}&nbsp;${coach.firstname}</td>
			
			<td><a href="${url}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;</td>
		</tr>
		</c:forEach>
	</tbody>
</table>