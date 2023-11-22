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
                    <tr>
                        <td><c:out value="${expense.name}"/></td>
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
            </tbody>
        </table>
    </div>
</body>
</html>