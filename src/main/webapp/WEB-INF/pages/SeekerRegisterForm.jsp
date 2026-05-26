<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seeker Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
.error-text {
    color: red;
    font-size: 13px;
}
</style>

</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-6">

<div class="card shadow p-4">

<h3 class="text-center mb-4">Seeker Register</h3>

<!-- Success / Error Message -->
<c:if test="${not empty message}">
    <div class="alert alert-info text-center">
        ${message}
    </div>
</c:if>

<!-- ✅ IMPORTANT FIX: use form:form -->
<form:form modelAttribute="user"
           action="${pageContext.request.contextPath}/SeekerRegisterFormSubmit"
           method="post">

    <!-- FULL NAME -->
    <form:input path="fullName"
                cssClass="form-control mb-1"
                placeholder="Enter Full Name"/>
    <form:errors path="fullName" cssClass="error-text"/>

    <br/>

    <!-- ACCOUNT ID -->
    <form:input path="accountId"
                cssClass="form-control mb-1"
                placeholder="Create Account ID"/>
    <form:errors path="accountId" cssClass="error-text"/>

    <br/>

    <!-- EMAIL -->
    <form:input path="email"
                cssClass="form-control mb-1"
                placeholder="Enter Email"/>
    <form:errors path="email" cssClass="error-text"/>

    <br/>

    <!-- PHONE -->
    <form:input path="phone"
                cssClass="form-control mb-1"
                placeholder="Enter 10-digit Phone Number"/>
    <form:errors path="phone" cssClass="error-text"/>

    <br/>

    <!-- PASSWORD -->
    <form:password path="password"
                   cssClass="form-control mb-1"
                   placeholder="Create Password"/>
    <form:errors path="password" cssClass="error-text"/>

    <br/>

    <button type="submit" class="btn btn-success w-100">
        Register
    </button>

</form:form>

<div class="text-center mt-3">
    <a href="${pageContext.request.contextPath}/">
        Back
    </a>
</div>

</div>
</div>
</div>
</div>

</body>
</html>