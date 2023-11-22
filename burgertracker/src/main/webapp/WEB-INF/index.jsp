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
    <title>Burger</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
   <div class="container mt-3 w-50">
        <h1 class="mb-3 d-flex justify-content-center">Burger Tracker</h1>

        <table class="table">
            <thead>
                <tr>
                    <th>Burger Name</th>
                    <th>Restaurant Name</th>
                    <th>Rating</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="burger" items="${burgers}">
                    <tr>
                        <td><c:out value="${burger.name}"/></td>
                        <td><c:out value="${burger.restaurant}"/></td>
                        <td><c:out value="${burger.rating}"/> ⭐</td>
                        <td>
                            <a href="/burgers/show/${burger.id}">Show</a>
                            <a href="/burgers/edit/${burger.id}">Edit</a>
                            <a href="/burgers/delete/${burger.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <form:form action="/burgers/adding" method="post" modelAttribute="burger">
            <h3>Add a burger</h3>
            <div class="form-group mb-3">
                <form:label path="name">Burger Name</form:label>
                <form:input path="name" class="form-control"/>
                <form:errors path="name" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="restaurant">Restaurant Name</form:label>
                <form:input class="form-control" path="restaurant"/>
                <form:errors path="restaurant" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="rating">Burger Rate</form:label>
                <form:input class="form-control" path="rating"/>
                <form:errors path="rating" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="notes">Notes</form:label>
                <form:input class="form-control" path="notes" placeholder="Please write a note about it"/>
                <form:errors path="notes" class="text-danger fst-italic"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>

   </div>
</body>
</html>