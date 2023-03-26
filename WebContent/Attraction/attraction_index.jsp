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
<section id="hero" class="background d-flex align-items-center">
    <div
            class="container text-center position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >
        <main class="main" id="board">
        <div class="card container align-items-center rounded-0 mt-5 p-3"  >
            <!-- 중앙 center content end -->
            <h2 class="col-md-12 text-center section-header">지역별 여행지</h2>
            <div class="col-md-12 d-flex flex-row">
                <div id="map" class="col-md-6" style="height: 60vh"></div>
                <div class="col-md-6 ps-5">
                    <!-- 관광지 검색 start -->
                    <form class="d-flex m-3" role="search"
                          onsubmit="event.preventDefault(); Search();">
                        <select id="search-area" class="form-select mx-2"
                                aria-label="Default select example" onchange="getSigunguData()">
                            <option value="0" selected>전체 지역</option>
                        </select> <select id="search-sigunguCode" class="form-select mx-2"
                                          aria-label="Default select example">
                        <option value="0" selected>시/군/구</option>
                    </select> <select id="search-content-id" class="form-select mx-2"
                                      aria-label="Default select example">
                        <option value="0" selected>관광지 유형</option>
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
                        <button id="btn-search" class="btn btn-outline-success"
                                type="button" onclick="Search()">SEARCH
                        </button>
                    </form>
                    <div class="row" style="max-height: 50vh; overflow-y: scroll">
                        <table class="table table-striped" id="trip-list"   >
                            <tbody class=" ">
                            <td style="text-align: center">검색 조건을 설정 후 검색하세요</td>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 관광지 검색 end -->
            </div>
        </div>
</main>
    </div>
</section>

<%-- Footer --%>
<%@ include file="../include/footer.jsp"%>

<%-- 카카오맵 API --%>
<script src="../assets/js/kakaoMap.js"></script>

</body>
</html>