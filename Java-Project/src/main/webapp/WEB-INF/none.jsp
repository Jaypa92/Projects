<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/add.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap"
	rel="stylesheet">
<title>Pet-Fo | Result</title>
</head>
<body>
	<div class="header-complete">
		<div class="logo">
			<img src="/images/test.png" />
			<h1 class="header">Pet-Fo</h1>
		</div>
		<div class="name">
			<h1>
				Hello
				<c:out value="${user.name}" />
				!
			</h1>
		</div>
		<div class="header-links">
			<a href="/">Home</a> <a href="/about">About</a> <a
				href="https://www.petfinder.com/">Adopt Pet</a>
			<c:if test="${user.id == null}">
				<a href="/login">Log In</a>
				<a href="/register">Sign Up</a>
			</c:if>
			<c:if test="${user.id != null}">
				<a href="/add">Add Pet</a>
				<a href="/logout">Log Out</a>
			</c:if>
		</div>
	</div>
	<div class="body" >
		<h2>Here's Your Result!</h2>
		<div class="centered">
			<img src="/images/none.jpg" />
		</div>
		<div class="result">
			<h4>Take Care of Yourself!</h4>
			<p>We understand life gets busy sometimes but at the rate your going it can be considered
			 unhealthy! While having work to do is important, we recommend to take some time off and
			 relax every now and then! See if you can rid yourself of tasks that don't accomplish much
			 or maybe look into improving your time management skills. Pets require time for love and
			  affection and also the time to have their needs met so they can live! We do not recommend
			   that anyone who has so little time to get a pet.</p>
		</div>
	</div>
</body>
</html>