<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 글 수정</title>
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
            <div class="card container align-items-center rounded-0 mt-5 d-flex justify-content-center"
                 style="height: 85vh;">
                <h1 class="col-md-12 text-center section-header">게시글 수정하기</h1>
                <!-- 여기에 코드작성 -->
                <form class="col-10" id="write-form" method="POST">
                    <input type="hidden" class="form-control text-start" id="boardId" name="boardId" readonly
                           value="${boardDto.boardId}">
                    <input type="hidden" class="form-control text-start" id="action" name="action" value="modify">
                    <div class="form-group col-12 d-flex">
                        <div class="col-4">
                            <label for="writer" class="form-label d-flex" style="font-size: 0.9em">카테고리</label>
                            <select
                                    class="form-select"
                                    id="category"
                                    name="category"
                            >
                                <option value="${boardDto.category}" selected>${boardDto.category}</option>

                            </select>


                        </div>
                        <div class="col-4 ms-3">
                            <label for="writer" class="form-label d-flex" style="font-size: 0.9em">작성자 ID</label>
                            <input type="text" class="form-control text-start" id="writer" name="writer" readonly
                                   value="${boardDto.userId}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="form-label d-flex mt-3" style="font-size: 0.9em">제목</label>
                        <input type="text" class="form-control text-start" id="title" name="title"
                               value="${boardDto.title}">
                    </div>
                    <div class="form-group mt-3">
                        <label for="content" class="form-label d-flex" style="font-size: 0.9em">내용</label>
                        <textarea class="form-control text-start" name="content" id="content"
                                  style="height: 30vh; resize: none"
                        >${boardDto.content}</textarea>
                    </div>

                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg" type="button" id="board-submit-btn">수정 완료</button>
                    </div>
                </form>

            </div>
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
<script>
    let submitBtn = document.getElementById("board-submit-btn");

    submitBtn.addEventListener("click", () => {
        if (!document.getElementById("title").value) {
            alert("제목을 입력하세요.");
            return;
        }else if (!document.getElementById("content").value) {
            alert("내용을 입력하세요.");
            return;
        }else{
            let form = document.getElementById("write-form");
            form.setAttribute("action", "${root}/board");
            form.submit();
        }
    });
</script>
</body>
</html>
