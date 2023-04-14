package com.ssafy.user.controller;


import com.ssafy.user.model.dto.UserDto;
import com.ssafy.user.model.service.UserService;
import com.ssafy.user.model.service.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private UserService userService;
    private UserDto userDto;
    public void init() {
        userService = UserServiceImpl.getInstance();
        userDto = null;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 넘겨받는 액션
        String action = req.getParameter("action");
        System.out.println(action);
        switch (action) {
            case "mv-regist":
                redirect(req, resp, "/user/user-regist.jsp");
                break;
            case "regist":
                regist(req, resp);
                break;
            case "mv-login":
                redirect(req, resp, "/user/user-login.jsp");
                break;
            case "login":
                login(req, resp);
                break;
            case "logout":
                logout(req, resp);
                break;
            case "mv-modify":
                redirect(req, resp, "/user/user-modify.jsp");
                break;
            case "modify":
                modify(req, resp);
                break;
            case "delete":
                delete(req, resp);
                redirect(req, resp, "/");
                break;
            case "mv-find":
                redirect(req, resp, "/user/user-find.jsp");
                break;
            case "find":
                find(req,resp);
                break;
            case "mv-info":
                redirect(req, resp, "/user/user-info.jsp");
                break;
            default:
                redirect(req, resp, "");
                break;
        }

    }



    private void redirect(HttpServletRequest req, HttpServletResponse resp, String path) throws IOException {
        System.out.println(req.getContextPath() + path);
        resp.sendRedirect(req.getContextPath() + path);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        doGet(req, resp);
    }

    private void regist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        userDto = new UserDto();
        userDto.setUserId(req.getParameter("user-id"));
        userDto.setUserPwd(req.getParameter("user-password"));
        userDto.setUserName(req.getParameter("user-name"));
        userDto.setEmailId(req.getParameter("email-id"));
        userDto.setEmailDomain(req.getParameter("email-domain"));

        try {
            if (userService.regist(userDto) == 1) {
                redirect(req, resp, "/user/user-login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "회원가입에 실패했습니다. 이미 사용 중인 아이디입니다.");
            System.out.println(req.getAttribute("msg"));
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) {
        String userId = req.getParameter("user-id");
        String userPassword = req.getParameter("user-password");

        userDto = null;
        try {
            userDto = userService.login(userId, userPassword);
            if (userDto == null) {
                System.out.println("로그인 실패");
                req.setAttribute("msg", "로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.");
                System.out.println(req.getAttribute("msg"));
                forward(req, resp, "/user/user-login.jsp");
            } else {
                // session 설정
                HttpSession session = req.getSession();
                session.setAttribute("user", userDto);

                // cookie 설정
                String idSave = req.getParameter("save_id");

                if (idSave != null) {
                    Cookie cookie = new Cookie("user-id", userId);
                    cookie.setPath(req.getContextPath());
                    cookie.setMaxAge(60 * 60 * 24 * 7);
                    resp.addCookie(cookie);
                } else {
                    Cookie[] cookies = req.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user-id")) {
                                cookie.setMaxAge(0);
                                resp.addCookie(cookie);
                                break;
                            }
                        }
                    }
                }
                System.out.println("로그인 성공!");
                redirect(req, resp, "/");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        session.invalidate();
    }

    private void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String userPwd = ((UserDto) session.getAttribute("user")).getUserPwd();

        // 비밀번호가 일치하면 변경 가능.
        if (req.getParameter("user-password").equals(userPwd)) {
            userDto = new UserDto();

            userDto.setUserId(req.getParameter("user-id"));
            userDto.setUserPwd(req.getParameter("user-password"));
            userDto.setUserName(req.getParameter("user-name"));
            userDto.setEmailId(req.getParameter("email-id"));
            userDto.setEmailDomain(req.getParameter("email-domain"));

            try {
                userService.modifyUser(userDto);
                session.setAttribute("user", userDto);
                redirect(req, resp, "/");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("msg", "회원 수정에 실패했습니다. 비밀번호를 확인해주세요.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();

        try {
            userService.deleteUser(((UserDto) session.getAttribute("user")).getUserId());
            session.removeAttribute("user");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "회원 탈퇴에 실패했습니다.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void find(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        userDto = new UserDto();
        userDto.setUserId(req.getParameter("user-id"));
        userDto.setUserName(req.getParameter("user-name"));
        userDto.setEmailId(req.getParameter("email-id"));
        userDto.setEmailDomain(req.getParameter("email-domain"));

        try {
            String userPwd = userService.findUserPwd(userDto);
            System.out.println(userDto);
            System.out.println(userPwd);
            if (userPwd == null){
                throw new Exception();
            }
            req.setAttribute("user-id",userDto.getUserId());
            req.setAttribute("user-password", userPwd);
            forward(req,resp,"/user/user-find-result.jsp.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "비밀번호 찾기 실패 : 입력하신 정보와 일치하는 회원이 없습니다.");
            forward(req, resp, "/error/error.jsp");
        }
    }
}