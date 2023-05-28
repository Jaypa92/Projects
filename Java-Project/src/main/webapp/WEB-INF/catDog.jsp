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
			<img src="/images/catDog.jpg" />
		</div>
		<div class="result">
			<h4>A Cat or Dog!</h4>
			<p>We recommend for you a cat or a dog! You seem like the kind of person that can 
			handle responsibility! You have what it takes to handle a pet and since your great
			time management skills prevent you from being too busy for anything else, we recommend 
			something that doesn't require too much like a cat or dog! Visit the <a href="/thoughts">pet-fo</a> section and
			read some posts from our users to figure out which one best suits your lifestyle! </p>
		</div>
	</div>
</body>
</html>