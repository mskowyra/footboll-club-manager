<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pl">
<head>
    <title>Football Club Manager</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/style/style.css'/>"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    
    <link rel="stylesheet" href="/resources/css/main.css" />
		
		<link href="/resources/css/bootstrap-datepicker.css" rel="stylesheet" />
		
		<script src="/resources/js/bootstrap-datepicker.js"></script>
		
		<script src="/resources/js/jquery-1.10.2.min.js"></script>
		
    	<script src="http://code.jquery.com/jquery-2.0.3.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	</head>
	<body>
		<tiles:insertAttribute name="header" />
		<div class="container " >
			<tiles:insertAttribute name="body" />
		</div>
		
		<tiles:insertAttribute name="footer" />
		
	</body>
</html>