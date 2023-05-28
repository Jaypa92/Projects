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
<title>Pet-Fo | Posts</title>
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
		<h1>User Posts</h1>
	</div>
	<div class="centered-text" >
			<c:forEach var="pet" items="${pets}" >
				<c:if test="${pet.breed == breed}" >
					<div class="posts" >
						<div class="posts-flex" >
							<h5><a href="/view/${pet.id}" ><c:out value="${pet.breed}" /> <c:out value="${pet.type}" /> by <c:out value="${pet.user.name}"/></a></h5>
							<h6>Rating: <c:out value="${pet.rating}" /></h6>
						</div>
						<p><c:out value="${pet.description}" /></p>
					</div>				
				</c:if>
			</c:forEach>
	</div>
</body>
</html>