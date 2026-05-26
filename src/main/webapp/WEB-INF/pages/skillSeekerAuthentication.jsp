<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seeker Authentication</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg, #f1f8ff, #f8f9fa);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: "Segoe UI", sans-serif;
}

/* wrapper */
.auth-wrapper{
    width: 100%;
    max-width: 900px;
}

/* title */
.title{
    font-size: 34px;
    font-weight: 800;
    color: #198754;
    margin-bottom: 40px;
}

/* card design */
.card{
    border: none;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    padding: 30px;
    background: #fff;
}

.card:hover{
    transform: translateY(-6px);
    box-shadow: 0 12px 35px rgba(0,0,0,0.12);
}

/* text */
.card h4{
    font-weight: 700;
    margin-bottom: 10px;
}

.card p{
    color: #6c757d;
    margin-bottom: 20px;
}

/* buttons */
.btn{
    border-radius: 10px;
    padding: 10px;
    font-weight: 600;
}

/* google button spacing */
.divider{
    margin: 15px 0;
    text-align: center;
    color: #aaa;
    position: relative;
}

.divider::before,
.divider::after{
    content: "";
    position: absolute;
    top: 50%;
    width: 40%;
    height: 1px;
    background: #ddd;
}

.divider::before{ left: 0; }
.divider::after{ right: 0; }

</style>

</head>

<body>

<div class="auth-wrapper text-center">

    <div class="title">
        <i class="bi bi-search text-success"></i>
        Skill Seeker Portal
    </div>

    <div class="row g-4 justify-content-center">

        <!-- LOGIN -->
        <div class="col-md-5">

            <div class="card">

                <h4>
                    <i class="bi bi-box-arrow-in-right text-primary"></i>
                    Login
                </h4>

                <p>Already have an account?</p>

                <a href="/SeekerloginFrom" class="btn btn-primary w-100">
                    Login
                </a>

            </div>

        </div>

        <!-- REGISTER -->
        <div class="col-md-5">

            <div class="card">

                <h4>
                    <i class="bi bi-person-plus-fill text-success"></i>
                    Register
                </h4>

                <p>Create new account</p>

                <a href="/SeekerRegisterForm" class="btn btn-success w-100">
                    Register
                </a>

                <div class="divider">OR</div>

                <a href="/login/google/seeker"
                   class="btn btn-danger w-100">
                    <i class="bi bi-google"></i>
                    Login With Google
                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>