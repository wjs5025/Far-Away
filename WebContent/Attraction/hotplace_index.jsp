<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/include/head.jsp" %>
    <title>Far Away : 핫플자랑하기</title>
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
            <div class="card container align-items-center rounded-0 mt-5">
                <div class="section-title" data-aos="fade-left">
                    <h2 class="col-md-12 text-center section-header">핫플 자랑하기</h2>
                    <p>우리 동네 🔥핫🔥 플레이스를 소개합니다 !</p>
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

                    <div class="col-lg-4 col-md-6 hotplace-item filter-app">
                        <div class="hotplace-wrap">
                            <img src="../assets/img/hotplace/hotplace-2.jpg" class="img-fluid"
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
                </div>
            </div>
        </main>
    </div>
</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>