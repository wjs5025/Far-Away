<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                <h1 class="col-md-12 text-center section-header">공지사항</h1>
                <div class="col-md-12 card rounded-0">
                    <div class="card-header">
                        <a class="btn float-end text-white rounded-5"
                           style="background-color: #009970"
                           data-bs-toggle="modal"
                           data-bs-target="#post-write"
                           id="btn-modal2"
                           href="register">
                            <i class="fas fa-edit"></i>
                            WRITE
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody id="posts">
                            <tr>
                                <td>no</td>
                                <td>title</td>
                                <td>writer</td>
                                <td>date</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</section>

<%@ include file="../include/footer.jsp"%>

<!-- 게시글 상세조회-->
<div class="modal modal-xl" id="post-detail-modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">게시글 상세조회</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        id="post-detail-close-btn"
                ></button>
            </div>
            <div class="modal-body">
                No.<span id="detail-no">no</span>
                <h3 id="detail-title" class="mb-3">title</h3>
                <div style="display: flex; justify-content: flex-end">
                    <input type="button" value="글 삭제" onclick="postRemove()"/>
                </div>
                작성자 :
                <span id="detail-writer" class="mb-3">writer</span>
                <div id="detail-date" class="mb-3">date</div>
                <div
                        id="detail-content"
                        class="mb-3 border"
                        style="min-height: 300px; padding: 20px; border-radius: 5px"
                >
                    content
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 게시글 작성-->
<div class="modal modal-xl" id="post-write" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">게시글 작성</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        id="post-add-close-btn"
                ></button>
            </div>
            <div class="modal-body">
                <input
                        id="add-post-title"
                        class="mb-3"
                        style="width: 100%"
                        placeholder="제목"
                />
                <input
                        id="add-post-writer"
                        class="mb-3"
                        style="width: 100%"
                        readonly
                />
                <textarea
                        id="add-post-content"
                        class="mb-3 border"
                        style="
                resize: none;
                min-height: 300px;
                padding: 20px;
                border-radius: 5px;
                width: 100%;
              "
                        value=""
                ></textarea>
                <div style="display: flex; justify-content: flex-end">
                    <input type="button" value="글 작성" onclick="postAdd()"/>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../assets/js/register.js"></script>
<a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

<!-- Vendor JS Files -->
<script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="../assets/vendor/aos/aos.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../assets/js/main.js"></script>
<script src="../assets/js/register.js"></script>
<script src="../assets/js/board.js"></script>
</body>
</html>
