package com.ssafy.attraction.info.controller;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.attraction.info.model.service.AttractionInfoService;
import com.ssafy.attraction.info.model.service.AttractionInfoServiceImpl;
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
        pageNo = ParameterCheck.notNumberToOne(request.getParameter("pageNo"));
        contentTypeId = ParameterCheck.nullToBlank(request.getParameter("contentTypeId"));
        sidoCode = ParameterCheck.nullToBlank(request.getParameter("sidoCode"));
        gugunCode = ParameterCheck.nullToBlank(request.getParameter("gugunCode"));
        queryString = "?pageNo=" + pageNo + "&sidoCode=" + sidoCode + "&gugunCode=" + gugunCode + "&contentTypeId=" + contentTypeId;
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
                map.put("pageNo", pageNo + "");
                map.put("sidoCode", sidoCode);
                map.put("gugunCode", gugunCode);
                map.put("contentTypeId", contentTypeId);

                List<AttractionInfoDto> attractionInfoList = attractionInfoService.getAttractionInfoList(map);
                request.setAttribute("attractionInfoList", attractionInfoList);

                PageNavigation pageNavigation = attractionInfoService.makePageNavigation(map);
                request.setAttribute("navigation", pageNavigation);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "관광지 정보 조회에 실패했습니다.");
            }
            return "/attraction/attraction-index.jsp" + queryString;
        } else {
            return "/user/user-login.jsp";
        }
    }
}
