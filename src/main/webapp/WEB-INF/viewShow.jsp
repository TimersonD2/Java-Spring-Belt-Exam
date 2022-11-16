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

<title>Show Details</title>
</head>
<body class="darkMode">
	<div class=wrapper>
		<div class="welcome">
			<div class="message">
			<h1 class="blueText">${show.title}</h1>
			<a class="links" href="/dashboard">Back to Dashboard</a>
			</div>
		</div>
		<div class="viewMain">
			<h2 class="blueText">Posted by: ${show.user.userName} </h2>
			<h3 class="blueText">Network: ${show.network} </h3>
			<div class="viewThoughts">
				<h5 class="blueText">Thoughts about the show:</h5>
				<textarea class="thoughts" rows="10" cols="60">${show.description}</textarea>
	
				<c:if test="${sessionScope.userId == show.user.id}">
					<div class="botBtn">
						<form:form action="/editShow/${show.id}" method="get">
							<button class="loginBtn">Edit Show</button>
						</form:form>
						<form:form action="/deleteShow/${show.id}" method="delete">
							<button class="deleteBtn">Delete Show</button>
						</form:form>
					</div>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>