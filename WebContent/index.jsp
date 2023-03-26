<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 당신에게 꼭 맞는 국내 여행지 추천</title>
</head>

<body>
<!-- 상단 네비게이션 -->
<%@ include file="/include/nav.jsp" %>

<!-- 본문 -->
<main id="main">

    <section id="intro" class="background d-flex align-items-center">
        <div class="container text-center position-relative"
             data-aos="fade-in" data-aos-delay="200">
            <h1 id="main-title">메인 타이틀</h1>
            <h2>당신에게 꼭 맞는 여행지를 검색해보세요</h2>
            <a href="/Attraction/attraction_index.jsp" class="btn-get-started scrollto">SEARCH
                !</a>
        </div>
    </section>
</main>

<!-- ======= To Top 버튼 ======= -->
<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- ======= Footer ======= -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>
