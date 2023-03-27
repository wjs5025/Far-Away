package com.ssafy.attraction.info.controller;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.attraction.info.model.service.AttractionInfoService;
import com.ssafy.attraction.info.model.service.AttractionInfoServiceImpl;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.user.model.dto.UserDto;
import com.ssafy.util.PageNavigation;
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
    private String queryString;
    private int pageNo;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        attractionInfoService = AttractionInfoServiceImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        pageNo = ParameterCheck.notNumberToOne(request.getParameter("page_no"));
        contentTypeId = ParameterCheck.nullToBlank(request.getParameter("content_type_id"));
        sidoCode = ParameterCheck.nullToBlank(request.getParameter("sido_code"));
        gugunCode = ParameterCheck.nullToBlank(request.getParameter("gugun_code"));
        queryString = "?page-no=" + pageNo + "&sido_code=" + sidoCode + "&gugun_code=" + gugunCode + "&content_type_id=" + contentTypeId;
        String path = "";
        switch (action) {
            case "list":
                path = list(request, response);
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
                map.put("page_no", pageNo + "");
                map.put("sido_code", sidoCode);
                map.put("gugun_code", gugunCode);
                map.put("content_type_id", contentTypeId);
                System.out.println("=====list 메소드=====");
                System.out.println("page_no: " + pageNo);
                System.out.println("sido_code: " + sidoCode);
                System.out.println("gugun_code: " + gugunCode);
                System.out.println("content_type_id: " + contentTypeId);

                List<AttractionInfoDto> attractionInfoList = attractionInfoService.getAttractionInfoList(map);
                request.setAttribute("attractionInfoList", attractionInfoList);

                PageNavigation pageNavigation = attractionInfoService.makePageNavigation(map);
                request.setAttribute("page_navigation", pageNavigation);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "관광지 정보 조회에 실패했습니다.");
            }
            return "/Attraction/attraction_index.jsp" + queryString;
        } else {
            return "/user/user-login.jsp";
        }
    }
}
