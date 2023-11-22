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
    <div class="container-sm">
        <div class="text-center mt-3 mb-3 fw-bold">
            <h1 class="fw-bold">Welcome</h1>
        </div>
    
        <div class="d-flex" style="height: 85vh;">
    
            <div class="container w-25 d-flex justify-content-center align-items-center bg-warning rounded-5">
                
                <form:form action="/register" method="POST" modelAttribute="newUser" class="col-10">
                    <h1 class="text-white mt-3">Registration</h1>
    
                    <div class="form-group mb-2">
                        <form:label path="userName" class="text-white">Username:</form:label>
                        <form:input path="userName" class="form-control"/>
                        <form:errors path="userName" class="errors"></form:errors>
                    </div>
    
                    <div class="form-group mb-2">
                        <form:label path="email" class="text-white">Email:</form:label>
                        <form:input path="email" type="email" class="form-control"/>
                        <form:errors path="email" class="errors"></form:errors>
                    </div>
    
                    <div class="form-group mb-2">
                        <form:label path="password" class="text-white">Password:</form:label>
                        <form:input path="password" type="password" class="form-control"/>
                        <form:errors path="password" class="errors"></form:errors>
                    </div>
    
                    <div class="form-group mb-2">
                        <form:label path="confirm" class="text-white">Confirm Password:</form:label>
                        <form:input path="confirm" type="password" class="form-control"/>
                        <form:errors path="confirm" class="errors"></form:errors>
                    </div>
    
                    <div class="col-12">
                        <button type="submit" class="btn btn-success btn-outline-secondary text-light border-black">Register</button>
                    </div>
    
                </form:form>
            </div>
    
            <div class="container w-25 d-flex justify-content-center align-items-center bg-warning  rounded-5">
                
                <form:form action="/login" method="POST" modelAttribute="newLogin" class="col-10">
                    <h1 class="text-white">Login</h1>
    
                    <div class="form-group mb-3">
                        <form:label path="email" class="text-white">Email:</form:label>
                        <form:input path="email" type="email" class="form-control"/>
                    </div>
    
                    <div class="form-group mb-3">
                        <form:label path="password" class="text-white">Password:</form:label>
                        <form:input path="password" type="password" class="form-control"/>
                    </div>
    
                    <div class="col-12">
                        <button href="/dashboard/"  type="submit" class="btn btn-dark btn-outline-secondary text-light border-black">Login</button>
                    </div>
    
                </form:form>
            </div>
        </div>

    </div>
</body>
</html>