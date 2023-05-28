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
<title>Insert title here</title>
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
			<img src="/images/fishBird.jpg" />
		</div>
		<div class="result">
			<h4>A Bird or a Fish!</h4>
			<p>We recommend for you a bird or a fish! You seem like although you still have
			 some time for other things, we would hope that it wouldn't get in the way for 
			 the living creature that lives in your house that is totally dependent on you
			 for survival. To eliminate the possibility of that happening, we recommend something
			 that doesn't require a whole lot like a bird or a gold fish. Something that mainly
			  requires feeding and watering and doesn't require cleaning as often. Check out the 
			  <a href="/thoughts" >pet-fo</a> section for more pet-fo to help you decide! </p>
		</div>
	</div>
</body>
</html>