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
<title>Show Manager</title>
</head>

<body class="dark-mode">
	<div class="wrapper">
		<div class="header">
			<h1 class="blue-text">TV Shows Application</h1>
		</div>
		<div class="main">
			<div class="login">
				<h1 class="login-hdr">Register</h1>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<p class="login-row">
						<form:label class="blue-label" path="userName">User Name:</form:label>
						<form:input class="input-bgrnd" path="userName" />
					</p>
					<p>
						<form:errors class="text-danger" path="userName" />
					</p>

					<p class="login-row">
						<form:label class="blue-label" path="email">Email:</form:label>
						<form:input class="input-bgrnd" path="email" />
					</p>
					<p>
						<form:errors class="text-danger" path="email" />
					</p>

					<p class="login-row">
						<form:label class="blue-label" path="password">Password:</form:label>
						<form:password class="input-bgrnd" path="password" />
					</p>
					<p>
						<form:errors class="text-danger" path="password" />
					</p>

					<p class="login-row">
						<form:label class="blue-label" path="confirm">Confirm PW:</form:label>
						<form:password class="input-bgrnd" path="confirm" />
					</p>
					<p>
						<form:errors class="text-danger" path="confirm" />
					</p>
					<p class="bot-btn">
						<button class="login-btn">Register</button>
					</p>
				</form:form>
			</div>

			<div class="login">
				<h1 class="login-hdr">Log In</h1>
				<p><c:out value="${message}">${message}</c:out></p>
				<form:form action="/login" method="post" modelAttribute="newLogin">

					<p class="login-row">
						<form:label class="blue-label" path="email">Email:</form:label>
						<form:input class="input-bgrnd" path="email" />
					</p>
					<p>
						<form:errors class="text-danger" path="email" />
					</p>

					<p class="login-row">
						<form:label class="blue-label" path="password">Password:</form:label>
						<form:password class="input-bgrnd" path="password" />
					</p>
					<p>
						<form:errors class="text-danger" path="password" />
					</p>

					<p class="bot-btn">
						<button class="login-btn">Log In</button>
					</p>
				</form:form>
			</div>
		</div>
	</div>

</body>

</html>