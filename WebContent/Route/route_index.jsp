<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

	<title>Far Away : 지역별 여행지</title>
	<%@ include file="/include/import_styles.jsp" %>
	<%@ include file="/include/import_apis.jsp" %>
</head>
<body>
<%@ include file="/include/nav.jsp" %>
<%@ include file="../assets/js/route_kakaomap.js"%>
<section id="hero" class="background d-flex align-items-center">
	<div
			class="container text-center position-relative"
			data-aos="fade-in"
			data-aos-delay="100"
	>
		<main class="main" id="board">
			<div class="card container align-items-center rounded-0 mt-5"  >
				<!-- 중앙 center content end -->
				<h2 class="col-md-12 text-center section-header">나의 여행계획</h2>
				<p>최적의 경로로, 최고의 여행을 만들어보세요 !</p>

				<p>최초 좌클릭하여 선그리기를 시작하고, 좌클릭으로 경유지를 추가하세요 !</p>
				<p>모든 경로가 추가되었다면, 우클릭으로 선그리기를 종료하세요.</p>
				<div class="col-md-12 d-flex flex-row">
					<div id="route_map" class="col-md-12" style="height: 600px"></div>
				</div>
			</div>
		</main>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>

</body>
</html>