<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header id="header" class="fixed-top d-flex align-items-center">
	<div class="container">
		<div
			class="header-container d-flex align-items-center justify-content-between">
			<div class="logo">
				<h1 class="text-light">
					<a href="index.html"><span>TRAVEL MAKER</span></a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="index.html#hero">INTRO</a>
					</li>
					<li><a class="nav-link scrollto active"
						href="index.html#about">지역별 여행지</a></li>
					<li><a class="nav-link scrollto" href="index.html#services">나의
							여행계획</a></li>
					<li><a class="nav-link scrollto" href="index.html#portfolio">핫플자랑하기</a>
					</li>
					<li><a class="nav-link scrollto" href="board.html">여행정보공유</a>
					</li>
					<li class="dropdown"><a href="#"><span
							id="account">계정</span> <i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a data-bs-toggle="modal" data-bs-target="#Modal2"
								id="btn-modal2"> 로그인 </a></li>
							<li><a data-bs-toggle="modal" data-bs-target="#Modal1"
								id="btn-modal1"> 회원가입 </a></li>
							<li><a id="logout"> 로그아웃 </a></li>

							<li><a data-bs-toggle="modal" data-bs-target="#Modal3"
								id="btn-modal3"> 회원정보조회 </a></li>
							<li><a data-bs-toggle="modal" data-bs-target="#Modal4"
								id="btn-modal4"> 회원정보변경 </a></li>
						</ul></li>
					<!-- 최상단일때 색반전 주는 코드 추가해야함. -->
					<li><a class="getstarted scrollto" href="#about">SEARCH !</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
		<!-- End Header Container -->
	</div>
</header>