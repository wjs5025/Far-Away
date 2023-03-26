<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 글쓰기</title>
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
                <h1 class="col-md-12 text-center section-header">게시글 작성</h1>
                <!-- 여기에 코드작성 -->
                <form class="col-10">
                    <div class="form-group">
                        <label for="input_writer" class="form-label d-flex">작성자 ID</label>
                        <input type="text" class="form-control" id="input_writer" name="writer"
                                readonly aria-describedby="emailHelp" value="<%--작성자 아이디 입력--%>">
                    </div>
                        <div class="form-group">
                            <label for="input_title" class="form-label d-flex mt-4">제목</label>
                            <input type="text" class="form-control" id="input_title"
                                   placeholder="제목을 입력해주세요" name="title"
                                   aria-describedby="emailHelp">
                        </div>
                    <div class="form-group mt-4">
                        <label for="input_content" class="form-label d-flex">내용</label>
                        <textarea class="form-control" rows="10" name="content" id="input_content"
                                  placeholder="내용을 입력해주세요" required
                        ></textarea>
                    </div>

                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg" type="button">글작성</button>
                    </div>

                </form>

            </div>
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp"%>

</body>
</html>
