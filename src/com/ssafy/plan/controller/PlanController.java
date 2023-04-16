package com.ssafy.plan.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.plan.model.dto.PlanDto;
import com.ssafy.plan.model.service.PlanService;
import com.ssafy.plan.model.service.PlanServiceImpl;
import com.ssafy.user.model.dto.UserDto;
import com.ssafy.util.PageNavigation;
import com.ssafy.util.ParameterCheck;

@WebServlet("/plan")
public class PlanController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private int pageNo;
    private String key;
    private String word;
    private String queryStrig;

    private PlanService planService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        planService = PlanServiceImpl.getInstance();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        pageNo = ParameterCheck.notNumberToOne(request.getParameter("pageNo"));
        key = ParameterCheck.nullToBlank(request.getParameter("key"));
        word = ParameterCheck.nullToBlank(request.getParameter("word"));
        queryStrig = "?pageNo=" + pageNo + "&key=" + key + "&word=" + URLEncoder.encode(word, "utf-8");

        String path = "";
        if ("planlist".equals(action)) {
            path = planlist(request, response);
            forward(request, response, path);
        } else if ("planview".equals(action)) {
            path = planView(request, response);
            forward(request, response, path);
        } else if ("mvplanwrite".equals(action)) {
            path = mvPlanWrite(request, response);
            forward(request, response, path);
        } else if ("planregist".equals(action)) {
            path = planRegist(request, response);
            forward(request, response, path);
        } else {
            redirect(request, response, path);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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


    private String planlist(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<String, String> map = new HashMap<String, String>();
            map.put("pageNo", pageNo + "");
            map.put("key", key);
            map.put("word", word);

            List<PlanDto> list = planService.getPlanList(map); // 글 목록
            request.setAttribute("articles", list);

            PageNavigation pageNavigation = planService.makePageNavigation(map);
            request.setAttribute("navigation", pageNavigation);

            return "/plan/plan-index.jsp" + queryStrig;
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "글목록 출력 중 문제 발생!!!");
            return "/error/error.jsp";
        }

    }

    private String planView(HttpServletRequest request, HttpServletResponse response) {

        int articleNo = Integer.parseInt(request.getParameter("articleno"));
        try {
            planService.updateHit(articleNo);
            PlanDto planDto = planService.getPlan(articleNo);
            System.out.println(planDto.getPlanCourse());
            request.setAttribute("plan", planDto);
            return "/plan/plan-detail.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "글내용 출력 중 문제 발생!!!");
            return "/error/error.jsp";
        }
    }

    private String mvPlanWrite(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");

        if (userDto == null) {
            return "/user/user-login.jsp";
        } else {
            return "/plan/plan-write.jsp";
        }
    }

    private String planRegist(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userDto != null) {
            PlanDto planDto = new PlanDto();
            planDto.setTitle(request.getParameter("subject"));
            planDto.setUserId(userDto.getUserId());
            planDto.setDepartureTime(request.getParameter("departuretime"));
            planDto.setArrivalTime(request.getParameter("arrivaltime"));
            planDto.setContent(request.getParameter("content"));
            planDto.setTripCourse(request.getParameter("tripcourse"));

            try {
                planService.addPlan(planDto);
                return "/plan?action=planlist";
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "글작성 중 문제 발생!!!");
                return "/error/error.jsp";
            }
        } else {
            return "/user/user-login.jsp";
        }
    }
}
