<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : ${plan.title}</title>

</head>
<body>
<%@ include file="/include/nav.jsp" %>
<c:if test="${plan eq null}">
    <script>
        alert("글이 삭제되었거나 부적절한 URL 접근입니다.");
        location.href = "${root}/plan?action=planlist";
    </script>
</c:if>

<section id="board" class="background d-flex align-items-center">
    <div
            class="container position-relative"
            data-aos="fade-in"
            data-aos-delay="100"
    >

        <main class="main">
            <div class="card container align-items-center rounded-0 mt-5 " style="height: 80vh;">
                <div class="col-lg-12">
                    <div class="row my-2">
                        <h2 class="text-secondary px-5">${plan.planId}.
                            ${plan.title}</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="clearfix align-content-center">
                                <img class="avatar me-2 float-md-start bg-light p-2"
                                     src="https://raw.githubusercontent.com/twbs/icons/main/icons/person-fill.svg"/>
                                <p>
                                    <span class="fw-bold">${plan.userId}</span> <br/> <span
                                        class="text-secondary fw-light"> ${plan.registerTime}
							조회 : ${plan.hit} </span>
                                </p>
                            </div>
                        </div>
                        <div class="divider mb-3"></div>

                        <!-- 맵 -->
                        <div class="col-4">
                            <h3 class="my-3 py-3 shadow-sm bg-light text-center section-header">
                                글쓴이 추천 경로
                            </h3>
                            <div id="map" style="width: 100%; height: 500px;"></div>
                        </div>
                        <div class="col-4">
                            <h3 class="my-3 py-3 shadow-sm bg-light text-center section-header">
                                최단 경로 추천
                            </h3>
                            <div id="planMap" style="width: 100%; height: 500px;"></div>
                        </div>

                        <!-- 여행 계획 작성 폼 -->
                        <div class="col">
                            <div class="col-lg-12">
                                <form id="form-planregist" method="POST" action="">
                                    <input type="hidden" name="action" value="planregist">
                                    <h3 class="my-3 py-3 shadow-sm bg-light text-center section-header" >
                                        경로 상세
                                    </h3>
                                    <div class="mb-3">
                                        <label for="departuretime" class="form-label">출발일 : </label> <input
                                            type="date" class="form-control" id="departuretime"
                                            name="departuretime" value="${plan.departureTime}" readonly/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="arrivaltime" class="form-label">도착일 : </label> <input
                                            type="date" class="form-control" id="arrivaltime"
                                            name="arrivaltime" value="${plan.arrivalTime}" readonly/>
                                    </div>
                                    <div class="mb-3">
                                        <label for="content" class="form-label">계획 상세 : </label>
                                        <textarea class="form-control" id="content" name="content"
                                                  readonly>${plan.content}</textarea>
                                    </div>
                                    <div class="mb-3" style="display: none">
                                        <label for="viewcourse" class="form-label">여행 경로 : </label>
                                        <textarea class="form-control" id="viewcourse" name="viewcourse"
                                                  readonly>${plan.tripCourse}</textarea>
                                    </div>
                                    <div class="divider mt-3 mb-3"></div>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" id="btn-list"
                                                class="btn btn-outline-primary mb-3">글목록
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <script>
                        document.querySelector("#btn-list").addEventListener("click",
                            function () {
                                location.href = "${root}/plan?action=planlist";
                            });
                    </script>
                    <script src="${root}/assets/js/plan.js"></script>
                    <script type="text/javascript"
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8510df0d52f1a6b3d7e4cefe66c42714&libraries=services,clusterer,drawing"></script>
                    <script>
                        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
                                level: 7, // 지도의 확대 레벨
                            };
                        var planMapContainer = document.getElementById("planMap"), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
                                level: 7, // 지도의 확대 레벨
                            };

                        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);
                        var planMap = new kakao.maps.Map(planMapContainer, mapOption);

                        let temp = "${plan.tripCourse}";
                        temp = temp.replaceAll("(", " ");
                        temp = temp.replaceAll(")", " ");
                        temp = temp.replaceAll(" ", "");
                        let tempList = temp.split(",");
                        let planCourse = "${plan.planCourse}";
                        console.log(planCourse);
                        planCourse = planCourse.replaceAll("[", "");
                        planCourse = planCourse.replaceAll("]", "");
                        planCourse = planCourse.split(",");
                        let viewCourse = [];
                        console.log(planCourse.length);
                        var bounds = new kakao.maps.LatLngBounds();
                        for (var i = 0; i < tempList.length; i++) {
                            let x = parseFloat(tempList[i++]);
                            let y = parseFloat(tempList[i]);

                            viewCourse.push(new kakao.maps.LatLng(x, y));
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: new kakao.maps.LatLng(x, y)

                            });
                            marker.setMap(map);
                            bounds.extend(new kakao.maps.LatLng(x, y));
                        }
                        viewLine(viewCourse);

                        viewCourse = [];
                        for (var i = 0; i < planCourse.length; i++) {
                            console.log(planCourse[i]);
                            let x = parseFloat(tempList[2 * planCourse[i]]);
                            let y = parseFloat(tempList[2 * planCourse[i] + 1]);

                            viewCourse.push(new kakao.maps.LatLng(x, y));
                            var marker = new kakao.maps.Marker({
                                map: planMap,
                                position: new kakao.maps.LatLng(x, y)

                            });
                            marker.setMap(planMap);
                            bounds.extend(new kakao.maps.LatLng(x, y));
                        }
                        viewPlanLine(viewCourse);

                        function viewLine(viewCourse) {
                            var polyline = new kakao.maps.Polyline({
                                path: viewCourse, // 선을 구성하는 좌표배열 입니다
                                strokeWeight: 5, // 선의 두께 입니다
                                strokeColor: '#FF3DE5', // 선의 색깔입니다
                                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                strokeStyle: 'dashed' // 선의 스타일입니다
                            });

                            // 지도에 선을 표시합니다
                            polyline.setMap(map);

                            map.setBounds(bounds);
                        }

                        function viewPlanLine(viewCourse) {
                            var polyline = new kakao.maps.Polyline({
                                path: viewCourse, // 선을 구성하는 좌표배열 입니다
                                strokeWeight: 5, // 선의 두께 입니다
                                strokeColor: '#FF3DE5', // 선의 색깔입니다
                                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                strokeStyle: 'dashed' // 선의 스타일입니다
                            });

                            // 지도에 선을 표시합니다
                            polyline.setMap(planMap);

                            planMap.setBounds(bounds);
                        }
                    </script>


                </div>
            </div>
        </main>
    </div>
</section>
<%@ include file="/include/footer.jsp" %>
</body>