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
    <div class="container w-75 bg-light border-dark vh-100 p-5">

        <div class="d-flex justify-content-between align-items-center mb-5">
            <h1><c:out value="${book.title}"/></h1>
            <a href="/books"><button class="btn btn-outline-dark">HOME</button></a>
        </div>

        <div class="d-flex mb-5">
            <c:choose>
                <c:when test="${userId == book.user.id}">
                    <h3><span class="text-success">You</span> read <span class="fw-bold"><c:out value="${book.title}"/></span> by <span class="text-primary"><c:out value="${book.author}"/></span>.</h3>
                </c:when>
                <c:otherwise>
                    <h3><span class="text-success"><c:out value="${book.user.userName}"/></span> read <span class="fw-bold"><c:out value="${book.title}"/></span> by <span class="text-primary"><c:out value="${book.author}"/></span>.</h3>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="mb-5">
            <c:choose>
                <c:when test="${userId == book.user.id}">
                    <h4>Here are your thoughts:</h4>
                    <br>
                    <p class="mx-5 fst-italic fs-5">>>>> <c:out value="${book.comment}"/> </p>
                </c:when>
                <c:otherwise>
                    <h4>Here are <c:out value="${book.user.userName}"/>'s thoughts:</h4>
                    <br>
                    <p class="mx-5 fst-italic fs-5">>>>> <c:out value="${book.comment}"/> </p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="d-flex justify-content-end">
            <c:if test="${userId == book.user.id}">            
                <a href="/books/edit/${book.id}" class="btn btn-warning me-5">Edit</a>
                <form action="/books/delete/${book.id}" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <input class="btn btn-danger" type="submit" value="Delete">
                </form>
            </c:if>
        </div>

    </div>
</body>
</html>