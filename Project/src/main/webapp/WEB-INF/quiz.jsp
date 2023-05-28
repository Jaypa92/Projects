<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Pet-Fo | Quiz</title>
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
	<div class="quiz-body" >
		<div class="quiz-column">
			<img src="/images/birds-facing-right.jpg" />
		</div>
		<div class="quiz-content" >
			<h1>Quiz</h1>
			<h4>Let's see if we can help you find your friend!</h4>
			<form:form action="/quiz/process" method="post" modelAttribute="pet">
				<h5><b>Question 1</b> What is your favorite animal?</h5>
				<div class="flex" >
					<div class="flex-option">
						<h6>A)</h6>
						<form:radiobutton path="answer" value="cat"/>
						<label for="cat">Cat</label>
					</div>
				</div>
				
				<input type="submit" class="btn btn-primary" value="Submit" />
			</form:form>
		</div>
		<div class="quiz-column">
			<img src="/images/dog-facing-left.jpg" />
		</div>
	</div>
</body>
</html>