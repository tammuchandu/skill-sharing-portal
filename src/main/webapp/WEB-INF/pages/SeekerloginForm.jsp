<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Seeker Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
    background:#f5f5f5;
}

.card{
    border:none;
    border-radius:15px;
}

</style>

</head>

<body>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card shadow p-4">

                <h3 class="text-center mb-4">

                    Seeker Login

                </h3>

                <!-- ERROR MESSAGE -->

                <c:if test="${not empty error}">

                    <div class="alert alert-danger text-center">

                        ${error}

                    </div>

                </c:if>

                <!-- LOGIN FORM -->

                <form action="/SeekerloginFormSubmit"
                      method="post">

                    <!-- ACCOUNT ID -->

                    <input type="text"
                           name="accountId"
                           class="form-control mb-3"
                           placeholder="Enter Account ID"
                           required>

                    <!-- PASSWORD -->

                    <input type="password"
                           name="password"
                           class="form-control mb-3"
                           placeholder="Enter Password"
                           required>

                    <!-- BUTTON -->

                    <button type="submit"
                            class="btn btn-primary w-100">

                        Login

                    </button>

                </form>

                <!-- BACK -->

                <div class="text-center mt-3">

                    <a href="/">

                        Back

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>