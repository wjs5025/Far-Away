<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 지역별 여행지</title>
</head>
<body>
<%@ include file="/include/nav.jsp" %>
<section id="attraction" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <main class="main" id="board">
            <div class="card container align-items-center rounded-0 mt-5 p-3">
                <!-- 중앙 center content end -->
                <h2 class="col-md-12 text-center section-header">지역별 여행지</h2>
                <div class="col-md-12 d-flex flex-row">
                    <div id="map" class="col-md-6" style="height: 60vh"></div>
                    <div class="col-md-6 ps-5">
                        <!-- 관광지 검색 start -->
                        <form class="d-flex m-3" id="search-form" name="search-form" method="get" action="">
                            <input type="hidden" id="action" name="action" value="list">
                            <input type="hidden" id="pageNo" name="pageNo" value="1">
                            <select id="sidoCode" name="sidoCode" class="form-select mx-2"
                                    aria-label="Default select example" onchange="getGunguData()">
                                <option value="" selected>시/도</option>
                            </select> <select id="gugunCode" name="gugunCode" class="form-select mx-2"
                                              aria-label="Default select example">
                            <option value="" selected>구/군</option>
                        </select> <select id="contentTypeId" name="contentTypeId" class="form-select mx-2"
                                          aria-label="Default select example">
                            <option value="" selected>관광지 유형</option>
                            <option value="12">관광지</option>
                            <option value="14">문화시설</option>
                            <option value="15">축제공연행사</option>
                            <option value="25">여행코스</option>
                            <option value="28">레포츠</option>
                            <option value="32">숙박</option>
                            <option value="38">쇼핑</option>
                            <option value="39">음식점</option>
                        </select>

                            <!-- type="submit | button " -->
                            <button id="btn-search" name="btn-search" class="btn btn-outline-success"
                                    type="button">SEARCH
                            </button>
                        </form>
                        <div class="row" style="max-height: 50vh; overflow-y: scroll">
                            <div style="text-align: center; background-color: #babbbc">검색 조건을 설정 후 검색하세요</div>
                            <table class="table table-striped" id="attraction-info-list" name="attraction-info-list">
                                <thead>
                                <tr class="text-center">
                                    <th>대표이미지</th>
                                    <th>관광지명</th>
                                    <th>주소</th>
                                </tr>
                                </thead>
                                <tbody id="attraction-list">

                                </tbody>
                            </table>
                        </div>
                        <%--네비게이션 영역--%>
                        <div class="row" id="navigator">

                        </div>
                    </div>
                </div>
                <!-- 관광지 검색 end -->
            </div>
        </main>
    </div>

    </div>
</section>

<%-- Footer --%>
<%@ include file="../include/footer.jsp" %>

<%-- 카카오맵 API import--%>
<script src="../assets/js/kakaoMap.js"></script>

<script src="../assets/js/attraction/attraction-index.js"></script>

</body>
</html>