<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&display=swap" rel="stylesheet">
</head>
<body style="background-color:mediumaquamarine" >
	<div class="header-complete" >
		<img src="/images/test.png"/>
		<h1 class="header" >Pet-Fo</h1>
	</div>
	<div class="center" >
		<div class="form">
			<h1>Log In</h1>
			<form:form action="/loggingin" method="post" modelAttribute="oldUser">
				<div class="form-group">
					<form:label path="email">Email:</form:label>
					<i><form:errors class="text-danger" path="email" /></i>
					<form:input class="form-control" path="email" />
				</div>
				<div class="form-group">
					<form:label path="password">Password:</form:label>
					<i><form:errors class="text-danger" path="password" /></i>
					<form:input class="form-control" type="password" path="password" />
				</div>
				<input class="btn btn-primary" type="submit" value="Log In" />
			</form:form>
			<p>
				If you don't have an account you can also <a href="/register">Sign
					Up</a> or go <a href="/" >Home</a>
			</p>
		</div>
	</div>
</body>
</html>