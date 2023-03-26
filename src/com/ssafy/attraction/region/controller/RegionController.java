package com.ssafy.attraction.region.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.attraction.region.model.dto.GugunDto;
import com.ssafy.attraction.region.model.dto.SidoDto;
import com.ssafy.attraction.region.model.service.RegionService;
import com.ssafy.attraction.region.model.service.RegionServiceImpl;
import com.ssafy.util.ParameterCheck;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "region", value = "/region")
public class RegionController extends HttpServlet {
    private RegionService regionService = null;
    private String sidoCode = "";
    private List<SidoDto> sidoList = null;
    private List<GugunDto> gugunList = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        regionService = RegionServiceImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        sidoCode = ParameterCheck.nullToBlank(request.getParameter("sidoCode"));
        if (sidoCode.isEmpty()) {
            try {
                sidoList = regionService.getSidoList();
                ObjectMapper objectMapper = new ObjectMapper();
                String sidoListJson = objectMapper.writeValueAsString(sidoList);
                response.setContentType("application/x-json; charset=utf-8");
                response.getWriter().println(sidoListJson);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
