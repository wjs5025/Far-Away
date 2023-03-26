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
                redirect(req, resp, "/User/user_regist.jsp");
                break;
            case "regist":
                regist(req, resp);
                break;
            case "mv-login":
                redirect(req, resp, "/User/user_login.jsp");
                break;
            case "login":
                login(req, resp);
                break;
            case "logout":
                logout(req, resp);
                redirect(req, resp, "/");
                break;
            case "mv-modify":
                redirect(req, resp, "/User/user_modify.jsp");
                break;
            case "modify":
                modify(req, resp);
                break;
            case "delete" :
                delete(req,resp);
                redirect(req,resp,"/");
                break;
            case "mv-find":
                redirect(req, resp, "/regist.jsp");
                break;
            case "find":
                break;
            case "mv-info":
                redirect(req, resp, "/User/user_info.jsp");
                break;
            default:
                break;
        }

    }

    private void redirect(HttpServletRequest req, HttpServletResponse resp, String path) throws IOException {
        resp.sendRedirect(req.getContextPath() + path);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post로 받음");
        req.setCharacterEncoding("utf-8");
        doGet(req, resp);
    }

    private void regist(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        UserDto userDto = new UserDto();
        userDto.setUserId(req.getParameter("user_id"));
        userDto.setUserPwd(req.getParameter("user_password"));
        userDto.setUserName(req.getParameter("user_name"));
        userDto.setEmailId(req.getParameter("email_id"));
        userDto.setEmailDomain(req.getParameter("email_domain"));

        try {
            if(userService.regist(userDto) == 1) {
                redirect(req, resp, "/User/user_login.jsp");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "회원가입에 실패했습니다. 이미 사용 중인 아이디입니다.");
            System.out.println(req.getAttribute("msg"));
            forward(req,resp,"/error/error.jsp");
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
                req.setAttribute("msg", "로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.");
                System.out.println(req.getAttribute("msg"));
                forward(req, resp, "/User/user_login.jsp");
            } else {
                // session 설정
                HttpSession session = req.getSession();
                session.setAttribute("user", userDto);

                // cookie 설정
                String idSave = req.getParameter("save_id");

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

    private void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String userPwd = ((UserDto) session.getAttribute("user")).getUserPwd();

        // 비밀번호가 일치하면 변경 가능.
        if (req.getParameter("user_password").equals(userPwd)) {
            UserDto modifiedUserDto = new UserDto();

            modifiedUserDto.setUserId(req.getParameter("user_id"));
            modifiedUserDto.setUserPwd(req.getParameter("user_password"));
            modifiedUserDto.setUserName(req.getParameter("user_name"));
            modifiedUserDto.setEmailId(req.getParameter("email_id"));
            modifiedUserDto.setEmailDomain(req.getParameter("email_domain"));

            try {
                userService.modifyUser(modifiedUserDto);
                session.setAttribute("user", modifiedUserDto);
                redirect(req, resp, "/");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("수정 실패 (비밀번호 오류)");
            try {
                redirect(req, resp, "/User/user_modify.jsp");
            } catch (IOException e) {
                e.printStackTrace();
                req.setAttribute("msg", "회원 수정에 실패했습니다. 비밀번호를 확인해주세요.");
                redirect(req,resp,"/error/error.jsp");
            }
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();

        try {
            userService.deleteUser(((UserDto) session.getAttribute("user")).getUserId());
            session.removeAttribute("user");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "회원 탈퇴에 실패했습니다.");
            redirect(req,resp,"/error/error.jsp");
        }
    }
}