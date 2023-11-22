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
    <title>Dojos and Ninjas</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container-sm mt-5 w-75">
        <div class="mb-5 d-flex justify-content-between align-items-center">
            <h1>Dojos and Ninjas</h1>
            <a href="/ninjas"><button class="btn btn-primary">Add a new Ninja</button></a>
        </div>

        <form:form class="mb-5" method="post" action="/dojos/adding" modelAttribute="dojo">
            <div class="form-group mb-3">
                <form:label path="location" class="fw-bold">Location:</form:label>
                <form:input path="location" class="form-control"/>
                <form:errors path="location" class="errors"></form:errors>
            </div>
            <button class="btn btn-primary" type="submit">Create</button>
        </form:form>

        <table class="table table-hover table-light rounded-5">
            <thead>
                <tr class="table-secondary">
                    <th>Location</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dojo" items="${dojos}">
                    <tr>
                        <td><c:out value="${dojo.location}"></c:out></td>
                        <td>
                            <a href='/dojos/${dojo.id}'>See students</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </div>
</body>
</html>