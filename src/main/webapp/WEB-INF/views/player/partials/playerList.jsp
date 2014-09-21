<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/taglibs.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


      
<table summary="" class="table table-hover table-list-search">
	<thead>
		<tr><th id="status">#</th>
			<th id="name">NAZWISKO I IMIE</th>
			<th id="time">GRUPA ZAWODNIKÓW</th>	
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
			<td><a href="${show}">SZCZEGÓŁY&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${edit}">EDYCJA&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a>&nbsp;<a href="${delete}">USUŃ&nbsp;<span class="glyphicon glyphicon-chevron-right"></span></a></td>
		
		
		</tr>
		</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><div class="alert alert-info"><strong>Szukana fraza: "'
                    + $(that).val()
                    + '"</strong></div></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6"><div class="alert alert-danger"><strong>Nie znaleziono szukanej frazy!</strong></div></td></tr>');
        }
    });
});
</script>
