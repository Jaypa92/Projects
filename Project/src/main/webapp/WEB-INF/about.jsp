<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/add.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet">
<title>Pet-Fo | About</title>
</head>
<body style="background-color:mediumaquamarine;" >
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
	<div class="body">
		<h1>About Us!</h1>
		<p>Have you or someone you know ever been in a situation where you get a pet but then
		find out that it's too much responsibility for you? Well that's what we're about. We want 
		people to understand what they're getting themselves into while they're still in
		the consideration phase for getting a pet. By doing things this way, it saves you time,
		 money, and headaches from any surprises that you didn't expect. The opinions here are from pet owners themselves
		  so that way you can hear opinions and facts from real experiences. We hope you enjoy our
		  site and find it helpful for you in finding the right pet for you.</p>
	</div>
</body>
</html>