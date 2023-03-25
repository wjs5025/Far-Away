<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/include/import_styles.jsp" %>
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
                 style="min-height: 50vh;">
                <h1 class="col-md-12 text-center section-header text-black mb-3">비밀번호 찾기</h1>
                <form class="col-3">
                    <!-- 아이디 입력 -->
                    <div class="form-outline mb-4">
                        <label class="form-label d-flex"  for="form2Example1">아이디</label>
                        <input type="text" id="form2Example1" class="form-control"/>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="form-outline mb-4">
                        <label class="form-label d-flex" for="form2Example2">이메일</label>
                        <input type="email" id="form2Example2" class="form-control"/>
                    </div>
                    <div class="row my-5 justify-content-center">
                        <!-- Submit button -->
                        <button type="button" class=" btn btn-success btn-block mb-3">비밀번호 찾기
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp"%>
</body>
</html>