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

<script type="text/javascript" src="/js/script.js"></script>

<title>Show Details</title>
</head>
<body class="dark-mode">
	<div class=wrapper>
		<div class="welcome">
			<div class="message">
				<h1 class="blue-text">${show.title}</h1>
				<a class="links" href="/dashboard">Back to Dashboard</a>
			</div>
		</div>
		<div class="view-show">
			<div class="stats-col">
				<h5 class="blue-text">Posted by: ${show.user.userName}</h5>
				<div class="show-main">
				<div>
					<div class="network">
						<h5 class="blue-text">Network: ${show.network} </h5>
						<h5 class="blue-text">Rating: ${show.rating} </h5>
					</div>
					<div class="likes">
						<div class="thumb-col">
							<div class="thumb-box">
								<form:form action="/updateLikes/${show.id}" method="put" modelAttribute="show">
									<button class="like-btn"></button>
								</form:form>
							</div>
							<p class="likes-text">Likes: ${show.likes}</p>
						</div>
						<div class="thumb-col">
							<div class="thumb-box">
								<form:form action="/updateDisLikes/${show.id}" method="put" modelAttribute="show">
									<button class="dislike-btn"></button>
								</form:form>
							</div>
							<p class="likes-text">Dislikes: ${show.disLikes}</p>
						</div>
					</div>
				</div>
					<img class="view-img" alt="No Image Available" src="${show.imgUrl}">
				</div>
								
				<div class="view-thoughts">
					<div class="view-desc">
						<h6 class="blue-text">Description of the show:</h6>
						<textarea class="thoughts" rows="5" cols="60">${show.description}</textarea>
					</div>
		
					<c:if test="${sessionScope.userId == show.user.id}">
						<div class="bot-btn">
							<form:form action="/editShow/${show.id}" method="get">
								<button class="form-btn">Edit Show</button>
							</form:form>
							<form:form action="/deleteShow/${show.id}" method="delete">
								<button class="delete-btn">Delete Show</button>
							</form:form>
						</div>
					</c:if>
				</div>
				<div class="comment-form">
					<form:form action="/saveComment/${show.id}" method="post" modelAttribute="newComment">
				    	<form:hidden path="user"/>
				    	<form:hidden path="show"/>
				    	
						<p>
							<form:label class="blue-label" path="comment">Comment about the show:</form:label>
							<form:textarea class="thoughts" rows="4" cols="60" path="comment" />
						</p>
						<p>
							<form:errors class="text-danger" path="comment" />
						</p>
		
				    	<div class="bot-btn">
					        <button class="form-btn">Save</button>
				    	</div>
					</form:form>
				</div>
			</div>
			<div class="comment-col">
				<h5 class="blue-text">Comments For ${show.title}</h5>
				<c:forEach items="${show.comments}" var="item">
					<div class="view-thoughts">
						<h6 class="blue-text">${item.user.userName}'s thoughts...</h6>
						<textarea class="thoughts" rows="4" cols="35">${item.comment}</textarea>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>