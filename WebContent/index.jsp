<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<title>TRAVEL MAKER</title>
<meta content="" name="description" />
<meta content="" name="keywords" />

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon" />
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet" />

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet" />
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet" />
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet" />
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet" />
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet" />

<!-- api keys -->

<script src="./assets/js/api_config.js"></script>
<!-- kakao map api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8510df0d52f1a6b3d7e4cefe66c42714"></script>
</head>

<body>
	<!-- 상단 네비게이션 -->
	<%@ include file="/include/nav.jsp"%>

	<!-- 본문 -->
	<main id="main">
	<section id="hero" class="d-flex align-items-center">
		<div class="container text-center position-relative"
			data-aos="fade-in" data-aos-delay="200">
			<h1 id="main-title">메인 타이틀</h1>
			<h2>당신에게 꼭 맞는 여행지를 검색해보세요</h2>
			<a href="index.html#about" class="btn-get-started scrollto">SEARCH
				!</a>
		</div>
	</section>
	</main>

	<!-- ======= To Top 버튼 ======= -->
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
		
	<!-- ======= Footer ======= -->
	<%@ include file="/include/footer.jsp"%>

	<!-- ======= 자바스크립트 import ======= -->
	<%@ include file="/include/scripts.jsp"%>


</body>
</html>
