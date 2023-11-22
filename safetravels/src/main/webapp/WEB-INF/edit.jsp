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
    <title>expenses</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container-sm mt-5 w-50">

        <h2 class="text-success">Edit an expense</h2>
        
        <form:form action="/expenses/update/${expense.id}" method="POST" modelAttribute="expense">
            <input type="hidden" name="_method" value="put">
            <div class="form-group mb-3">
                <form:label path="name">Expense Name</form:label>
                <form:input path="name" class="form-control" value="${expense.name}"/>
                <form:errors path="name" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="vendor">Vendor</form:label>
                <form:input class="form-control" path="vendor" value="${expense.vendor}"/>
                <form:errors path="vendor" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="amount">Amount</form:label>
                <form:input class="form-control" path="amount" value="${expense.amount}"/>
                <form:errors path="amount" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="description">Description</form:label>
                <form:input class="form-control" path="description" value="${expense.description}"/>
                <form:errors path="description" class="text-danger fst-italic"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
        
    </div>
</body>
</html>