<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 공유게시판</title>
</head>

<body>
<%@ include file="/include/nav.jsp" %>

<section id="board" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >

        <main class="main">
            <div class="card container align-items-center rounded-0 mt-5 " style="height: 80vh;" >
                <h1 class="col-md-12 text-center section-header">공유게시판</h1>
                <div class="col-md-12 card rounded-0">
                    <div class="card-header">
                        <a class="btn float-end text-white rounded-5"
                           style="background-color: #009970"
                           href="${root}/board?action=mv-add">
                            <i class="fas fa-edit"></i>
                            WRITE
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover table-striped "   style="border: 1px solid green;">
                            <thead>
                            <tr style="background-color: #009970; color: white">
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody id="posts">
                            <c:forEach var="board" items="${list}">
                                <tr class="text-center">
                                    <td class="col-1 fw-bold">${board.boardId}</td>
                                    <td class="text-start col-5 text-center">
                                        <a
                                                href="${root}/board?action=get&board-id=${board.boardId}"
                                                class="article-title link-dark"
                                                data-no="${board.boardId}"
                                                style="text-decoration: none"
                                        >
                                                ${board.title}
                                        </a>
                                    </td>
                                    <td class="col-3">${board.userId}</td>
                                    <td class="col-1">${board.hit}</td>
                                    <td class="col-2">${board.registerTime}</td>
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
                    <input type="hidden" id="p-action" name="action" value="">
                    <input type="hidden" id="p-category" name="category" value="share">
                    <input type="hidden" id="p-pgno" name="pageNo" value="">
                    <input type="hidden" id="p-key" name="key" value="">
                    <input type="hidden" id="p-word" name="word" value="">
                </form>
                <script>
                    let pages = document.querySelectorAll(".page-link");
                    pages.forEach(function (page) {
                        page.addEventListener("click", function () {
                            console.log(this.parentNode.getAttribute("data-pg"));
                            document.querySelector("#p-action").value = "get-list";
                            document.querySelector("#p-pgno").value = this.parentNode.getAttribute("data-pg");
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

<%@ include file="../include/footer.jsp"%>

</body>
</html>
