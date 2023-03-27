<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 마이 페이지</title>
</head>
<body>
<%@ include file="/include/nav.jsp" %>


<section id="intro" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <div class="card container align-items-center rounded-0 mt-5  justify-content-center overflow-y-scroll"
             style="height: 80vh">
            <h1 class="col-md-12 text-center section-header text-black">마이 페이지</h1>
            <div class="container col-4 ">
                    <div class="form-group">
                        <label for="user-id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user-id" name="user-id" readonly
                               value="${user.userId}"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="user-name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user-name" name="user-name" readonly
                               value="${user.userName}">
                    </div>
                <div class="form-group d-flex">
                    <div class="col-5">
                        <label for="email-id" class="form-label  d-flex mt-4">이메일</label>
                        <input type="email" class="form-control" id="email-id" name="email-id" value="${user.emailId}" readonly
                               aria-describedby="emailHelp" placeholder="이메일 아이디">
                    </div>
                    <div class="col-1 d-flex fs-3" style="align-items: flex-end;justify-content: center; ">@</div>
                    <div class="col-6">
                        <label for="email-domain" class="form-label  d-flex mt-4">&nbsp;</label>
                        <input type="email" class="form-control" id="email-domain" name="email-domain" value="${user.emailDomain}" readonly
                               aria-describedby="emailHelp">
                    </div>
                </div>

                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg">
                            <a href="/User/user-modify.jsp" class="text-white">회원 정보 수정하기</a>
                        </button>
                        <button id="user-delete-btn" class="btn btn-danger btn-lg">
                            탈퇴하기
                        </button>
                    </div>

            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
<script>
    document.getElementById("user-delete-btn").addEventListener("click",()=>{
        console.log("탈퇴")
        if(window.confirm("정말 탈퇴하시겠습니까?")){
            location.href = "${root}/user?action=delete";
        }
    })
</script>
</body>
</html>