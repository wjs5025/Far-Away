<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 여행 계획</title>
</head>

<body>
<%@ include file="/include/nav.jsp" %>

<section id="board" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >

        <main class="main" id="board">
            <div class="card container align-items-center rounded-0 mt-5 " style="height: 80vh;">
                <h1 class="col-md-12 text-center section-header">여행 계획</h1>
                <div class="col-md-12 card rounded-0">
                    <div class="card-header">
                        <a class="btn float-end text-white rounded-5"
                           style="background-color: #009970"
                           href="${root}/plan?action=mvplanwrite">
                            <i class="fas fa-edit"></i>
                            WRITE
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover table-striped " style="border: 1px solid green;">
                            <thead>
                            <tr style="background-color: #009970; color: white">
                                <th scope="col">글번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">조회수</th>
                                <th scope="col">출발일</th>
                                <th scope="col">도착일</th>
                                <th scope="col">작성일</th>
                            </tr>
                            </thead>
                            <tbody id="posts">
                            <c:forEach var="plan" items="${articles}">
                                <tr class="text-center">
                                    <th scope="row">${plan.planId}</th>
                                    <td class="text-start">
                                        <a href="#" class="article-title link-dark" data-no="${plan.planId}"
                                           style="text-decoration: none"> ${plan.title} </a></td>
                                    <td>${plan.userId}</td>
                                    <td>${plan.hit}</td>
                                    <td>${plan.departureTime}</td>
                                    <td>${plan.arrivalTime}</td>
                                    <td>${plan.registerTime}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        ${navigation.navigator}
                    </div>
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
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>
