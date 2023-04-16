<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 여행 계획 등록</title>
</head>

<body>
<%@ include file="/include/nav.jsp" %>

<section id="board" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <main class="main" id="board">
            <div class="card container align-items-center rounded-0 mt-5 d-flex justify-content-center"
                 style="height: 85vh;">
                <h1 class="col-md-12 text-center section-header">여행 계획 등록</h1>
                <!-- 여기에 코드작성 -->
                <div class="row col-md-12">
                    <!-- 관광지 검색 및 리스트 -->
                    <div class="col">
                        <div class="border col-sm-12 col-md-12">
                            <div class="row text-center mb-1 mt-3">
                                <div class="font-weight-bold col">관광지를 검색하세요!!!</div>
                            </div>
                            <div class="row mb-3">
                                <div class="text-center col-12">
                                    <div role="group" class="input-group mt-3">
                                        <!-- 검색 창 -->
                                        <input type="text" placeholder="관광지..." id="search-keyword"
                                               class="form-control">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-secondary"
                                                    id="btn-plansearch">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" viewBox="0 0 16 16" class="bi bi-search">
                                                    <path
                                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                            <!-- 목록 -->
                            <div class="row" style="max-height: 50vh; overflow-y: scroll">
                                <table class="table table-striped">
                                    <tbody id="trip-list"></tbody>
                                </table>
                            </div>
                            <!-- <div id="trip-list" class="alist overflow-auto"></div> -->
                        </div>
                    </div>

                    <!-- 맵 -->
                    <div class="col-6">
                        <div id="map" style="width: 100%; height: 500px;"></div>
                    </div>

                    <!-- 여행 계획 작성 폼 -->
                    <div class="col">
                        <div class="col-lg-8 col-md-10 col-sm-12">
                            <form id="form-planregist" method="POST" action="">
                                <input type="hidden" name="action" value="planregist">
                                <div class="mb-3">
                                    <label for="subject" class="form-label">제목 : </label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="subject"
                                            name="subject"
                                            placeholder="제목..."
                                    />
                                </div>
                                <div class="mb-3">
                                    <label for="departuretime" class="form-label">출발일 : </label>
                                    <input
                                            type="date"
                                            class="form-control"
                                            id="departuretime"
                                            name="departuretime"
                                    />
                                </div>
                                <div class="mb-3">
                                    <label for="arrivaltime" class="form-label">도착일 : </label>
                                    <input
                                            type="date"
                                            class="form-control"
                                            id="arrivaltime"
                                            name="arrivaltime"
                                    />
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">계획 상세 : </label>
                                    <textarea
                                            class="form-control"
                                            id="content"
                                            name="content"
                                            placeholder="내용..."
                                    ></textarea>
                                </div>
                                <div class="mb-3" style="display : none">
                                    <label for="tripcourse" class="form-label">여행 경로 : </label>
                                    <textarea
                                            class="form-control"
                                            id="tripcourse"
                                            name="tripcourse"
                                    ></textarea>
                                </div>

                                <div class="col-auto text-center">
                                    <button type="button" id="btn-planregist" class="btn btn-outline-primary mb-3">
                                        등록
                                    </button>
                                    <button type="reset" class="btn btn-outline-success mb-3">초기화</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8510df0d52f1a6b3d7e4cefe66c42714&libraries=services,clusterer,drawing"></script>
<script>
    let mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
            level: 7, // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    let map = new kakao.maps.Map(mapContainer, mapOption);
</script>
<script>
    document.querySelector("#btn-planregist").addEventListener("click",
        function () {
            if (!document.querySelector("#subject").value) {
                alert("제목 입력!!");
                return;
            } else if (!document.querySelector("#content").value) {
                alert("내용 입력!!");
                return;
            } else {
                let form = document.querySelector("#form-planregist");
                form.setAttribute("action", "${root}/plan?action=planregist");
                form.submit();
            }
        });
</script>

<script src="${root}/assets/js/plan.js"></script>
</body>
</html>
