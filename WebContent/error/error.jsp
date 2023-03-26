<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Far Away : ERROR</title>


</head>

<body>
<!-- 상단 네비게이션 -->
<%@ include file="/include/nav.jsp" %>

<!-- 본문 -->
<main id="main">

    <section id="intro" class="background d-flex align-items-center">
        <div class="container text-center position-relative"
             data-aos="fade-in" data-aos-delay="200">
            <div class="card" style="height: 350px; padding: 50px;">
                <h1 id="main-title" class="text-danger">에러 발생</h1>
                <h2 class="text-dark fs-5 mb-4">예기치 못한 오류가 발생했습니다.</h2>
                <h2 class="text-black fs-3">${msg}</h2>
                <div style="margin-top: 50px;">
                    <button class="btn btn-success col-3" id="return-index-btn">홈으로 돌아가기</button>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- ======= To Top 버튼 ======= -->
<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- ======= Footer ======= -->
<%@ include file="/include/footer.jsp" %>
<script>
    document.getElementById("return-index-btn").addEventListener("click", function () {
        location.href = "/";
    });
</script>
</body>
</html>
