<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rental Packages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Available Rental Packages</h2>
        <table class="table table-bordered mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Package ID</th>
                    <th>Package Name</th>
                    <th>Description</th>
                    <th>Price ($)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="package" items="${packageList}">
                    <tr>
                        <td>${package.id}</td>
                        <td>${package.name}</td>
                        <td>${package.description}</td>
                        <td>${package.price}</td>
                        <td>
                            <a href="viewPackage.jsp?id=${package.id}" class="btn btn-primary btn-sm">View</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
