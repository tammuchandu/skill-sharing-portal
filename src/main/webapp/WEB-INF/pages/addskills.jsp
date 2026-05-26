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

    <title>Add Skills</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>

        body{
            background:#eef2f7;
            font-family:Arial,sans-serif;
        }

        /* ================= HEADER ================= */

        .top-header{
            background:#f3f4f6;
            padding:20px 40px;

            display:flex;
            justify-content:space-between;
            align-items:center;

            border-bottom:1px solid #d1d5db;
        }

        .logo-title{
            font-size:34px;
            font-weight:800;
            color:#0f172a;
        }

        .logo-title i{
            color:#f59e0b;
        }

        .home-btn{
            background:#1f2937;
            color:white;

            border:none;
            border-radius:8px;

            padding:10px 18px;

            font-weight:600;
            text-decoration:none;
        }

        .home-btn:hover{
            background:#111827;
            color:white;
        }

        /* ================= PROFILE CARD ================= */

        .profile-card{
            background:linear-gradient(90deg,#0f172a,#1e293b);

            border-radius:22px;

            padding:20px 26px;

            margin-top:30px;
            margin-bottom:35px;

            display:flex;
            justify-content:space-between;
            align-items:center;

            box-shadow:0 8px 22px rgba(0,0,0,0.18);
        }

        .profile-left{
            display:flex;
            align-items:center;
            gap:16px;
        }

        /* PROFILE IMAGE */

        .profile-avatar{
            width:64px;
            height:64px;

            border-radius:50%;

            background:linear-gradient(135deg,#2563eb,#60a5fa);

            display:flex;
            align-items:center;
            justify-content:center;

            color:white;
            font-size:34px;

            box-shadow:0 4px 14px rgba(59,130,246,0.45);
        }

        .profile-label{
            color:#93c5fd;
            font-size:11px;
            font-weight:700;
            letter-spacing:1px;
            margin-bottom:3px;
        }

        .profile-name{
            color:white;
            font-size:18px;
            font-weight:700;
            line-height:1.2;
        }

        .profile-id{
            margin-top:6px;
            color:white;
            font-size:14px;
            font-weight:500;
        }

        .profile-id i{
            color:#dbeafe;
        }

        /* ACCOUNT BUTTON */

        .profile-btn{
            background:#f8fafc;
            border:none;

            color:black;

            border-radius:12px;

            padding:10px 18px;

            font-size:15px;
            font-weight:700;

            text-decoration:none;
        }

        .profile-btn:hover{
            background:white;
            color:black;
        }

        /* ================= FORM CARD ================= */

        .card-box{
            max-width:760px;

            margin:auto;
            margin-bottom:40px;

            background:white;

            border-radius:22px;
            padding:35px;

            box-shadow:0 6px 20px rgba(0,0,0,0.08);
        }

        .page-title{
            text-align:center;
            font-weight:800;
            color:#2563eb;
            margin-bottom:10px;
        }

        .page-subtitle{
            text-align:center;
            color:#6b7280;
            margin-bottom:30px;
            font-size:15px;
        }

        /* ================= FORM ================= */

        .form-label{
            font-weight:700;
            color:#374151;
            margin-bottom:8px;
        }

        .form-control{
            border-radius:12px;
            padding:12px;
            border:1px solid #d1d5db;
        }

        .form-control:focus{
            border-color:#2563eb;
            box-shadow:none;
        }

        /* ================= UPLOAD BOX ================= */

        .upload-box{
            background:#f8fafc;
            border:1px dashed #cbd5e1;
            border-radius:14px;
            padding:16px;
            margin-bottom:18px;
        }

        /* ================= BUTTON ================= */

        .btn-save{
            background:#16a34a;
            border:none;

            padding:14px;

            border-radius:14px;

            font-size:18px;
            font-weight:700;

            transition:0.3s;
        }

        .btn-save:hover{
            background:#15803d;
        }

        /* ================= ALERTS ================= */

        .alert{
            border-radius:14px;
        }

        /* ================= MOBILE ================= */

        @media(max-width:768px){

            .top-header{
                padding:18px;
            }

            .logo-title{
                font-size:24px;
            }

            .profile-card{
                flex-direction:column;
                align-items:flex-start;
                gap:18px;
            }

            .profile-avatar{
                width:58px;
                height:58px;
                font-size:28px;
            }

            .profile-name{
                font-size:16px;
            }

            .profile-id{
                font-size:12px;
            }

            .card-box{
                padding:22px;
            }
        }

    </style>

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="top-header">

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


    <!-- ================= FORM CARD ================= -->

    <div class="card-box">

        <h2 class="page-title">

            <i class="bi bi-lightbulb-fill"></i>
            Add Your Skill

        </h2>

        <p class="page-subtitle">
            Share your talent, creativity and professional skills
        </p>

        <!-- SUCCESS MESSAGE -->

        <c:if test="${not empty success}">

            <div class="alert alert-success">

                ${success}

            </div>

        </c:if>

        <!-- ERROR MESSAGE -->

        <c:if test="${not empty error}">

            <div class="alert alert-danger">

                ${error}

            </div>

        </c:if>

        <!-- ================= FORM ================= -->

        <form action="/addSkillSAVE"
              method="post"
              enctype="multipart/form-data">

            <!-- USER ID -->

            <input type="hidden"
                   name="userId"
                   value="<%= userId %>"/>

            <!-- TITLE -->

            <label class="form-label">

                Skill Title

            </label>

            <input type="text"
                   name="title"
                   class="form-control mb-3"
                   placeholder="Enter your skill title"
                   required>

            <!-- DESCRIPTION -->

            <label class="form-label">

                Description

            </label>

            <textarea name="description"
                      rows="4"
                      class="form-control mb-3"
                      placeholder="Write detailed information about your skill"
                      required></textarea>

            <!-- CATEGORY -->

            <label class="form-label">

                Category

            </label>

            <input type="text"
                   name="category"
                   class="form-control mb-4"
                   placeholder="Example : Coding, Music, Painting"
                   required>

            <!-- IMAGE 1 -->

            <div class="upload-box">

                <label class="form-label">

                    <i class="bi bi-image-fill"></i>
                    Upload Image 1

                </label>

                <input type="file"
                       name="image1"
                       class="form-control">

            </div>

            <!-- IMAGE 2 -->

            <div class="upload-box">

                <label class="form-label">

                    <i class="bi bi-image-fill"></i>
                    Upload Image 2

                </label>

                <input type="file"
                       name="image2"
                       class="form-control">

            </div>

            <!-- IMAGE 3 -->

            <div class="upload-box">

                <label class="form-label">

                    <i class="bi bi-image-fill"></i>
                    Upload Image 3

                </label>

                <input type="file"
                       name="image3"
                       class="form-control">

            </div>

            <!-- VIDEO -->

            <div class="upload-box">

                <label class="form-label">

                    <i class="bi bi-camera-video-fill"></i>
                    Upload Video

                </label>

                <input type="file"
                       name="videoFile"
                       class="form-control">

            </div>

            <!-- SAVE BUTTON -->

            <button class="btn btn-save w-100">

                <i class="bi bi-cloud-upload-fill"></i>
                Add Skill

            </button>

        </form>

    </div>

</div>

</body>

</html>