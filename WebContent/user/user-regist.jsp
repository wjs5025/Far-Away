<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
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
                        <label for="user-id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user-id" name="user-id"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group has-success">
                        <label class="form-label  d-flex mt-4" for="user-password">비밀번호</label>
                        <input type="password" class="form-control" id="user-password" name="user-password"
                               onfocusout="checkPassword()">
                        <div class="valid-feedback"></div>
                    </div>

                    <div class="form-group has-danger">
                        <label class="form-label  d-flex mt-4" for="user-password_check" name="user-password_check">비밀번호
                            재확인</label>
                        <input type="password" class="form-control" id="user-password_check"
                               onfocusout="checkPassword()">
                        <div class="d-flex" id="password-check-msg"></div>
                    </div>
                    <div class="form-group">
                        <label for="user-name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user-name" name="user-name"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-5">
                            <label for="email-id" class="form-label  d-flex mt-4">이메일</label>
                            <input type="email" class="form-control" id="email-id" name="email-id"
                                   placeholder="이메일 아이디">
                        </div>
                        <div class="col-1 d-flex fs-3" style="align-items: flex-end;justify-content: center; ">@</div>
                        <div class="col-6">
                            <label for="email-domain" class="form-label  d-flex mt-4">&nbsp;</label>
                            <select
                                    class="form-select"
                                    id="email-domain"
                                    name="email-domain"
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
    // js에 요소 불러오기
    let userPwInput = document.getElementById("user-password");
    let userPwCheckInput = document.getElementById("user-password_check");
    let pwCheckMsg = document.getElementById("password-check-msg");
    let submitBtn = document.getElementById("regist-submit-btn");

    // 비밀번호 체크해서 스타일 적용하는 함수
    const checkPassword = () => {
        if (userPwInput.value == userPwCheckInput.value) {
            userPwInput.setAttribute("class", "form-control is-valid")
            userPwCheckInput.setAttribute("class", "form-control is-valid")
            pwCheckMsg.innerText = "비밀번호가 일치합니다."
            pwCheckMsg.style.cssText = "font-size: 0.9em; color: green";
        } else {
            userPwInput.setAttribute("class", "form-control is-invalid")
            userPwCheckInput.setAttribute("class", "form-control is-invalid")
            pwCheckMsg.innerText = "비밀번호가 일치하지 않습니다."
            pwCheckMsg.style.cssText = "font-size: 0.9em; color: red";
        }
    }

    // 가입하기 버튼 이벤트 추가
    submitBtn.addEventListener("click", () => {
        if (!document.getElementById("user-name").value) {
            alert("이름을 입력하세요.");
            return;
        } else if (!document.getElementById("user-password").value) {
            alert("비밀번호를 입력하세요.");
            return;
        } else if (userPwInput.value != userPwCheckInput.value) {
            alert("비밀번호를 확인하세요.");
            return;
        } else if (!document.getElementById("user-id").value) {
            alert("아이디를 입력하세요.");
            return;
        } else {
            let form = document.getElementById("regist-form");
            form.setAttribute("action", "/user?action=regist");
            form.submit();
        }
    });
</script>
</body>
</html>