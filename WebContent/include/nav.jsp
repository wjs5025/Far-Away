<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container">
        <div
                class="header-container d-flex align-items-center justify-content-between">
            <div class="logo">
                <h1 class="text-light">

                    <a href="../index.jsp"><span>FAR AWAY</span></a>
                </h1>
            </div>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto active" href="../index.jsp#hero">INTRO</a>
                    </li>
                    <li><a class="nav-link scrollto"
                           href="../Attraction/attraction_index.jsp">지역별 여행지</a></li>
                    <li><a class="nav-link scrollto" href="../Route/route_index.jsp">나의
                        여행계획</a></li>
                    <li><a class="nav-link scrollto" href="../Attraction/hotplace_index.jsp">핫플 자랑하기</a>
                    </li>
                    <li class="dropdown">
                        <a href="#">
                            <span>여행정보 공유</span>
                            <i class="bi bi-chevron-down"></i>
                        </a>
                        <ul>
                            <li><a class="nav-link scrollto" href="../Board/notice_list.jsp">공지사항</a></li>
                            <li><a class="nav-link scrollto" href="../Board/share_list.jsp">공유게시판</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><span
                            id="account">계정</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a class="nav-link scrollto" href="../User/user_login.jsp"> 로그인 </a></li>
                            <li><a class="nav-link scrollto" href="../User/user_regist.jsp"> 회원가입 </a></li>
                            <li><a id="logout"> 로그아웃 </a></li>

                            <li><a data-bs-toggle="modal" data-bs-target="#Modal3"
                                   id="btn-modal3"> 회원정보조회 </a></li>
                            <li><a data-bs-toggle="modal" data-bs-target="#Modal4"
                                   id="btn-modal4"> 회원정보변경 </a></li>
                        </ul>
                    </li>
                    <li>
                        <div style="width: 20px"></div>
                    </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
        </div>
    </div>

</header>