<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Skilled Login</title>

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
                    Skilled Login
                </h3>

                <!-- LOGIN FORM -->
                <form action="${pageContext.request.contextPath}/skilledloginFromSubmit"
                      method="post">

                    <!-- ACCOUNT ID (FIXED) -->
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

                    <button type="submit"
                            class="btn btn-primary w-100">
                        Login
                    </button>

                </form>

                <!-- ERROR -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3 text-center">
                        ${error}
                    </div>
                </c:if>

                <!-- LINKS -->
                <div class="text-center mt-3">

                    <a href="${pageContext.request.contextPath}/skilledRegisterForm">
                        Create new account
                    </a>

                    |

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