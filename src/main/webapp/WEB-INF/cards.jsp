<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="/css/styles.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<title>Cards View</title>
</head>
<body class="dark-mode">
	<div class="dash-main">
		<a class="links" href="/dashboard">Back to Dashboard</a>
		<div class="cards-main">
			<c:forEach items="${allShows}" var="show">
				<div class="show-card">
					<a class="links" href="/viewShow/${show.id}">${show.title}</a>
					<p class="blue-text">Network: ${show.network}</p>
					<p class="blue-text">Rating: ${show.rating}</p>
					<img class="show-img" alt="No Immage Available" src="${show.imgUrl}">
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>