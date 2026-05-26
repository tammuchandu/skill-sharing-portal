<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.skill.sharing.portal.model.SkillsPeople" %>

<%
SkillsPeople currentUser =
        (SkillsPeople) session.getAttribute("currentUser");

String userId = "";
String fullName = "Guest User";

if (currentUser != null) {

    fullName = currentUser.getFullName();

    if ("GOOGLE".equals(currentUser.getProvider())) {

        userId = currentUser.getProviderId();

    } else {

        userId = currentUser.getUsername();
    }
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Skills Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

body{
    background:#eef2f7;
    font-family:Arial,sans-serif;
}

/* ================= TOP NAVBAR ================= */

.top-bar{
    background:#ffffff;
    padding:20px 35px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 15px rgba(0,0,0,0.06);
    margin-bottom:30px;
}

.logo-title{
    font-size:32px;
    font-weight:800;
    color:#111827;
}

.logo-title i{
    color:#f59e0b;
}

/* ================= PROFILE CARD ================= */

.profile-card{
    background:linear-gradient(135deg,#0f172a,#1e293b);
    border-radius:20px;
    padding:22px 28px;
    margin-bottom:30px;

    display:flex;
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;

    box-shadow:0 6px 20px rgba(0,0,0,0.15);
}

.profile-left{
    display:flex;
    align-items:center;
    gap:18px;
}

/* PROFILE LOGO */

.profile-avatar{
    width:72px;
    height:72px;
    border-radius:50%;

    background:linear-gradient(135deg,#2563eb,#60a5fa);

    display:flex;
    justify-content:center;
    align-items:center;

    color:white;
    font-size:38px;

    box-shadow:0 5px 15px rgba(37,99,235,0.35);
}

.profile-label{
    color:#94a3b8;
    font-size:11px;
    font-weight:700;
    letter-spacing:1px;
    margin-bottom:5px;
}

.profile-name{
    color:white;
    font-size:30px;
    font-weight:800;
    line-height:1.2;
}

.profile-id{
    margin-top:6px;
    color:#dbeafe;
    font-size:14px;
    font-weight:500;
}

.profile-btn{
    border-radius:12px;
    padding:10px 20px;
    font-size:15px;
    font-weight:700;
}

/* ================= SEARCH ================= */

.search-box{
    background:white;
    padding:25px;
    border-radius:20px;
    margin-bottom:35px;
    box-shadow:0 4px 15px rgba(0,0,0,0.06);
}

/* ================= SECTION TITLE ================= */

.section-title{
    background:white;
    padding:20px 25px;
    border-radius:18px;
    margin-bottom:25px;

    display:flex;
    align-items:center;
    gap:12px;

    box-shadow:0 4px 15px rgba(0,0,0,0.06);

    font-size:28px;
    font-weight:800;
    color:#111827;
}

.section-title i{
    color:#2563eb;
}

/* ================= SKILL CARD ================= */

.skill-row{
    background:white;
    border-radius:22px;
    padding:30px;
    margin-bottom:35px;
    box-shadow:0 4px 18px rgba(0,0,0,0.06);
}

/* LABEL */

.label{
    font-size:12px;
    font-weight:700;
    color:#6b7280;
    margin-top:20px;
    margin-bottom:7px;
    text-transform:uppercase;
    letter-spacing:1px;
}

/* TITLE */

.skill-title{
    font-size:32px;
    font-weight:800;
    color:#111827;
}

/* CATEGORY */

.badge-category{
    background:#2563eb;
    color:white;
    padding:8px 16px;
    border-radius:30px;
    font-size:13px;
    font-weight:700;
}

/* CREATOR BOX */

.creator-box{
    background:linear-gradient(135deg,#ff8c00,#ff6b00);
    color:white;
    padding:20px;
    border-radius:18px;
    margin-top:12px;
    margin-bottom:22px;
    max-width:500px;
    box-shadow:0 5px 20px rgba(255,140,0,0.30);
}

.creator-item{
    display:flex;
    align-items:center;
    gap:16px;
}

.creator-icon{
    width:52px;
    height:52px;
    border-radius:50%;
    background:white;
    color:#ff6b00;

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:22px;
}

.creator-label{
    font-size:11px;
    font-weight:700;
    color:#fff3cd;
    text-transform:uppercase;
    letter-spacing:1px;
}

.creator-value{
    font-size:18px;
    font-weight:700;
}

/* CONTACT */

.contact-box{
    background:#f8fafc;
    border-radius:16px;
    padding:20px;
    margin-top:10px;
    border:1px solid #e2e8f0;
}

/* VIDEO */

.video-wrapper{
    width:350px;
    margin-top:10px;
}

.video-box{
    width:100%;
    height:200px;
    border-radius:15px;
    background:black;
}

/* IMAGE */

.carousel-box{
    width:100%;
    max-width:550px;
    margin-top:15px;
}

.carousel{
    border-radius:18px;
    overflow:hidden;
}

.skill-img{
    width:100%;
    height:320px;
    object-fit:cover;
    background:#f8fafc;
}

.carousel-control-prev,
.carousel-control-next{
    width:45px;
    height:45px;
    top:50%;
    transform:translateY(-50%);
    background:rgba(0,0,0,0.55);
    border-radius:50%;
    opacity:1;
}

.carousel-control-prev{
    left:10px;
}

.carousel-control-next{
    right:10px;
}

/* PAGINATION */

.pagination-box{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:14px;
    margin-top:40px;
}

.page-info{
    background:#111827;
    color:white;
    padding:10px 18px;
    border-radius:12px;
    font-weight:700;
}

/* NO DATA */

.no-data{
    background:#fff3cd;
    color:#856404;
    padding:25px;
    border-radius:16px;
    text-align:center;
    font-size:18px;
    font-weight:700;
}

/* ================= MOBILE ================= */

@media(max-width:768px){

    .top-bar{
        padding:15px 20px;
    }

    .logo-title{
        font-size:24px;
    }

    .profile-card{
        gap:20px;
        padding:20px;
    }

    .profile-left{
        flex-direction:column;
        align-items:flex-start;
    }

    .profile-name{
        font-size:24px;
    }

    .profile-avatar{
        width:65px;
        height:65px;
        font-size:32px;
    }

    .video-wrapper{
        width:100%;
    }

    .skill-img{
        height:240px;
    }

    .section-title{
        font-size:22px;
    }
}

</style>

</head>

<body>

<!-- ================= TOP BAR ================= -->

<div class="top-bar">

    <div class="logo-title">

        <i class="bi bi-lightbulb-fill"></i>
        Skills Portal

    </div>

    <a href="/home"
       class="btn btn-dark">

        <i class="bi bi-house-fill"></i>
        Home

    </a>

</div>

<div class="container pb-5">

    <!-- ================= PROFILE CARD ================= -->

    <div class="profile-card">

        <div class="profile-left">

            <div class="profile-avatar">

                <i class="bi bi-person-circle"></i>

            </div>

            <div>

                <div class="profile-label">
                    CURRENT LOGGED IN USER
                </div>

                <div class="profile-name">
                    <%= fullName %>
                </div>

                <div class="profile-id">

                    <i class="bi bi-shield-check"></i>

                    User ID :
                    <%= userId %>

                </div>

            </div>

        </div>

        <div>

            <a href="/profile"
               class="btn btn-light profile-btn">

                <i class="bi bi-person-fill"></i>
                My Account

            </a>

        </div>

    </div>

    <!-- ================= SEARCH ================= -->

    <div class="search-box">

        <form action="/skillspage"
              method="get">

            <div class="row g-3">

                <div class="col-md-9">

                    <input type="text"
                           name="keyword"
                           value="${keyword}"
                           class="form-control form-control-lg"
                           placeholder="Search skill title...">

                </div>

                <div class="col-md-3 d-grid">

                    <button class="btn btn-primary btn-lg">

                        <i class="bi bi-search"></i>
                        Search

                    </button>

                </div>

            </div>

        </form>

    </div>

    <!-- ================= SECTION TITLE ================= -->

    <div class="section-title">

        <i class="bi bi-list-ul"></i>

        List Of Skills

    </div>

    <!-- ================= NO DATA ================= -->

    <c:if test="${empty skills}">

        <div class="no-data">

            <i class="bi bi-search"></i>
            No skills found in database

        </div>

    </c:if>

    <!-- ================= SKILLS ================= -->

    <c:forEach var="s"
               items="${skills}">

        <div class="skill-row">

            <!-- USER DETAILS -->
            <div class="label">
                Uploaded By
            </div>

            <div class="creator-box">

                <div class="creator-item">

                    <div class="creator-icon">

                        <i class="bi bi-person-fill"></i>

                    </div>

                    <div>

                        <div class="creator-label">
                            User ID
                        </div>

                        <div class="creator-value">

                            <c:choose>

                                <c:when test="${s.user.provider == 'GOOGLE'}">

                                    ${s.user.providerId}

                                </c:when>

                                <c:otherwise>

                                    ${s.user.username}

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>

                <div class="creator-item mt-3">

                    <div class="creator-icon">

                        <i class="bi bi-person-badge-fill"></i>

                    </div>

                    <div>

                        <div class="creator-label">
                            Full Name
                        </div>

                        <div class="creator-value">
                            ${s.user.fullName}
                        </div>

                    </div>

                </div>

            </div>

            <!-- CONTACT -->
            <h4 class="fw-bold mt-4">
                Contact Information
            </h4>

            <div class="contact-box">

                <div class="mb-2">

                    <i class="bi bi-envelope-fill text-primary"></i>

                    <strong>Email:</strong>
                    ${s.user.email}

                </div>

                <div>

                    <i class="bi bi-telephone-fill text-success"></i>

                    <strong>Phone:</strong>
                    ${s.user.phone}

                </div>

            </div>

            <!-- CATEGORY -->
            <div class="label">
                Category
            </div>

            <span class="badge-category">
                ${s.category}
            </span>

            <!-- TITLE -->
            <div class="label">
                Title
            </div>

            <div class="skill-title">
                ${s.title}
            </div>

            <!-- DESCRIPTION -->
            <div class="label">
                Description
            </div>

            <div class="text-muted fs-5">
                ${s.description}
            </div>

            <!-- VIDEO -->
            <div class="label">
                Video
            </div>

            <c:choose>

                <c:when test="${not empty s.videoUrl}">

                    <div class="video-wrapper">

                        <video class="video-box"
                               controls>

                            <source src="${s.videoUrl}"
                                    type="video/mp4">

                        </video>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="text-muted">
                        No Video
                    </div>

                </c:otherwise>

            </c:choose>

            <!-- IMAGES -->
            <div class="label">
                Images
            </div>

            <div class="carousel-box">

                <div id="carousel-${s.id}"
                     class="carousel slide"
                     data-bs-ride="false">

                    <!-- INDICATORS -->
                    <div class="carousel-indicators">

                        <c:if test="${not empty s.image1}">
                            <button type="button"
                                    data-bs-target="#carousel-${s.id}"
                                    data-bs-slide-to="0"
                                    class="active">
                            </button>
                        </c:if>

                        <c:if test="${not empty s.image2}">
                            <button type="button"
                                    data-bs-target="#carousel-${s.id}"
                                    data-bs-slide-to="1">
                            </button>
                        </c:if>

                        <c:if test="${not empty s.image3}">
                            <button type="button"
                                    data-bs-target="#carousel-${s.id}"
                                    data-bs-slide-to="2">
                            </button>
                        </c:if>

                    </div>

                    <!-- IMAGES -->
                    <div class="carousel-inner">

                        <c:if test="${not empty s.image1}">

                            <div class="carousel-item active">

                                <img src="/skills/image1/${s.id}"
                                     class="skill-img">

                            </div>

                        </c:if>

                        <c:if test="${not empty s.image2}">

                            <div class="carousel-item">

                                <img src="/skills/image2/${s.id}"
                                     class="skill-img">

                            </div>

                        </c:if>

                        <c:if test="${not empty s.image3}">

                            <div class="carousel-item">

                                <img src="/skills/image3/${s.id}"
                                     class="skill-img">

                            </div>

                        </c:if>

                    </div>

                    <!-- PREVIOUS -->
                    <button class="carousel-control-prev"
                            type="button"
                            data-bs-target="#carousel-${s.id}"
                            data-bs-slide="prev">

                        <span class="carousel-control-prev-icon"></span>

                    </button>

                    <!-- NEXT -->
                    <button class="carousel-control-next"
                            type="button"
                            data-bs-target="#carousel-${s.id}"
                            data-bs-slide="next">

                        <span class="carousel-control-next-icon"></span>

                    </button>

                </div>

            </div>

        </div>

    </c:forEach>

    <!-- ================= PAGINATION ================= -->

    <div class="pagination-box">

        <c:if test="${currentPage > 0}">

            <a href="/skillspage?page=${currentPage - 1}&keyword=${keyword}"
               class="btn btn-outline-primary">

                Previous

            </a>

        </c:if>

        <div class="page-info">

            Page ${currentPage + 1}
            of
            ${totalPages}

        </div>

        <c:if test="${currentPage + 1 < totalPages}">

            <a href="/skillspage?page=${currentPage + 1}&keyword=${keyword}"
               class="btn btn-outline-primary">

                Next

            </a>

        </c:if>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>