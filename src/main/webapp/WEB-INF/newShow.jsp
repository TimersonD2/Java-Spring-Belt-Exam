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

<title>Add A Show</title>
</head>
<body class="dark-mode">
	<div class="wrapper">
		<div class="message">
			<h1 class="blue-text">Add TV Show</h1>
			<h6>
				<a class="links" href="/dashboard">Back to DashBoard</a>
			</h6>
		</div>
		<div class="view-main">
			<form:form action="/saveShow" method="post" modelAttribute="newShow">
		    	<p>
		    	<form:hidden path="user"/>
		    	</p>
				<p class="edit-row">
					<form:label class="blue-label" path="title">Title:</form:label>
					<form:input class="input-bgrnd" path="title" />
				</p>
					<form:errors class="text-danger" path="title" />
				<p>
				</p>

				<p class="edit-row">
					<form:label class="blue-label" path="network">Network:</form:label>
					<form:input class="input-bgrnd" path="network" />
				</p>
				<p>
					<form:errors class="text-danger" path="network" />
				</p>

				<p class="edit-row">
					<form:label class="blue-label" path="rating">Rating:</form:label>
					<form:input class="input-bgrnd" type="number" path="rating" />
				</p>
				<p>
					<form:errors class="text-danger" path="rating" />
				</p>

				<p class="edit-row">
					<form:label class="blue-label" path="imgUrl">Image URL:</form:label>
					<form:input class="input-bgrnd" path="imgUrl" />
				</p>
				<p>
					<form:errors class="text-danger" path="imgUrl" />
				</p>

				<p>
					<form:label class="blue-label" path="description">Description of the show:</form:label>
					<form:textarea class="thoughts" rows="6" cols="60" path="description" />
				</p>
				<p>
					<form:errors class="text-danger" path="description" />
				</p>

		    	<p>
		   		 	<form:hidden path="likes"/>
		    	</p>
		    	<p>
		   		 	<form:hidden path="disLikes"/>
		    	</p>

		    	<div class="bot-btn">
			        <button class="login-btn">Add Show</button>
		    	</div>
			</form:form>
		</div>
	</div>

</body>
</html>