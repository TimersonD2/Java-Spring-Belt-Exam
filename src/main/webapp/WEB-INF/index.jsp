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

<body>
	<div class=wrapper>
		<div class=header>
			<h1 class="blueText">TV Shows Database</h1>
		</div>
		<div class=main>
			<div class=col>
				<h1>Register</h1>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<p>
						<form:label path="userName">User Name:</form:label>
						<form:input path="userName" />
						<form:errors class="text-danger" path="userName" />
					</p>

					<p>
						<form:label path="email">Email:</form:label>
						<form:input path="email" />
						<form:errors class="text-danger" path="email" />
					</p>

					<p>
						<form:label path="password">Password:</form:label>
						<form:password path="password" />
						<form:errors class="text-danger" path="password" />
					</p>

					<p>
						<form:label path="confirm">Confirm PW:</form:label>
						<form:password path="confirm" />
						<form:errors class="text-danger" path="confirm" />
					</p>

					<button>Register</button>
				</form:form>
			</div>

			<div class=col>
				<h1>Log In</h1>
				<h2>Message: <c:out value="${message}">${message}</c:out></h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">

					<p>
						<form:label path="email">Email:</form:label>
						<form:errors class="text-danger" path="email" />
						<form:input path="email" />
					</p>

					<p>
						<form:label path="password">Password:</form:label>
						<form:errors class="text-danger" path="password" />
						<form:password path="password" />
					</p>

					<button>Login</button>
				</form:form>
			</div>
		</div>
	</div>

</body>

</html>