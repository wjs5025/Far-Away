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
                <form>
                    <div class="form-group">
                        <label for="input_id" class="form-label d-flex">아이디</label>
                        <input type="text" class="form-control" id="input_id" name="userId"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group has-success">
                        <label class="form-label  d-flex mt-4" for="input_pw">비밀번호</label>
                        <input type="password" class="form-control is-valid" id="input_pw" name="userPw">
                        <div class="valid-feedback"></div>
                    </div>

                    <div class="form-group has-danger">
                        <label class="form-label  d-flex mt-4" for="input_pw_check"  name="userPwCheck">비밀번호 재확인</label>
                        <input type="password" class="form-control is-invalid" id="input_pw_check">
                        <div class="invalid-feedback  d-flex">비밀번호가 일치하지 않습니다</div>
                    </div>
                    <div class="form-group">
                        <label for="input_name" class="form-label  d-flex mt-4">이름</label>
                        <input type="text" class="form-control" id="input_name"    name="userName"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="form-group">
                        <label for="input_email" class="form-label  d-flex mt-4">이메일</label>
                        <input type="email" class="form-control" id="input_email" name="userEmail"
                               aria-describedby="emailHelp" placeholder="선택입력">
                    </div>
                    <div class="d-grid gap-2 mt-5">
                        <button class="btn btn-success btn-lg" type="button">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>