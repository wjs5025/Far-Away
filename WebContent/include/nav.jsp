<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

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
                    <li class="dropdown">
                        <a href="#">
                            <c:if test="${empty user}">
                                <span id="account">계정</span>
                            </c:if>
                            <c:if test="${not empty user}">
                                <span id="account">${user.userName} 님</span>
                            </c:if>
                            <i class="bi bi-chevron-down"></i>
                        </a>
                        <ul>
                            <c:if test="${empty user}">
                                <li><a class="nav-link scrollto" href="/user?action=mv-login"> 로그인 </a></li>
                                <li><a class="nav-link scrollto" href="/user?action=mv-regist"> 회원가입 </a></li>
                            </c:if>
                            <c:if test="${not empty user}">
                                <li><a class="nav-link scrollto" href="../user?action=logout"> 로그아웃 </a></li>
                                <li><a class="nav-link scrollto" href="/user?action=mv-info"> 회원정보조회 </a></li>
                                <li><a class="nav-link scrollto" href="/User/user_modify.jsp"> 회원정보변경 </a></li>
                            </c:if>
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
