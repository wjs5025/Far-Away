<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 지역별 여행지</title>

</head>
<body>
<%@ include file="/include/nav.jsp" %>

<!-- 본문 -->
<main id="main">

    <section id="intro" class="background d-flex align-items-center mb-5">
        <div class="container text-center position-relative"
             data-aos="fade-in" data-aos-delay="200">
            <h1 id="main-title">나만의 여행 경로를 계획하세요.</h1>
            <h2>가장 효율적인 동선을 알아볼까요?</h2>
            <a href="#route" class="btn-get-started scrollto">GO !</a>
        </div>
    </section>
    <section id="route" class="d-flex align-items-center p-0">
        <div
                class="w-100 text-center position-relative"
                data-aos="fade-in"
                data-aos-delay="100"
        >

            <div class="card w-100 align-items-center rounded-0">
                <!-- 중앙 center content end -->
                <h2 class="col-md-12 text-center section-header">나의 여행계획</h2>
                <em>최적의 경로로, 최고의 여행을 만들어보세요 !</em>
                <p class="" data-bs-toggle="tooltip" data-bs-html="true"
                   title="1. 최초 좌클릭하여 선그리기를 시작하세요.<br/>2. 추가적인 좌클릭으로 경유지를 추가하세요 !<br/>3. 모든 경로가 추가되었다면, 우클릭으로 선그리기를 종료하세요.">
                    <u>사용방법❓</u>
                </p>
                <div class="col-md-12 d-flex flex-row justify-content-center">
                    <div id="route_map" class="col-md-10" style="height: 70vh"></div>
                </div>
            </div>

        </div>
    </section>
</main>


<%-- Footer --%>
<%@ include file="../include/footer.jsp" %>

<%-- 카카오맵 API --%>
<script src="../assets/js/route_kakaomap.js"></script>
</body>
</html>