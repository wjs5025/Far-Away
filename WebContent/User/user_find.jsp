<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 비밀번호 찾기</title>
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
            <div class="card container align-items-center rounded-0 mt-5 justify-content-center "
                 style="min-height: 60vh;">
                <h1 class="col-md-12 text-center section-header text-black mb-3">비밀번호 찾기</h1>
                <form method="POST" id="find-form">
                    <div class="form-group">
                        <label for="user_id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user_id" name="user_id"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="user_name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user_name" name="user_name"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-5">
                            <label for="email_id" class="form-label  d-flex mt-4">이메일</label>
                            <input type="text" class="form-control" id="email_id" name="email_id"
                                   placeholder="이메일 아이디">
                        </div>
                        <div class="col-1 d-flex fs-3" style="align-items: flex-end;justify-content: center; ">@</div>
                        <div class="col-6">
                            <label for="email_domain" class="form-label  d-flex mt-4">&nbsp;</label>
                            <select
                                    class="form-select"
                                    id="email_domain"
                                    name="email_domain"
                                    aria-label="이메일 도메인 선택"
                            >
                                <option selected>선택</option>
                                <option value="ssafy.com">ssafy.com</option>
                                <option value="google.com">google.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="kakao.com">kakao.com</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg" id="find-submit-btn">비밀번호 찾기</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp" %>
<script>
    let submitBtn = document.getElementById("find-submit-btn");
    submitBtn.addEventListener("click", () => {
        if (!document.getElementById("user_id").value) {
            alert("아이디를 입력하세요.");
            return;
        } else if (!document.getElementById("user_name").value) {
            alert("이름을 입력하세요.");
            return;
        } else if (!document.getElementById("email_id").value) {
            alert("이메일을 입력하세요.");
            return;
        } else if (document.getElementById("email_domain").value === "none") {
            alert("이메일을 입력하세요.");
            return;
        } else {
            let form = document.getElementById("find-form");
            form.setAttribute("action", "/user?action=find");
            form.submit();
        }
    });
</script>

</body>
</html>