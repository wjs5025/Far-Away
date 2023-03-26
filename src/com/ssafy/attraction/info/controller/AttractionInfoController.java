package com.ssafy.attraction.info.controller;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.attraction.info.model.service.AttractionInfoService;
import com.ssafy.attraction.info.model.service.AttractionInfoServiceImpl;
import com.ssafy.user.model.dto.UserDto;
import com.ssafy.util.ParameterCheck;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "attraction", value = "/attraction")
public class AttractionInfoController extends HttpServlet {
    private AttractionInfoService attractionInfoService;
    private String contentTypeId;
    private String sidoCode;
    private String gugunCode;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        attractionInfoService = AttractionInfoServiceImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        contentTypeId = ParameterCheck.nullToBlank(request.getParameter("content_type_id"));
        sidoCode = ParameterCheck.nullToBlank(request.getParameter("sido_code"));
        gugunCode = ParameterCheck.nullToBlank(request.getParameter("gugun_code"));
        System.out.println(action);
        System.out.println("======검색 키워드 확인======");
        System.out.println(contentTypeId);
        System.out.println(sidoCode);
        System.out.println(gugunCode);
        System.out.println("======확인 완료======");
        String path = "";
        switch (action) {
            case "list":
                path = list(request, response);
                System.out.println("관광지 정보 조회 경로");
                System.out.println(path);
                forward(request, response, path);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        doGet(request, response);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
        response.sendRedirect(request.getContextPath() + path);
    }

    private String list(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userDto != null) {
            try {
                Map<String, String> map = new HashMap<>();
                map.put("sido_code", sidoCode);
                map.put("gugun_code", gugunCode);
                map.put("content_type_id", contentTypeId);

                List<AttractionInfoDto> attractionInfoList = attractionInfoService.getAttractionInfoList(map);
                request.setAttribute("attractionInfoList", attractionInfoList);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "관광지 정보 조회에 실패했습니다.");
            }
            return "/Attraction/attraction_index.jsp?sido_code=" + sidoCode +
                    "&gugun_code=" + gugunCode + "&content_type_id=" + contentTypeId;
        } else {
            return "/User/user_login.jsp";
        }
    }
}
