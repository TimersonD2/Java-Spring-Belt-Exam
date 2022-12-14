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

<title>My Comments</title>
</head>
<body class="dark-mode">
	<div class="wrapper">
		<div class="view-main">
			<a class="links" href="/dashboard">Back to Dashboard</a>
			<c:forEach items="${validUser.comments}" var="item">
				<div class="view-thoughts">
					<h5 class="blue-text">Comment on ${item.show.title}</h5>
					<textarea class="thoughts" rows="6" cols="60">${item.comment}</textarea>
					<p>Comment Id: ${item.id}</p>
					<form:form action="/deleteComment/${item.id}" method="delete">
						<button class="delete-btn">Delete Comment</button>
					</form:form>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>