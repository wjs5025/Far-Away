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
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="assets/vendor/glightbox/css/glightbox.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: Bethany
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

    <!-- api keys -->

    <script src="./assets/js/api_config.js"></script>
    <!-- kakao map api -->
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8510df0d52f1a6b3d7e4cefe66c42714"
    ></script>
  </head>

  <body>
    <!-- NavBar -->
    <%@ include file="/include/navBar.jsp" %>

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
      <div
        class="container text-center position-relative"
        data-aos="fade-in"
        data-aos-delay="200"
      >
        <h1 id="main-title">메인 타이틀</h1>
        <h2>당신에게 꼭 맞는 여행지를 검색해보세요</h2>
        <a href="index.html#about" class="btn-get-started scrollto">SEARCH !</a>
      </div>
    </section>
    <!-- End Hero -->

    <main id="main">
      <!-- ======= About Section ======= -->
      <section id="about" class="about">
        <div class="container align-items-center">
          <!-- 중앙 center content end -->
          <h1 class="my-5 col-md-12 text-center section-header">
            지역별 여행지
          </h1>
          <div class="d-flex flex-row">
            <div id="map" class="col-md-6" style="height: 600px"></div>

            <div class="col-md-6 ps-5">
              <!-- 관광지 검색 start -->
              <form
                class="d-flex m-3"
                role="search"
                onsubmit="event.preventDefault(); Search();"
              >
                <select
                  id="search-area"
                  class="form-select mx-2"
                  aria-label="Default select example"
                  onchange="getSigunguData()"
                >
                  <option value="0" selected>전체 지역</option>
                </select>
                <select
                  id="search-sigunguCode"
                  class="form-select mx-2"
                  aria-label="Default select example"
                >
                  <option value="0" selected>시/군/구</option>
                </select>
                <select
                  id="search-content-id"
                  class="form-select mx-2"
                  aria-label="Default select example"
                >
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
                <button
                  id="btn-search"
                  class="btn btn-outline-success"
                  type="button"
                  onclick="Search()"
                >
                  SEARCH
                </button>
              </form>
              <div class="row">
                <table class="table table-striped" id="trip-list">
                  <tbody>
                    <td style="text-align: center">
                      검색 조건을 설정 후 검색하세요
                    </td>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 관광지 검색 end -->
          </div>
        </div>
      </section>
      <!-- End About Section -->

      <!-- ======= Cta Section ======= -->
      <section id="cta" class="cta">
        <div class="container">
          <div class="text-center" data-aos="zoom-in">
            <h3>한국 관광 공사</h3>
            <p>
              한국 관광 공사 웹페이지에 방문하여, 더 자세한 관광 정보를
              얻어보세요 !
            </p>
            <a
              class="cta-btn"
              href="https://kto.visitkorea.or.kr/kor.kto"
              target="_bl
            "
              >바로가기</a
            >
          </div>
        </div>
      </section>
      <!-- End Cta Section -->

      <!-- ======= Services Section ======= -->
      <section id="services" class="services section-bg">
        <div class="container">
          <div class="row">
            <div class="col-lg-4">
              <div class="section-title" data-aos="fade-right">
                <h2>나의 여행 계획</h2>
                <p>
                  내 맘대로 여행코스😎 <br />나의 여행 계획을 마음껏
                  자랑해보세요 !
                </p>
              </div>
            </div>
            <div class="col-lg-8">
              <div class="row">
                <div class="col-md-6 d-flex align-items-stretch">
                  <div class="icon-box" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon"><i class="bx bxl-dribbble"></i></div>
                    <h4><a href="">전국 외곽 순환 여행</a></h4>
                    <p>
                      Voluptatum deleniti atque corrupti quos dolores et quas
                      molestias excepturi
                    </p>
                  </div>
                </div>

                <div class="col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                  <div class="icon-box" data-aos="zoom-in" data-aos-delay="200">
                    <div class="icon"><i class="bx bx-file"></i></div>
                    <h4><a href="">떠나요 제주도</a></h4>
                    <p>
                      Duis aute irure dolor in reprehenderit in voluptate velit
                      esse cillum dolore
                    </p>
                  </div>
                </div>

                <div class="col-md-6 d-flex align-items-stretch mt-4">
                  <div class="icon-box" data-aos="zoom-in" data-aos-delay="300">
                    <div class="icon"><i class="bx bx-tachometer"></i></div>
                    <h4><a href="">테마 여행</a></h4>
                    <p>
                      Excepteur sint occaecat cupidatat non proident, sunt in
                      culpa qui officia
                    </p>
                  </div>
                </div>

                <div class="col-md-6 d-flex align-items-stretch mt-4">
                  <div class="icon-box" data-aos="zoom-in" data-aos-delay="400">
                    <div class="icon"><i class="bx bx-world"></i></div>
                    <h4><a href="">춘천 닭갈비 여행</a></h4>
                    <p>
                      At vero eos et accusamus et iusto odio dignissimos ducimus
                      qui blanditiis
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Services Section -->

      <!-- ======= Portfolio Section ======= -->
      <section id="portfolio" class="portfolio">
        <div class="container">
          <div class="section-title" data-aos="fade-left">
            <h2>핫플 자랑하기</h2>
            <p>우리 동네 🔥핫🔥 플레이스를 소개합니다 !</p>
          </div>

          <div class="row" data-aos="fade-up" data-aos-delay="100">
            <div class="col-lg-12 d-flex justify-content-center">
              <ul id="portfolio-flters">
                <li data-filter="*" class="filter-active">All</li>
                <li data-filter=".filter-app">쇼핑</li>
                <li data-filter=".filter-card">디저트</li>
                <li data-filter=".filter-web">자연</li>
              </ul>
            </div>
          </div>

          <div
            class="row portfolio-container"
            data-aos="fade-up"
            data-aos-delay="200"
          >
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-1.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>App 1</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-1.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="App 1"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-web">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-2.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Web 3</h4>
                  <p>Web</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-2.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Web 3"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-3.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>App 2</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-3.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="App 2"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-4.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Card 2</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-4.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Card 2"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-web">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-5.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Web 2</h4>
                  <p>Web</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-5.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Web 2"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-6.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>App 3</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-6.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="App 3"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-7.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Card 1</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-7.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Card 1"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-8.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-8.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Card 3"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 portfolio-item filter-web">
              <div class="portfolio-wrap">
                <img
                  src="assets/img/portfolio/portfolio-9.jpg"
                  class="img-fluid"
                  alt=""
                />
                <div class="portfolio-info">
                  <h4>Web 3</h4>
                  <p>Web</p>
                  <div class="portfolio-links">
                    <a
                      href="assets/img/portfolio/portfolio-9.jpg"
                      data-gallery="portfolioGallery"
                      class="portfolio-lightbox"
                      title="Web 3"
                      ><i class="bx bx-plus"></i
                    ></a>
                    <a href="portfolio-details.html" title="More Details"
                      ><i class="bx bx-link"></i
                    ></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Portfolio Section -->
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <%@ include file="/include/footer.jsp" %>
  
  
  
    <!-- 회원가입 -->

    <div class="modal" id="Modal1" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">회원 가입</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="close-register"
            ></button>
          </div>
          <div class="modal-body">
            <form action="" id="register-form1" method="get">
              <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input
                  type="text"
                  class="form-control"
                  id="memberName"
                  placeholder="이름"
                />
              </div>
              <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input
                  type="text"
                  class="form-control"
                  id="memberId"
                  placeholder="아이디"
                />
              </div>
              <div class="mb-3">
                <label for="pw" class="form-label">비밀번호</label>
                <input
                  type="password"
                  class="form-control"
                  id="memberPw"
                  placeholder="비밀번호"
                />
              </div>
              <div class="mb-3">
                <label for="pwcheck" class="form-label">비밀번호 확인</label>
                <span id="pwCheckmessage">비밀번호 불일치</span>
                <input
                  type="password"
                  class="form-control"
                  id="memberPwCheck"
                  placeholder="비밀번호 확인"
                />
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input
                  type="email"
                  class="form-control"
                  id="memberEmail"
                  placeholder="이메일"
                  required
                />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="register">
                  회원가입
                </button>
                <button type="reset" class="btn btn-primary" id="reset1">
                  초기화
                </button>
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  닫기
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 로그인 모달 -->
    <div class="modal" id="Modal2" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">로그인</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="close-register2"
            ></button>
          </div>
          <div class="modal-body">
            <form action="" id="login-form">
              <div class="mb-3">
                <label for="login" class="form-label">아이디</label>
                <input
                  type="text"
                  class="form-control"
                  id="loginId"
                  placeholder="아이디"
                />
              </div>
              <div class="mb-3">
                <label for="login" class="form-label">비밀번호</label>
                <input
                  type="password"
                  class="form-control"
                  id="loginPw"
                  placeholder="비밀번호"
                />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="login">
                  로그인
                </button>
                <button type="reset" class="btn btn-primary" id="reset2">
                  초기화
                </button>
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  닫기
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 회원 정보 조회 -->
    <div class="modal" id="Modal3" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">회원 정보 조회</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="close-register3"
            ></button>
          </div>
          <div class="modal-body">
            <form action="" id="register-form3" method="get">
              <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input
                  type="text"
                  class="form-control"
                  id="showName"
                  placeholder="이름"
                  readonly
                />
              </div>
              <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input
                  type="text"
                  class="form-control"
                  id="showId"
                  placeholder="아이디"
                  readonly
                />
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input
                  type="email"
                  class="form-control"
                  id="showEmail"
                  placeholder="이메일"
                  readonly
                />
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  닫기
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 회원정보 수정 및 삭제 -->
    <div class="modal" id="Modal4" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">회원 정보 수정 및 삭제</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="close-register4"
            ></button>
          </div>
          <div class="modal-body">
            <form action="" id="register-form4" method="get">
              <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input
                  type="text"
                  class="form-control"
                  id="nowName"
                  placeholder="이름"
                />
              </div>
              <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <span>(변경 불가)</span>
                <input
                  type="text"
                  class="form-control"
                  id="nowId"
                  placeholder="아이디"
                  readonly
                />
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input
                  type="email"
                  class="form-control"
                  id="nowEmail"
                  placeholder="이메일"
                />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="change">
                  변경
                </button>
                <button type="button" class="btn btn-primary" id="delete">
                  삭제
                </button>
                <button type="reset" class="btn btn-primary" id="reset3">
                  초기화
                </button>
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  닫기
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="./assets/js/register.js"></script>
    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <!-- 카카오맵 -->
    <script src="./assets/js/kakaoMap.js"></script>

    <!-- tour.js -->
    <script src="./assets/js/tour.js"></script>

    <!-- page js -->
    <script src="./assets/js/page.js"></script>
  </body>
</html>
