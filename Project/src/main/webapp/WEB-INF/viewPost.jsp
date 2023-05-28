<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet">
<title>Pet-Fo | Post</title>
</head>
<body>
	<div class="header-complete" >
		<div class="logo" >
			<img src="/images/test.png"/>
			<h1 class="header" >Pet-Fo</h1>
		</div>
		<div class="name" >
			<h1>Hello <c:out value="${user.name}" />!</h1>
		</div>
		<div class="header-links" >
			<a href="/" >Home</a>
			<a href="/about" >About</a>
			<a href="https://www.petfinder.com/" >Adopt Pet</a>
			<c:if test="${user.id == null}" >
				<a href="/login" >Log In</a>
				<a href="/register" >Sign Up</a>
			</c:if>
			<c:if test="${user.id != null}" >
				<a href="/add" >Add Pet</a>
				<a href="/logout">Log Out</a>
			</c:if>
		</div>
	</div>
	<div class="main2" >
		<h1>Here's Some Pet-Fo!</h1>
	</div>
	<div class="post">
		<div class="posts-flex">
			<h2><c:out value="${pet.breed}" /> <c:out value="${pet.type}" /> by <c:out value="${pet.user.name }" /></h2>
			<h2>Rating: <c:out value="${pet.rating }" /></h2>
		</div>
		<div class="post-flex" >
			<h4><b>Responsibilities:</b></h4>
			<p><c:out value="${pet.responsibilities }" /></p>
		</div>
		<div class="post-flex" >
			<h4><b>Thoughts:</b></h4>
			<p><c:out value="${pet.description }" /></p>
		</div>
	</div>
</body>
</html>