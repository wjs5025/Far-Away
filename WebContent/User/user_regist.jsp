<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/include/import_styles.jsp" %>
    <title>Far Away : 회원가입</title>
</head>
<body>
<%@ include file="/include/nav.jsp" %>


<section id="intro" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <div class="card container align-items-center rounded-0 mt-5  justify-content-center overflow-y-scroll"
             style="height: 80vh">
            <h1 class="col-md-12 text-center section-header text-black">회원가입</h1>
            <div class="container col-4 ">
                <form method="POST" id="regist-form">
                    <div class="form-group">
                        <label for="user_id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user_id" name="user_id"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group has-success">
                        <label class="form-label  d-flex mt-4" for="user_password">비밀번호</label>
                        <input type="password" class="form-control is-valid" id="user_password" name="user_password">
                        <div class="valid-feedback"></div>
                    </div>

                    <div class="form-group has-danger">
                        <label class="form-label  d-flex mt-4" for="user_password_check" name="user_password_check">비밀번호
                            재확인</label>
                        <input type="password" class="form-control is-invalid" id="user_password_check">
                        <div class="invalid-feedback  d-flex">비밀번호가 일치하지 않습니다</div>
                    </div>
                    <div class="form-group">
                        <label for="user_name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user_name" name="user_name"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-5">
                            <label for="email_id" class="form-label  d-flex mt-4">이메일</label>
                            <input type="email" class="form-control" id="email_id" name="email_id"
                                   aria-describedby="emailHelp" placeholder="이메일 아이디">
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
                        <button class="btn btn-success btn-lg" id="regist-submit-btn">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
<script>
    let submitBtn = document.getElementById("regist-submit-btn");
    submitBtn.addEventListener("click", () => {
        let form = document.getElementById("regist-form");
        form.setAttribute("action", "/user?action=regist");
        form.submit();
    });
</script>
</body>
</html>