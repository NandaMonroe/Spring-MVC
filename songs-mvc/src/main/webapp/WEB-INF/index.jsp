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
        <div class="mb-5 d-flex justify-content-between align-items-center">
            <h1>Song List</h1>
            <a href="/songs/add"><button class="btn btn-success">Add a song</button></a>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Artist</th>
                    <th>Title</th>
                    <th>Rating</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="song" items="${songs}">
                    <tr>
                        <td><c:out value="${song.id}"></c:out></td>
                        <td><c:out value="${song.artist}"></c:out></td>
                        <td><c:out value="${song.title}"></c:out></td>
                        <td><c:out value="${song.rating}"></c:out> ⭐</td>
                        <td>
                            <a href="/songs/show/${song.id}">Show</a>
                            <a href="/songs/edit/${song.id}">Edit</a>
                            <form action="/songs/delete/${song.id}" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="Delete" class="btn">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </div>
</body>
</html>