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
    <title>Add Ninja</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container-sm mt-5 w-25 bg-primary p-5 rounded-5">

        <h2 class="mb-3">Add a Ninja to a Dojo</h2>

        <form:form action="/ninja/adding" method="POST" modelAttribute="ninja">
            
            <div class="form-group mb-3">
                <form:label path="dojo">Ninja's Dojo</form:label>
                <form:select path="dojo" class="form-select" placeholder="Select the Dojo">
                    <option value="">Select a Dojo</option>
                    <c:forEach var="dojo" items="${dojos}">
                        <option value="${dojo.id}">${dojo.location}</option>
                    </c:forEach>
                </form:select>
            </div>

            <div class="form-group mb-3">
                <form:label path="firstName">First Name</form:label>
                <form:input path="firstName" class="form-control" placeholder="Enter the ninja's First Name"/>
                <form:errors path="firstName"/>
            </div>

            <div class="form-group mb-3">
                <form:label path="lastName">Last Name</form:label>
                <form:input path="lastName" class="form-control" placeholder="Enter the ninja's Last Name"/>
                <form:errors path="lastName"/>
            </div>

            <div class="form-group mb-3">
                <form:label path="age">Age</form:label>
                <form:input path="age" class="form-control" placeholder="Enter the ninja's age"/>
                <form:errors path="age"/>
            </div>

            <button type="submit" class="btn btn-outline-dark ">Add</button>

        </form:form >
    </div>
</body>
</html>