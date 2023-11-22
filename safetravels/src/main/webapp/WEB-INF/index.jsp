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
    <title>Safe Travels</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
   <div class="container mt-3 w-50">
        <h1 class="mb-3 d-flex justify-content-center text-primary">Safe Travels</h1>

        <table class="table">
            <thead>
                <tr>
                    <th>Expense</th>
                    <th>Vendor</th>
                    <th>Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="expense" items="${expenses}">
                    <tr>
                        <td><a href="/expenses/show/${expense.id}"><c:out value="${expense.name}"/></a></td>
                        <td><c:out value="${expense.vendor}"/></td>
                        <td>💲 <c:out value="${expense.amount}"/></td>
                        <td class="d-flex justify-content-between">
                            <a href="/expenses/edit/${expense.id}"><button class="btn btn-warning">Edit</button></a>
                            <form action="/expenses/delete/${expense.id}" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="Delete" class="btn btn-danger text-white">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <form:form action="/expenses/adding" method="post" modelAttribute="expense">
            <h3 class="text-primary">Add an expense</h3>
            <div class="form-group mb-3">
                <form:label path="name">Expense Name</form:label>
                <form:input path="name" class="form-control"/>
                <form:errors path="name" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="vendor">Vendor</form:label>
                <form:input class="form-control" path="vendor"/>
                <form:errors path="vendor" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="amount">Amount</form:label>
                <form:input class="form-control" path="amount"/>
                <form:errors path="amount" class="text-danger fst-italic"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="description">Description</form:label>
                <form:input class="form-control" path="description"/>
                <form:errors path="description" class="text-danger fst-italic"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>

   </div>
</body>
</html>