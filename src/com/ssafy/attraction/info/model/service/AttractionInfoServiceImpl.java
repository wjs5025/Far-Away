package com.ssafy.attraction.info.model.service;

import com.ssafy.attraction.info.model.dao.AttractionInfoDao;
import com.ssafy.attraction.info.model.dao.AttractionInfoDaoImpl;
import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.util.PageNavigation;
import com.ssafy.util.SizeConstant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AttractionInfoServiceImpl implements AttractionInfoService {
    private static AttractionInfoServiceImpl instance = new AttractionInfoServiceImpl();
    private AttractionInfoDao attractionInfoDao;

    private AttractionInfoServiceImpl() {
        attractionInfoDao = AttractionInfoDaoImpl.getInstance();
    }

    public static AttractionInfoServiceImpl getInstance() {
        return instance;
    }

    @Override
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> map) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("sido_code", map.get("sido_code"));
        param.put("gugun_code", map.get("gugun_code"));
        param.put("content_type_id", map.get("content_type_id"));

        int pageNo = Integer.parseInt(map.get("page_no"));
        int start = pageNo * SizeConstant.LIST_SIZE - SizeConstant.LIST_SIZE;
        param.put("start", start);
        param.put("list_size", SizeConstant.LIST_SIZE);
        return attractionInfoDao.getAttractionInfoList(param);
    }

    @Override
    public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
        PageNavigation pageNavigation = new PageNavigation();

        int navigationSize = SizeConstant.NAVIGATION_SIZE;
        int pageSize = SizeConstant.LIST_SIZE;
        int currentPage = Integer.parseInt(map.get("page_no"));

        pageNavigation.setCurrentPage(currentPage);
        pageNavigation.setNaviSize(navigationSize);
        Map<String, Object> param = new HashMap<>();
        param.put("sido_code", map.get("sido_code"));
        param.put("gugun_code", map.get("gugun_code"));
        param.put("content_type_id", map.get("content_type_id"));

        int totalCount = attractionInfoDao.getTotalAttractionInfoCount(param);
        pageNavigation.setTotalPageCount(totalCount);

        System.out.println("========== 페이지네이션 확인 ===========");
        System.out.println(totalCount);
        int totalPageCount = (totalCount - 1) / pageSize + 1;
        pageNavigation.setTotalPageCount(totalPageCount);
        System.out.println(totalPageCount);

        boolean startRange = currentPage <= navigationSize;
        pageNavigation.setStartRange(startRange);

        boolean endRange = (totalPageCount - 1) / navigationSize * navigationSize < currentPage;
        pageNavigation.setEndRange(endRange);

        pageNavigation.makeNavigator();
        return pageNavigation;
    }
}
