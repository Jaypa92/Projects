<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Pet-Fo | Quiz</title>
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
	<div class="quiz-body">
		<h1>Quiz</h1>
		<h4>Let's see if we can help you find your friend!</h4>
		<form:form action="/quiz/process" method="post" modelAttribute="pet">
			<h5>
				<b>Question 1</b> How busy are you?
			</h5>
			<div class="flex">
				<div class="flex-option">
					<h6>A)</h6>
					<form:radiobutton path="answer" value="extreme" />
					<label for="extreme">No Free Time At All</label>
				</div>
				<div class="flex-option">
					<h6>B)</h6>
					<form:radiobutton path="answer" value="medium" />
					<label for="medium">Pretty Busy</label>
				</div>
			</div>
			<div class="flex">
				<div class="flex-option">
					<h6>C)</h6>
					<form:radiobutton path="answer" value="moderate" />
					<label for="moderate">Somewhat Busy</label>
				</div>
				<div class="flex-option">
					<h6>D)</h6>
					<form:radiobutton path="answer" value="free" />
					<label for="free">Never Busy</label>
				</div>
			</div>
			<h5>
				<b>Question 2</b> Would You Say You're Responsible?
			</h5>
			<div class="flex">
				<div class="flex-option">
					<h6>A)</h6>
					<form:radiobutton path="answer2" value="yes" />
					<label for="answer2">Very</label>
				</div>
				<div class="flex-option">
					<h6>B)</h6>
					<form:radiobutton path="answer2" value="very" />
					<label for="yes">Pretty Responsible</label>
				</div>
			</div>
			<div class="flex">
				<div class="flex-option">
					<h6>C)</h6>
					<form:radiobutton path="answer2" value="somewhat" />
					<label for="somewhat">Somewhat Responsible</label>
				</div>
				<div class="flex-option">
					<h6>D)</h6>
					<form:radiobutton path="answer2" value="no" />
					<label for="no">Not Really</label>
				</div>
			</div>
			<div class="input">
				<input style="display:block; margin:0 auto;" type="submit"
					class="btn btn-primary" value="Submit" />
			</div>
		</form:form>
	</div>
</body>
</html>