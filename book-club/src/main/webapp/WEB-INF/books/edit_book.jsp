<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container-sm mt-5 w-75 bg-primary p-5 rounded-5">

        <div class="d-flex justify-content-between">
            <h2 class="mb-3">Edit this book</h2>
            <a href="/books"><button class="btn btn-dark">HOME</button></a>
        </div>

        <form:form action="/books/editing/${book.id}" method="POST" modelAttribute="book">

            <input type="hidden" name="user" value="${userId}"/>
            <input type="hidden" name="_method" value="put">

            <div class="form-group mb-3">
                <form:label path="title">Title:</form:label>
                <form:input path="title" class="form-control"/>
                <form:errors path="title"/>
            </div>

            <div class="form-group mb-3">
                <form:label path="author">Author:</form:label>
                <form:input path="author" class="form-control"/>
                <form:errors path="author"/>
            </div>

            <div class="form-group mb-3">
                <form:label path="comment">My Thoughts:</form:label>
                <form:input path="comment" class="form-control" />
                <form:errors path="comment"/>
            </div>

            <button type="submit" class="btn btn-outline-dark ">Edit</button>

        </form:form >
    </div>
</body>
</html>