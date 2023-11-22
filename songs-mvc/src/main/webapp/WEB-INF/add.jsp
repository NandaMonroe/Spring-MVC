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
    <title>Songs</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container-sm mt-5 w-50">

        <h2>Add a song to the List</h2>

        <form:form action="/songs/adding" method="POST" modelAttribute="song">
            <div class="form-group mb-3">
                <form:label path="artist">Artist</form:label>
                <form:input path="artist" class="form-control" placeholder="Enter artist"/>
                <form:errors path="artist"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="title">Title</form:label>
                <form:input path="title" class="form-control" placeholder="Enter title"/>
                <form:errors path="title"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="rating">Rating</form:label>
                <form:input path="rating" class="form-control" placeholder="Enter rating"/>
                <form:errors path="rating"/>
            </div>
            <button type="submit" class="btn btn-success ">Add</button>
        </form:form >
    </div>
</body>
</html>