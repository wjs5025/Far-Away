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
    <section id="route" class="align-items-center p-0" style="height: 100vh">
        <div
                class="w-100 text-center position-relative"
                data-aos="fade-in"
                data-aos-delay="100"
        >

            <div class="card w-100 align-items-center rounded-0">
                <div class="col-md-12 row justify-content-center">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <h2 class="my-3 py-3 shadow-sm bg-light text-center">
                            <mark class="sky">여행 계획</mark>
                        </h2>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row align-self-center mb-2">
                            <div class="col-md-2 text-start">
                                <button type="button" id="btn-planwrite"
                                        class="btn btn-outline-primary btn-sm">여행계획만들기</button>
                            </div>
                            <div class="col-md-7 offset-3">
                                <form class="d-flex" id="form-search" action="">
                                    <input type="hidden" name="action" value="list" /> <input
                                        type="hidden" name="pgno" value="1" /> <select name="key"
                                                                                       id="key" class="form-select form-select-sm ms-5 me-1 w-50"
                                                                                       aria-label="검색조건">
                                    <option selected>검색조건</option>
                                    <option value="article_no">글번호</option>
                                    <option value="subject">제목</option>
                                    <option value="user_id">작성자</option>
                                </select>
                                    <div class="input-group input-group-sm">
                                        <input type="text" name="word" id="word" class="form-control"
                                               placeholder="검색어..." />
                                        <button id="btn-search" class="btn btn-dark" type="button">검색</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <thead>
                            <tr class="text-center">
                                <th scope="col">글번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">조회수</th>
                                <th scope="col">출발일</th>
                                <th scope="col">도착일</th>
                                <th scope="col">작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="article" items="${articles}">
                                <tr class="text-center">
                                    <th scope="row">${article.articleNo}</th>
                                    <td class="text-start"><a href="#"
                                                              class="article-title link-dark" data-no="${article.articleNo}"
                                                              style="text-decoration: none"> ${article.subject} </a></td>
                                    <td>${article.userId}</td>
                                    <td>${article.hit}</td>
                                    <td>${article.departureTime}</td>
                                    <td>${article.arrivalTime}</td>
                                    <td>${article.registerTime}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">${navigation.navigator}</div>
                </div>
                <form id="form-param" method="get" action="">
                    <input type="hidden" id="p-action" name="action" value=""> <input
                        type="hidden" id="p-pgno" name="pgno" value=""> <input
                        type="hidden" id="p-key" name="key" value=""> <input
                        type="hidden" id="p-word" name="word" value="">
                </form>
                <script>
                    let titles = document.querySelectorAll(".article-title");
                    titles.forEach(function(title) {
                        title.addEventListener("click", function() {
                            console.log(this.getAttribute("data-no"));
                            location.href = "${root}/plan?action=planview&articleno="
                                + this.getAttribute("data-no");
                        });
                    });

                    document.querySelector("#btn-planwrite").addEventListener("click",
                        function() {
                            location.href = "${root}/plan?action=mvplanwrite";
                        });

                    document.querySelector("#btn-search").addEventListener("click", function() {
                        let form = document.querySelector("#form-search");
                        form.setAttribute("action", "${root}/plan");
                        form.submit();
                    });

                    let pages = document.querySelectorAll(".page-link");
                    pages.forEach(function(page) {
                        page.addEventListener("click", function() {
                            console.log(this.parentNode.getAttribute("data-pg"));
                            document.querySelector("#p-action").value = "list";
                            document.querySelector("#p-pgno").value = this.parentNode
                                .getAttribute("data-pg");
                            document.querySelector("#p-key").value = "${param.key}";
                            document.querySelector("#p-word").value = "${param.word}";
                            document.querySelector("#form-param").submit();
                        });
                    });
                </script>
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