package com.ssafy.user.controller;


import com.ssafy.user.model.dto.UserDto;
import com.ssafy.user.model.service.UserService;
import com.ssafy.user.model.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private UserService userService;

    public void init() {
        userService = UserServiceImpl.getUserService();
        System.out.println(userService);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 넘겨받는 액션
        String action = req.getParameter("action");

        switch (action) {
            case "mv-regist":
                resp.sendRedirect(req.getContextPath() + "/User/user_regist.jsp");
                break;
            case "regist":
                regist(req, resp);
                resp.sendRedirect(req.getContextPath() + "/User/user_login.jsp");
                break;
            case "mv-login":
                resp.sendRedirect(req.getContextPath() + "/User/user_login.jsp");
                break;
            case "login":
                login(req, resp);
                break;
            case "logout":
                logout(req, resp);
                resp.sendRedirect("/index.jsp");
                break;
            case "mv-find":
                resp.sendRedirect(req.getContextPath() + "/regist.jsp");
                break;
            case "find":
                break;
            case "mv-info":
                resp.sendRedirect(req.getContextPath() + "/regist.jsp");
                break;
            case "modify-info":
                resp.sendRedirect(req.getContextPath() + "/regist.jsp");
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post로 받음");
        req.setCharacterEncoding("utf-8");
        doGet(req, resp);
    }

    private void regist(HttpServletRequest req, HttpServletResponse resp) {
        UserDto userDto = new UserDto();
        userDto.setUserId(req.getParameter("user_id"));
        userDto.setUserPwd(req.getParameter("user_password"));
        userDto.setUserName(req.getParameter("user_name"));
        userDto.setEmailId(req.getParameter("email_id"));
        userDto.setEmailDomain(req.getParameter("email_domain"));


        try {
            System.out.println(userService.regist(userDto));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) {
        String userId = req.getParameter("user_id");
        String userPassword = req.getParameter("user_password");

        UserDto userDto = null;
        try {
            userDto = userService.login(userId, userPassword);
            if (userDto == null) {
                System.out.println("로그인 실패");
                resp.sendRedirect(req.getContextPath() + "/User/user_login.jsp");
            } else {
                // session 설정
                HttpSession session = req.getSession();
                session.setAttribute("user", userDto);

                // cookie 설정
                String idSave = req.getParameter("save_id");
                System.out.println("아이디세이브" + idSave);
                if (idSave != null) {
                    Cookie cookie = new Cookie("user_id", userId);
                    cookie.setPath(req.getContextPath());
                    cookie.setMaxAge(60 * 60 * 24 * 7);
                    resp.addCookie(cookie);
                } else {
                    Cookie[] cookies = req.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user_id")) {
                                cookie.setMaxAge(0);
                                resp.addCookie(cookie);
                                break;
                            }
                        }
                    }
                }
                resp.sendRedirect("/index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(userDto);
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        session.invalidate();
    }
}