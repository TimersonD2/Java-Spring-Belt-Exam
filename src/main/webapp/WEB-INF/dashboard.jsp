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
<body class="dark-mode">
	<div class="wrapper">
		<div class="welcome">
			<div class="message">
				<h1 class="blue-text">
					Welcome,
					<c:out value="${validUser.userName}"></c:out>
				</h1>
				<a class="links" href="/myComments">My Comments</a>
				<a class="links" href="/cardView">Card View</a>
				
				<a class="links" href="/logout">Logout</a>
			</div>
			<h4 class="welcome-back">${message}</h4>
		</div>

		<div class="dash-main">
			<h3 class="blue-text">TV Shows</h3>
			<table>
				<thead>
					<tr class="tbl-row">
						<th class="tbl-hdr">Show</th>
						<th class="tbl-hdr">Network</th>
						<th class="tbl-hdr">Rating</th>
						<th class="tbl-hdr">Posted By</th>
						<th class="tbl-hdr">Likes</th>
						<th class="tbl-hdr">Dislikes</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allShows}" var="show">
						<tr class="tbl-row">
							<td class="tbl-data"><a class="links" href="/viewShow/${show.id}">${show.title}</a></td>
							<td class="tbl-data"><c:out value="${show.network}"></c:out></td>
							<td class="tbl-data"><c:out value="${show.rating}"></c:out></td>
							<td class="tbl-data"><c:out value="${show.user.userName}"></c:out></td>
							<td class="tbl-data"><c:out value="${show.likes}"></c:out></td>
							<td class="tbl-data"><c:out value="${show.disLikes}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="bottom-button">
				<a class="add-link" href="/addShow">Add Show</a>
			</div>
		</div>
	</div>
</body>
</html>