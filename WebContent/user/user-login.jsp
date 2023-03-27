<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 로그인</title>
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
                 style="min-height: 70vh;">
                <h1 class="col-md-12 text-center section-header text-black">로그인</h1>
                <form method="POST" id="login-form">
                    <!-- 아이디 입력 -->
                    <div class="form-outline mb-4">
                        <label class="form-label d-flex" for="user-id">아이디</label>
                        <input type="email" id="user-id" name="user-id" class="form-control"/>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="form-outline">
                        <label class="form-label d-flex" for="user-password">비밀번호</label>
                        <input type="password" id="user-password" onkeyup="if(window.event.keyCode==13){submitBtn.click()}" name="user-password" class="form-control"/>
                    </div>
                    <div class="form-outline m-3">
                        <span class="text-danger">${msg}&nbsp;</span>
                    </div>
                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                        <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="save" id="save_id"
                                       name="save_id"/>
                                <label class="form-check-label" for="save_id"> 로그인 정보 기억 </label>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col text-center ">
                                <a  href="${root}/user?action=mv-find">비밀번호를 분실했나요?</a>
                            </div>

                        </div>
                    </div>
                    <div class="row mb-4 justify-content-center">
                        <!-- Submit button -->
                        <button type="button" id="login-submit-btn" class=" btn btn-success btn-block mb-4">로그인
                        </button>
                    </div>

                    <!-- Register buttons -->
                    <div class="text-center">
                        <div class="col">
                            회원이 아니신가요? <br/><a href="${root}/user-regist.jsp">회원가입</a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>
<%@ include file="/include/footer.jsp" %>
<script>
    let submitBtn = document.getElementById("login-submit-btn");
    submitBtn.addEventListener("click", () => {
        let form = document.getElementById("login-form");
        form.setAttribute("action", "/user?action=login");
        form.submit();
    });
</script>
</body>
</html>