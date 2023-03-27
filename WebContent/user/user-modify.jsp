<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 회원 정보 수정</title>
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
            <h1 class="col-md-12 text-center section-header text-black">회원 정보 수정</h1>
            <div class="container col-4 ">
                <form method="POST" id="user-modify-form">
                    <div class="form-group">
                        <label for="user-id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="user-id" name="user-id" readonly
                               value="${user.userId}"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="user-name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="user-name" name="user-name"
                               value="${user.userName}">
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-5">
                            <label for="email-id" class="form-label  d-flex mt-4">이메일</label>
                            <input type="email" class="form-control" id="email-id" name="email-id"
                                   value="${user.emailId}"
                                   aria-describedby="emailHelp" placeholder="이메일 아이디">
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
                                <option value="none" selected>선택</option>
                                <option value="ssafy.com" }>ssafy.com
                                </option>
                                <option value="google.com">google.com
                                </option>
                                <option value="naver.com">naver.com
                                </option>
                                <option value="kakao.com">kakao.com
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group has-success">
                        <label class="form-label  d-flex mt-4" for="user-password">비밀번호</label>
                        <input type="password" class="form-control" id="user-password" name="user-password"
                               placeholder="회원정보를 변경하려면 비밀번호를 입력하세요.">
                        <div class="valid-feedback"></div>
                    </div>
                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg" id="user-modify-submit-btn">수정완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
<script>
    let submitBtn = document.getElementById("user-modify-submit-btn");
    submitBtn.addEventListener("click", () => {
        if (!document.getElementById("user-name").value) {
            alert("이름을 입력하세요.");
            return;
        }else if (!document.getElementById("email-id").value) {
            alert("이메일을 입력하세요.");
            return;
        }else if (document.getElementById("email-domain").value === "none") {
            alert("이메일을 입력하세요.");
            return;
        } else if (!document.getElementById("user-password").value) {
            alert("비밀번호를 입력하세요.");
            return;
        } else{
            let form = document.getElementById("user-modify-form");
            form.setAttribute("action", "/user?action=modify");
            form.submit();
        }
    });
</script>
</body>
</html>