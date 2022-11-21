<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

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

<title>Edit TV Show</title>
</head>
<body class="darkMode">
	<div class="wrapper">
		<div class="welcome">
			<div class="message">
				<h1 class="blueText">Edit TV Show</h1>
				<h6>
					<a class="links" href="/dashboard">Back to DashBoard</a>
				</h6>
			</div>
		</div>
		<div class="viewMain">
		    <form:form action="/updateShow/${show.id}" method="put" modelAttribute="show">
		    	<p>
		   		 	<form:hidden path="user"/>
		    	</p>
				<p class="editRow">
					<form:label class="blueLabel" path="title">Title:</form:label>
					<form:input class="inputBgrnd" path="title" />
				</p>
				<p>
					<form:errors class="text-danger" path="title" />
				</p>

				<p class="editRow">
					<form:label class="blueLabel" path="network">Network:</form:label>
					<form:input class="inputBgrnd" path="network" />
				</p>
				<p>
					<form:errors class="text-danger" path="network" />
				</p>

				<p class="editRow">
					<form:label class="blueLabel" path="rating">Rating:</form:label>
					<form:input class="inputBgrnd" type="number" path="rating" />
				</p>
				<p>
					<form:errors class="text-danger" path="rating" />
				</p>

				<p>
					<form:label class="blueLabel" path="description">Thoughts about the show:</form:label>
					<form:textarea class="thoughts" rows="6" cols="60" path="description" />
				</p>
				<p>
					<form:errors class="text-danger" path="description" />
				</p>

				<form:hidden path="rating" value="5"/>
		    	
		    	<div class="botBtn">
			        <button class="loginBtn">Update</button>
		    	</div>
		    </form:form>
		</div>
	</div>
</body>
</html>