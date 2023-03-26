<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 공지사항</title>
</head>

<body>
<%@ include file="/include/nav.jsp" %>

<section id="hero" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <main class="main" id="board">
            <div class="card container align-items-center rounded-0 mt-5 " style="height: 80vh;" >
                <h1 class="col-md-12 text-center section-header">공지사항</h1>
                <div class="col-md-12 card rounded-0">
                    <div class="card-header">
                        <a class="btn float-end text-white rounded-5"
                           style="background-color: #009970"
                           href="/Board/board_write.jsp">
                            <i class="fas fa-edit"></i>
                            WRITE
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody id="posts">
                            <tr>
                                <td>no</td>
                                <td>title</td>
                                <td>writer</td>
                                <td>date</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp"%>

</body>
</html>
