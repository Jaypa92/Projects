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
			<img src="/images/any.jpg" />
		</div>
		<div class="result">
			<h4>Any Pet You Want!</h4>
			<p>You're the kind of person that's not too busy to spend time with your friend to keep
			their needs of affection and attention taken care of. Pets can at times feel their owner
			 doesn't care about them due to this. Not to mention you're very responsible as well
			  so none of their needs to survive will be neglected. Go ahead! Your options are many! Go find
			   your new friend! Common friends are Cats and Dogs. Check out the <a href="/thoughts">pet-fo</a> section to help figure
			    out which one is right for you!</p>
		</div>
	</div>
</body>
</html>