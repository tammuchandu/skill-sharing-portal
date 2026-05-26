<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skilled Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body {
    background: #f5f5f5;
}

.card {
    border: none;
    border-radius: 15px;
}

.text-danger {
    font-size: 13px;
}
</style>
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card shadow p-4">

                <h3 class="text-center mb-4">Skilled Register</h3>

                <!-- SUCCESS / INFO MESSAGE -->
                <c:if test="${not empty message}">
                    <div class="alert alert-info text-center">
                        ${message}
                    </div>
                </c:if>

                <!-- SPRING FORM -->
                <form:form action="${pageContext.request.contextPath}/skilledRegisterFormSubmit"
                           method="post"
                           modelAttribute="user">

                    <!-- FULL NAME -->
                    <form:input path="fullName"
                                cssClass="form-control mb-1"
                                placeholder="Enter Full Name"/>
                    <form:errors path="fullName"
                                 cssClass="text-danger d-block mb-2"/>

                    <!-- ACCOUNT ID -->
                    <form:input path="accountId"
                                cssClass="form-control mb-1"
                                placeholder="Create Account ID"/>
                    <form:errors path="accountId"
                                 cssClass="text-danger d-block mb-2"/>

                    <!-- EMAIL -->
                    <form:input path="email"
                                cssClass="form-control mb-1"
                                placeholder="Enter Email"/>
                    <form:errors path="email"
                                 cssClass="text-danger d-block mb-2"/>

                    <!-- PHONE -->
                    <form:input path="phone"
                                cssClass="form-control mb-1"
                                placeholder="Enter 10 digit Phone Number"/>
                    <form:errors path="phone"
                                 cssClass="text-danger d-block mb-2"/>

                    <!-- PASSWORD -->
                    <form:password path="password"
                                   cssClass="form-control mb-1"
                                   placeholder="Create Password"/>
                    <form:errors path="password"
                                 cssClass="text-danger d-block mb-3"/>

                    <!-- SUBMIT -->
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