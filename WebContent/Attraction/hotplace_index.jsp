<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>TRAVEL MAKER</title>
    <meta content="" name="description"/>
    <meta content="" name="keywords"/>

    <%@ include file="/include/import_styles.jsp" %>
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
            <div class="card container align-items-center rounded-0 mt-5"  >
            <div class="section-title" data-aos="fade-left">
                <h2>핫플 자랑하기</h2>
                <p>우리 동네 🔥핫🔥 플레이스를 소개합니다 !</p>
            </div>

            <div class="row" data-aos="fade-up" data-aos-delay="100">
                <div class="col-lg-12 d-flex justify-content-center">
                    <ul id="hotplace-flters">
                        <li data-filter="*" class="filter-active">All</li>
                        <li data-filter=".filter-app">쇼핑</li>
                        <li data-filter=".filter-card">디저트</li>
                        <li data-filter=".filter-web">자연</li>
                    </ul>
                </div>
            </div>

            <div class="row hotplace-container" data-aos="fade-up"
                 data-aos-delay="200">
                <div class="col-lg-4 col-md-6 hotplace-item filter-app">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-1.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>App 1</h4>
                            <p>App</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-1.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="App 1"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-web">
                    <div class="hotplace-wrap">
                        <img src=../assets/img/hotplace/hotplace-2.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Web 3</h4>
                            <p>Web</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-2.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Web 3"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-app">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-3.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>App 2</h4>
                            <p>App</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-3.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="App 2"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-card">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-4.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Card 2</h4>
                            <p>Card</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-4.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Card 2"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-web">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-5.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Web 2</h4>
                            <p>Web</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-5.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Web 2"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-app">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-6.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>App 3</h4>
                            <p>App</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-6.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="App 3"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-card">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-7.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Card 1</h4>
                            <p>Card</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-7.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Card 1"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-card">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-8.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Card 3</h4>
                            <p>Card</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-8.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Card 3"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 hotplace-item filter-web">
                    <div class="hotplace-wrap">
                        <img src="../assets/img/hotplace/hotplace-9.jpg" class="img-fluid"
                             alt=""/>
                        <div class="hotplace-info">
                            <h4>Web 3</h4>
                            <p>Web</p>
                            <div class="hotplace-links">
                                <a href="../assets/img/hotplace/hotplace-9.jpg"
                                   data-gallery="hotplaceGallery" class="hotplace-lightbox"
                                   title="Web 3"><i class="bx bx-plus"></i></a> <a
                                    href="hotplace-details.html" title="More Details"><i
                                    class="bx bx-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>