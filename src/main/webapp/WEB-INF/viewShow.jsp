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
		<div class="viewShow">
			<div class="statsCol">
				<h3 class="blueText">Posted by: ${show.user.userName} </h3>
				<h4 class="blueText">Network: ${show.network} </h4>
				<h5 class="blueText">Rating: ${show.rating} </h5>
				<img alt="no image available" src="/images/thumbs-up.png" class="thumb">
				<img alt="no image available" src="/images/thumbs-dn.png" class="thumb">
				<div class="likes">
					<p class="likesText">Likes: ${show.likes}</p>
					<p class="likesText">Dislikes: ${show.disLikes}</p>
				</div>
				
				<div class="viewThoughts">
					<h6 class="blueText">Description of the show:</h6>
					<textarea class="thoughts" rows="5" cols="60">${show.description}</textarea>
					<img class="viewImg" alt="No Image Available" src="${show.imgUrl}">
		
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
			<div class="commentCol">
				<h3 class="blueText">Comments For ${show.title}</h3>
				<c:forEach items="${show.comments}" var="item">
					<div class="viewThoughts">
						<h6 class="blueText">${item.user.userName} thoughts...</h6>
						<textarea class="thoughts" rows="4" cols="35">${item.comment}</textarea>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="viewMain">
			<form:form action="/saveComment/${show.id}" method="post" modelAttribute="newComment">
		    	<form:hidden path="user"/>
		    	<form:hidden path="show"/>
		    	
				<p>
					<form:label class="blueLabel" path="comment">Comment about the show:</form:label>
					<form:textarea class="thoughts" rows="5" cols="60" path="comment" />
				</p>
				<p>
					<form:errors class="text-danger" path="comment" />
				</p>

		    	<div class="botBtn">
			        <button class="loginBtn">Save</button>
		    	</div>
			</form:form>
		</div>
		
		
	</div>

</body>
</html>