<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authentication</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg, #e3f2fd, #f8f9fa);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: "Segoe UI", sans-serif;
}

/* main container */
.auth-wrapper{
    width: 100%;
    max-width: 900px;
}

/* header */
.title{
    font-size: 36px;
    font-weight: 800;
    color: #0d6efd;
    margin-bottom: 40px;
}

/* cards */
.card{
    border: none;
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    padding: 30px;
    background: #fff;
}

.card:hover{
    transform: translateY(-5px);
    box-shadow: 0 12px 35px rgba(0,0,0,0.12);
}

/* headings */
.card h4{
    font-weight: 700;
    margin-bottom: 10px;
}

/* text */
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

.btn-primary{
    background: #0d6efd;
}

.btn-success{
    background: #198754;
}

.btn-danger{
    background: #dc3545;
}

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
        <i class="bi bi-lightbulb-fill text-warning"></i>
        Skill Sharing Portal
    </div>

    <div class="row g-4 justify-content-center">

        <!-- LOGIN CARD -->
        <div class="col-md-5">

            <div class="card">

                <h4>
                    <i class="bi bi-box-arrow-in-right text-primary"></i>
                    Login
                </h4>

                <p>Already have an account?</p>

                <a href="/skilledloginFrom" class="btn btn-primary w-100">
                    Login
                </a>

            </div>

        </div>

        <!-- REGISTER CARD -->
        <div class="col-md-5">

            <div class="card">

                <h4>
                    <i class="bi bi-person-plus-fill text-success"></i>
                    Register
                </h4>

                <p>Create a new account</p>

                <a href="/skilledRegisterForm" class="btn btn-success w-100">
                    Register
                </a>

                <div class="divider">OR</div>

                <a href="/login/google/skilled"
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