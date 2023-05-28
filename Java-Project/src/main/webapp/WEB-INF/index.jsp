<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet">
<title>Pet-Fo Main</title>
</head>
<body>
	<div class="header-complete" >
		<div class="logo" >
			<img src="/images/test.png"/>
			<h1 class="header" >Pet-Fo</h1>
		</div>
		<div class="header-links" >
			<a href="/about" >About</a>
			<a href="https://www.petfinder.com/" >Adopt Pet</a>
			<c:if test="${user.id == null}">
				<a href="/login" >Log In</a>
				<a href="/register" >Sign Up</a>
			</c:if>
			<c:if test="${user.id != null}" >
				<a href="/add" >Add Pet</a>
				<a href="/logout">Log Out</a>
			</c:if>
		</div>
	</div>
	<div class="main" >
		<div class="body" >
			<h1 class="header2" >Interested in getting a pet?</h1> 
			<h4>Well you've come to the right place! Here at Pet-Fo
			we want to make sure you have all the info, or Pet-Fo as we call it, to make sure your pet is right for you! See what
			people are experiencing or maybe even take a quiz to see what kind of pet fits your lifestyle! That way you'll know what to get
			and more importantly, the responsibilities that are going to come with your pet!</h4>
			<div class="options" >
				<div class="selection" >
					<img src="/images/quiz.jpg" />
					<p>Take a <a href="/quiz" >Quiz</a></p>
				</div>
				<div class="selection" >
					<img src="/images/thoughts.jpg" />
					<p>Get some <a href="/thoughts" >Pet-Fo</a></p>
				</div>
			</div>
		</div>
		<div class="col-2" >
			<img src="/images/pets.jpg" />
		</div>
	</div>
</body>
</html>