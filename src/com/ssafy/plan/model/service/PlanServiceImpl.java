package com.ssafy.plan.model.service;

import com.ssafy.plan.model.dao.PlanDao;
import com.ssafy.plan.model.dao.PlanDaoImpl;
import com.ssafy.plan.model.dto.PlanDto;
import com.ssafy.util.PageNavigation;
import com.ssafy.util.ShortestPath;
import com.ssafy.util.SizeConstant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlanServiceImpl implements PlanService {
    private static PlanServiceImpl instance = new PlanServiceImpl();
    private PlanDao planDao;
    private PlanServiceImpl() {
        planDao = PlanDaoImpl.getInstance();
    }

    public static PlanServiceImpl getInstance() {
        return instance;
    }

    @Override
    public void addPlan(PlanDto planDto) throws Exception {
        planDao.addPlan(planDto);
    }

    @Override
    public List<PlanDto> getPlanList(Map<String, String> map) throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        String key = map.get("key");
        param.put("key", key.isEmpty() ? "" : key);
        param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
        int pageNo = Integer.parseInt(map.get("pageNo"));
        int start = pageNo * SizeConstant.LIST_SIZE - SizeConstant.LIST_SIZE;
        param.put("start", start);
        param.put("listSize", SizeConstant.LIST_SIZE);
        return planDao.getPlanList(param);
    }

    @Override
    public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
        PageNavigation pageNavigation = new PageNavigation();

        int naviSize = SizeConstant.NAVIGATION_SIZE;
        int sizePerPage = SizeConstant.LIST_SIZE;
        int currentPage = Integer.parseInt(map.get("pageNo"));

        pageNavigation.setCurrentPage(currentPage);
        pageNavigation.setNaviSize(naviSize);
        Map<String, Object> param = new HashMap<>();
        String key = map.get("key");
        param.put("key", key.isEmpty() ? "" : key);
        param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
        param.put("category", map.get("category"));
        int totalCount = planDao.getTotalPlanCount(param);
        pageNavigation.setTotalCount(totalCount);
        int totalPageCount = (totalCount - 1) / sizePerPage + 1;
        pageNavigation.setTotalPageCount(totalPageCount);
        boolean startRange = currentPage <= naviSize;
        pageNavigation.setStartRange(startRange);
        boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
        pageNavigation.setEndRange(endRange);
        pageNavigation.makeNavigator();

        return pageNavigation;
    }

    @Override
    public PlanDto getPlan(int planId) throws Exception {
        PlanDto planDto = planDao.getPlan(planId);
        double[][] map = makeMap(planDto);
        ShortestPath sp = new ShortestPath(map);
        sp.findShortestPath();
        planDto.setPlanCourse(sp.getResult());
        return planDto;
    }

    private double[][] makeMap(PlanDto plan) {
        String[] input = plan.getTripCourse().split("\\)");
        int size = input.length;
        double[][] map = new double[size][size];
        for (int i = 0; i < size; i++) {
            double x = Double.parseDouble(input[i].split("\\(")[1].split(",")[0]);
            double y = Double.parseDouble(input[i].split("\\(")[1].split(",")[1]);
            for (int j = 0; j < size; j++) {
                if (i == j)
                    continue;
                double nx = Double.parseDouble(input[j].split("\\(")[1].split(",")[0]);
                double ny = Double.parseDouble(input[j].split("\\(")[1].split(",")[1]);
                map[i][j] = Math.sqrt(Math.abs(x - nx) * Math.abs(x - nx) + Math.abs(y - ny) * Math.abs(y - ny));
            }
        }
        return map;
    }

    @Override
    public void updateHit(int planId) throws Exception {
        planDao.updateHit(planId);
    }

    @Override
    public void modifyPlan(PlanDto planDto) throws Exception {
        planDao.modifyPlan(planDto);
    }

    @Override
    public void deletePlan(int planId) throws Exception {
        planDao.deletePlan(planId);
    }
}
