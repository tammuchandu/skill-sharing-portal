<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>My Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

body{
    background:#eef2f7;
    font-family:Arial,sans-serif;
}

/* HEADER */

.top-header{
    background:#ffffff;
    padding:18px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid #dbe2ea;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.logo-title{
    font-size:32px;
    font-weight:800;
    color:#0f172a;
}

/* PROFILE CARD */

.profile-card{
    background:linear-gradient(135deg,#0f172a,#1e293b);
    border-radius:24px;
    padding:30px;
    margin-top:30px;
    color:white;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
}

.profile-name{
    font-size:30px;
    font-weight:700;
}

.profile-info{
    margin-top:15px;
    line-height:30px;
    color:#e2e8f0;
}

/* PROFILE EDIT FORM */

.profile-edit-form{
    background:#ffffff;
    color:#0f172a;
    border-radius:18px;
}

/* CARD */

.card-box{
    background:white;
    border-radius:24px;
    padding:35px;
    margin-top:30px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

/* SKILL CARD */

.skill-card{
    background:#f8fafc;
    border-radius:22px;
    padding:25px;
    margin-bottom:30px;
    border:1px solid #e2e8f0;
}

.skill-category{
    display:inline-block;
    background:#2563eb;
    color:white;
    padding:6px 14px;
    border-radius:30px;
    font-size:13px;
    font-weight:600;
}

.skill-title{
    font-size:26px;
    font-weight:800;
    color:#0f172a;
    margin-top:15px;
}

.skill-description{
    margin-top:12px;
    color:#475569;
    line-height:28px;
}

/* MEDIA */

.media-wrapper{
    display:flex;
    flex-direction:column;
    align-items:center;
    margin-top:20px;
}

.skill-video{
    width:100%;
    max-width:520px;
    height:300px;
    object-fit:cover;
    border-radius:18px;
    background:black;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
}

.skill-img{
    width:100%;
    max-width:420px;
    height:250px;
    object-fit:cover;
    border-radius:18px;
    margin-top:18px;
    background:white;
    border:4px solid white;
    box-shadow:0 4px 15px rgba(0,0,0,0.12);
}

/* IMAGE BUTTONS */

.image-buttons{
    margin-top:15px;
    display:flex;
    align-items:center;
    gap:12px;
}

/* PAGINATION */

.pagination .page-link{
    border-radius:10px;
    margin:0 4px;
}

.readonly-field{
    background:#e9ecef !important;
    cursor:not-allowed;
}

.edit-skill-form{
    display:none;
    margin-top:25px;
    background:#f1f5f9;
    padding:20px;
    border-radius:18px;
}

</style>

</head>

<body>

<!-- HEADER -->

<div class="top-header">

    <div class="logo-title">

        Skills Portal

    </div>

    <a href="/home"
       class="btn btn-dark">

        <i class="bi bi-house-fill"></i>

        Home

    </a>

</div>

<div class="container pb-5">

<!-- SUCCESS MESSAGE -->

<c:if test="${not empty successMessage}">

    <div class="alert alert-success mt-4">

        ${successMessage}

    </div>

    <c:remove var="successMessage"
              scope="session"/>

</c:if>

<!-- ERROR MESSAGE -->

<c:if test="${not empty errorMessage}">

    <div class="alert alert-danger mt-4">

        ${errorMessage}

    </div>

    <c:remove var="errorMessage"
              scope="session"/>

</c:if>

<!-- PROFILE -->

<div class="profile-card">

    <div class="profile-name">

        👤 ${user.fullName}

    </div>

    <div class="profile-info">

        <div>

            <strong>Email :</strong>

            ${user.email}

        </div>

        <div>

            <strong>Phone :</strong>

            ${user.phone}

        </div>

        <c:if test="${user.provider != 'GOOGLE'}">

            <div>

                <strong>Username :</strong>

                ${user.username}

            </div>

        </c:if>

        <div>

            <strong>Account ID :</strong>

            ${user.accountId}

        </div>

    </div>

    <!-- PROFILE BUTTONS -->

    <div class="mt-4 d-flex gap-2">

        <button class="btn btn-warning btn-sm"
                onclick="toggleProfileEdit()">

            <i class="bi bi-pencil-square"></i>

            Edit Profile

        </button>

        <form action="/deleteProfile"
              method="post"
              onsubmit="return confirmDeleteProfile();">

            <button class="btn btn-danger btn-sm">

                <i class="bi bi-trash"></i>

                Delete Profile

            </button>

        </form>

    </div>

    <!-- PROFILE EDIT FORM -->

    <div id="profileEditForm"
         class="profile-edit-form mt-4 p-4"
         style="display:none;">

        <form action="/updateProfile"
              method="post">

            <input type="hidden"
                   name="id"
                   value="${user.id}">

            <input type="hidden"
                   name="password"
                   value="${user.password}">

            <input type="hidden"
                   name="provider"
                   value="${user.provider}">

            <input type="hidden"
                   name="providerId"
                   value="${user.providerId}">

            <label class="fw-bold mt-2">

                Full Name

            </label>

            <input type="text"
                   name="fullName"
                   value="${user.fullName}"
                   class="form-control mt-1">

            <label class="fw-bold mt-3">

                Email

            </label>

            <input type="email"
                   name="email"
                   value="${user.email}"
                   class="form-control mt-1">

            <label class="fw-bold mt-3">

                Phone

            </label>

            <input type="text"
                   name="phone"
                   value="${user.phone}"
                   class="form-control mt-1">

            <c:if test="${user.provider != 'GOOGLE'}">

                <label class="fw-bold mt-3">

                    Username

                </label>

                <input type="text"
                       name="username"
                       value="${user.username}"
                       class="form-control mt-1 readonly-field"
                       readonly>

            </c:if>

            <label class="fw-bold mt-3">

                Account ID

            </label>

            <input type="text"
                   name="accountId"
                   value="${user.accountId}"
                   class="form-control mt-1">

            <button class="btn btn-success w-100 mt-4">

                <i class="bi bi-check-circle"></i>

                Save Changes

            </button>

        </form>

    </div>

</div>

<!-- SKILLS SECTION -->

<div class="card-box">

    <!-- TOP HEADING -->

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>

            <h2 class="fw-bold mb-1">

                🎯 My Skills

            </h2>

            <small class="text-muted">

                Manage your uploaded skills, videos and images

            </small>

        </div>

        <span class="badge bg-primary fs-6 px-3 py-2">

            Total Skills :
            ${skillsPage.totalElements}

        </span>

    </div>

    <c:forEach var="skill"
               items="${skills}">

        <div class="skill-card">

            <!-- SKILL HEADER -->

            <div class="d-flex justify-content-between align-items-start flex-wrap">

                <div>

                    <div class="skill-category mb-2">

                        ${skill.category}

                    </div>

                    <div class="skill-title">

                        ${skill.title}

                    </div>

                </div>

                <div class="text-end mt-2">

                    <small class="text-muted fw-bold">

                        Skill ID :
                        ${skill.id}

                    </small>

                </div>

            </div>

            <!-- DESCRIPTION -->

            <div class="mt-4">

                <h6 class="fw-bold text-dark">

                    <i class="bi bi-card-text"></i>

                    Description

                </h6>

                <div class="skill-description">

                    ${skill.description}

                </div>

            </div>

            <!-- MEDIA -->

            <div class="mt-4">

                <h6 class="fw-bold text-dark mb-3">

                    <i class="bi bi-images"></i>

                    Skill Media

                </h6>

                <div class="media-wrapper">

                    <c:if test="${not empty skill.videoUrl}">

                        <video controls
                               class="skill-video">

                            <source src="${skill.videoUrl}"
                                    type="video/mp4">

                        </video>

                    </c:if>

                    <img id="img-${skill.id}"
                         class="skill-img"/>

                    <div class="image-buttons">

                        <button type="button"
                                class="btn btn-dark btn-sm"
                                onclick="prevImage('${skill.id}')">

                            <i class="bi bi-arrow-left"></i>

                            Prev

                        </button>

                        <span id="page-${skill.id}"
                              class="badge bg-primary">

                            1 / 1

                        </span>

                        <button type="button"
                                class="btn btn-dark btn-sm"
                                onclick="nextImage('${skill.id}')">

                            Next

                            <i class="bi bi-arrow-right"></i>

                        </button>

                    </div>

                </div>

            </div>

            <!-- ACTIONS -->

            <div class="mt-4">

                <h6 class="fw-bold text-dark mb-3">

                    <i class="bi bi-gear-fill"></i>

                    Skill Actions

                </h6>

                <div class="d-flex gap-2 flex-wrap">

                    <button class="btn btn-primary btn-sm"
                            type="button"
                            onclick="toggleEdit('${skill.id}')">

                        <i class="bi bi-pencil-square"></i>

                        Edit Skill

                    </button>

                    <form action="/deleteSkill"
                          method="post"
                          onsubmit="return confirmDeleteSkill();">

                        <input type="hidden"
                               name="id"
                               value="${skill.id}">

                        <button class="btn btn-danger btn-sm">

                            <i class="bi bi-trash"></i>

                            Delete Skill

                        </button>

                    </form>

                </div>

            </div>

            <!-- EDIT FORM -->

            <div id="edit-${skill.id}"
                 class="edit-skill-form">

                <h5 class="fw-bold mb-4">

                    ✏ Edit Skill Details

                </h5>

                <form action="/updateSkill"
                      method="post"
                      enctype="multipart/form-data">

                    <input type="hidden"
                           name="id"
                           value="${skill.id}">

                    <label class="fw-bold mt-2">

                        Skill Title

                    </label>

                    <input type="text"
                           name="title"
                           value="${skill.title}"
                           class="form-control mt-1"
                           required>

                    <label class="fw-bold mt-3">

                        Category

                    </label>

                    <input type="text"
                           name="category"
                           value="${skill.category}"
                           class="form-control mt-1"
                           required>

                    <label class="fw-bold mt-3">

                        Description

                    </label>

                    <textarea name="description"
                              rows="4"
                              class="form-control mt-1"
                              required>${skill.description}</textarea>

                    <label class="fw-bold mt-3">

                        Upload Image 1

                    </label>

                    <input type="file"
                           name="image1"
                           class="form-control mt-1">

                    <label class="fw-bold mt-3">

                        Upload Image 2

                    </label>

                    <input type="file"
                           name="image2"
                           class="form-control mt-1">

                    <label class="fw-bold mt-3">

                        Upload Image 3

                    </label>

                    <input type="file"
                           name="image3"
                           class="form-control mt-1">

                    <label class="fw-bold mt-3">

                        Upload Video

                    </label>

                    <input type="file"
                           name="videoFile"
                           class="form-control mt-1">

                    <button class="btn btn-success w-100 mt-4">

                        <i class="bi bi-check-circle"></i>

                        Save Changes

                    </button>

                </form>

            </div>

        </div>

    </c:forEach>

    <!-- PAGINATION -->

    <div class="d-flex justify-content-center mt-4">

        <c:if test="${skillsPage.totalPages > 1}">

            <nav>

                <ul class="pagination">

                    <c:if test="${skillsPage.number > 0}">

                        <li class="page-item">

                            <a class="page-link"
                               href="/profile?page=${skillsPage.number - 1}">

                                Prev

                            </a>

                        </li>

                    </c:if>

                    <c:forEach begin="0"
                               end="${skillsPage.totalPages - 1}"
                               var="i">

                        <li class="page-item ${i == skillsPage.number ? 'active' : ''}">

                            <a class="page-link"
                               href="/profile?page=${i}">

                                ${i + 1}

                            </a>

                        </li>

                    </c:forEach>

                    <c:if test="${skillsPage.number < skillsPage.totalPages - 1}">

                        <li class="page-item">

                            <a class="page-link"
                               href="/profile?page=${skillsPage.number + 1}">

                                Next

                            </a>

                        </li>

                    </c:if>

                </ul>

            </nav>

        </c:if>

    </div>

</div>

</div>

<!-- SCRIPT -->

<script>

function toggleProfileEdit(){

    let form =
        document.getElementById(
            "profileEditForm"
        );

    form.style.display =
        form.style.display === "block"
        ? "none"
        : "block";
}

function toggleEdit(id){

    let form =
        document.getElementById(
            "edit-" + id
        );

    form.style.display =
        form.style.display === "block"
        ? "none"
        : "block";
}

function confirmDeleteProfile(){

    return confirm(
        "Are you sure you want to delete your profile?"
    );
}

function confirmDeleteSkill(){

    return confirm(
        "Are you sure you want to delete this skill?"
    );
}

/* IMAGE SYSTEM */

let images = {};

let indexMap = {};

<c:forEach var="skill"
           items="${skills}">

images['${skill.id}'] = [];

<c:if test="${not empty skill.image1}">
images['${skill.id}'].push('/skills/image1/${skill.id}');
</c:if>

<c:if test="${not empty skill.image2}">
images['${skill.id}'].push('/skills/image2/${skill.id}');
</c:if>

<c:if test="${not empty skill.image3}">
images['${skill.id}'].push('/skills/image3/${skill.id}');
</c:if>

indexMap['${skill.id}'] = 0;

</c:forEach>

window.onload = function(){

    for(let id in images){

        loadImage(id);
    }
};

function loadImage(id){

    let img =
        document.getElementById(
            "img-" + id
        );

    let page =
        document.getElementById(
            "page-" + id
        );

    if(images[id].length > 0){

        img.src =
            images[id][indexMap[id]];

        page.innerText =
            (indexMap[id] + 1)
            + " / "
            + images[id].length;

    }else{

        img.style.display = "none";

        page.innerText = "0 / 0";
    }
}

function nextImage(id){

    if(images[id].length === 0)
        return;

    indexMap[id] =
        (indexMap[id] + 1)
        % images[id].length;

    loadImage(id);
}

function prevImage(id){

    if(images[id].length === 0)
        return;

    indexMap[id] =
        (indexMap[id] - 1 + images[id].length)
        % images[id].length;

    loadImage(id);
}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>