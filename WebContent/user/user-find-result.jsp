<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 비밀번호 찾기 결과</title>
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
                 style="min-height: 50vh;">
                <h1 class="col-md-12 text-center section-header text-black mb-3">비밀번호 찾기 결과</h1>

                    <!-- 아이디 입력 -->
                    <div class="form-outline mb-4 d-flex" style="height: 30vh; align-items: center">
                        <h3 class="text-success"> [ ${user-id} ] 님의 비밀번호는 <br/><br/>[ ${user-password} ] 입니다.</h3>
                    </div>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp"%>
</body>
</html>