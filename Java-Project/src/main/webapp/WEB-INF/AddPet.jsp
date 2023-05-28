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
<title>Insert title here</title>
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
	<h1 class="header2" >Give Us Some "Pet-Fo" About Your Pet!</h1>
	<div class="form" >
		<form:form action="/adding/pet" method="post" modelAttribute="newPet">
			<div class="form-group" >
				<form:label path="type" >Pet Type:</form:label>
				<i><form:errors class="text-danger" path="type" /></i>
				<form:input placeholder="What type of pet do you have?" class="form-control" path="type"/>
			</div>
			<div class="form-group" >
				<form:label path="breed" >Breed:</form:label>
				<i><form:errors class="text-danger" path="breed" /></i>
				<form:input placeholder="What breed is your pet?" class="form-control" path="breed" />
			</div>
			<div class="form-group" >
				<form:label path="gender">Gender:</form:label>
				<i><form:errors class="text-danger" path="gender" /></i>
				<form:input placeholder="What gender is your pet?" class="form-control" path="gender" />
			</div>
			<div class="form-group" >
				<form:label path="rating" >Rating:</form:label>
				<i><form:errors class="text-danger" path="rating" /></i>
				<form:input placeholder="How would you rate this pet type from one to five" class="form-control" path="rating" type="number" />
			</div>
			<div class="form-group" >
				<form:label path="responsibilities" >Responsibilities:</form:label>
				<i><form:errors class="text-danger" path="responsibilities" /></i>
				<form:textarea rows="5" placeholder="What responsibilities come with this pet?" class="form-control" path="responsibilities" />
			</div>
			<div class="form-group" >
				<form:label path="description" >Thoughts:</form:label>
				<i><form:errors class="text-danger" path="description" /></i>
				<form:textarea placeholder="What do you think potential pet owners should know?" class="form-control" path="description" rows="5" />
			</div>
			<input class="btn btn-primary" type="submit" value="Submit" />
		</form:form>
	</div>
</body>
</html>