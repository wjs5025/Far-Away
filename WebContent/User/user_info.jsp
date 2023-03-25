<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/include/import_styles.jsp" %>
    <title>Far Away : 회원 정보 조회</title>
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
            <h1 class="col-md-12 text-center section-header text-black">회원 정보 조회</h1>
            <div class="container col-4 ">

                    <div class="form-group">
                        <label for="user_id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user_id" name="user_id" readonly
                               value="${user.userId}"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="user_name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user_name" name="user_name" readonly
                               value="${user.userName}">
                    </div>
                    <div class="form-group">
                        <label for="email_id" class="form-label  d-flex mt-4">이메일 아이디</label>
                        <input type="email" class="form-control" id="email_id" name="email_id" readonly
                               value="${user.emailId}">
                    </div>
                    <div class="form-group">
                        <label for="email_domain" class="form-label  d-flex mt-4">이메일 도메인</label>
                        <input type="email" class="form-control" id="email_domain" name="email_domain" readonly
                               value="${user.emailDomain}">
                    </div>
                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg">
                            <a href="/User/user_modify.jsp" class="text-white">회원 정보 수정하기</a>
                        </button>
                    </div>

            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>