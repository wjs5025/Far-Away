<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/include/import_styles.jsp" %>
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
                <form>
                    <!-- 아이디 입력 -->
                    <div class="form-outline mb-4">
                        <label class="form-label d-flex"  for="form2Example1">아이디</label>
                        <input type="email" id="form2Example1" class="form-control"/>
                    </div>

                    <!-- 비밀번호 입력 -->
                    <div class="form-outline mb-4">
                        <label class="form-label d-flex" for="form2Example2">비밀번호</label>
                        <input type="password" id="form2Example2" class="form-control"/>
                    </div>

                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                        <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="form2Example31"
                                       checked/>
                                <label class="form-check-label" for="form2Example31"> 로그인 정보 기억 </label>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div class="col text-center ">
                                <a href="./user_find.jsp">비밀번호를 분실했나요?</a>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-4 justify-content-center">
                        <!-- Submit button -->
                        <button type="button" class=" btn btn-success btn-block mb-4">로그인
                        </button>
                    </div>

                    <!-- Register buttons -->
                    <div class="text-center">
                        <div class="col">
                            회원이 아니신가요? <br/><a href="./user_regist.jsp">회원가입</a>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp"%>
</body>
</html>