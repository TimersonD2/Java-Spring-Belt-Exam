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

<title>Show Dashboard</title>
</head>
<body class=darkMode>
	<div class="wrapper">
		<div class="welcome">
			<div class="message">
				<h1 class="blueText">
					Welcome,
					<c:out value="${validUser.userName}"></c:out>
				</h1>
				<a class="links" href="/logout">Logout</a>
			</div>
			<h4 class="welcomeBack">${message}</h4>
		</div>

		<div class="dashMain">
			<h3 class="blueText">TV Shows</h3>
			<table>
				<thead>
					<tr class="tblRow">
						<th class="tblHdr">Show</th>
						<th class="tblHdr">Network</th>
						<th class="tblHdr">Rating</th>
						<th class="tblHdr">Posted By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allShows}" var="show">
						<tr class="tblRow">
							<td class="tblData"><a class="links" href="/viewShow/${show.id}">${show.title}</a></td>
							<td class="tblData"><c:out value="${show.network}"></c:out></td>
							<td class="tblData"><c:out value="${show.rating}"></c:out></td>
							<td class="tblData"><c:out value="${show.user.userName}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="bottomButton">
				<form:form action="/addShow" method="get">
					<button class="loginBtn">Add a Show</button>
				</form:form>
			</div>
			<div class="cardsMain">
				<c:forEach items="${allShows}" var="show">
					<div class="showCard">
						<a class="links" href="/viewShow/${show.id}">${show.title}</a>
						<p class="blueText">Network: ${show.network}</p>
						<p class="blueText">Rating: ${show.rating}</p>
						<img class="showImg" alt="No Immage Available" src="${show.imgUrl}">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="viewMain">
			<c:forEach items="${validUser.comments}" var="item">
				<div class="viewThoughts">
					<h5 class="blueText">Comment on ${item.show.title}</h5>
					<textarea class="thoughts" rows="6" cols="60">${item.comment}</textarea>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>