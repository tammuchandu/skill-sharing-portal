<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Skill Sharing Portal</title>

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

<div class="container mt-5 text-center">

    <h1 class="mb-4">
        Skill Sharing Portal
    </h1>

    <p class="mb-5">
        Learn and Share Skills
    </p>

    <div class="row justify-content-center">

        <!-- VIEW SKILLS -->

        <div class="col-md-4">

            <div class="card shadow p-4">

                <h3>
                    View Skills
                </h3>

                <p>
                    Explore all skills shared by users
                </p>

                <!-- AUTH REQUIRED PAGE -->

                <a href="/skillSeekerAuthentication"
                   class="btn btn-primary">

                    Show Skills

                </a>

            </div>

        </div>

        <!-- ADD SKILL -->

        <div class="col-md-4">

            <div class="card shadow p-4">

                <h3>
                    Add Skill
                </h3>

                <p>
                    Add your own skill information
                </p>

                <!-- FIXED HERE -->

                <a href="/skilledAuthentication"
                   class="btn btn-success">

                    Add Skill

                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>