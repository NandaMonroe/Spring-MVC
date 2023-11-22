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
    <div class="container w-75">

        <div class="d-flex justify-content-between align-items-center mt-5 mb-5">
            <h1 class="fw-bold">Hello, <c:out value="${user.userName}"></c:out>!</h1>
            <a href="/logout"><button class="btn btn-danger text-white">Logout</button></a>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-5 mb-5">
            <h4>Books from everyone's shelf:</h4>
            <a href="/books/add"><button class="btn btn-outline-success">+ Add a book to my shelf</button></a>
        </div>

        <table class="table table-hover border rounded-5">
            <thead class="table-secondary">
                <tr>
                    <td class="ps-4">Likes</td>
                    <td></td>
                    <td>Title</td>
                    <td>Author</td>
                    <td>Posted By</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td class="ps-5"><c:out value="${book.likes.size()}"></c:out></td>
                        <td>
                            <c:choose>
                                <c:when test="${!book.getLikes().contains(user)}">
                                    <a href="/books/like/${book.id}" class="btn btn-outline-success">Like 👍</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/books/dislike/${book.id}" class="btn btn-outline-danger">Dislike 👎</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="/books/show/${book.id}"><c:out value="${book.title}"></c:out></a></td>
                        <td><c:out value="${book.author}"></c:out></td>
                        <td><c:out value="${book.user.userName}"></c:out></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>