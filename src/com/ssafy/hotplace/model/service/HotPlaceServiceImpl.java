package com.ssafy.hotplace.model.service;

import com.ssafy.hotplace.model.dao.HotPlaceDao;
import com.ssafy.hotplace.model.dao.HotPlaceDaoImpl;
import com.ssafy.hotplace.model.dto.HotPlaceDto;
import com.ssafy.util.PageNavigation;
import com.ssafy.util.SizeConstant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HotPlaceServiceImpl implements HotPlaceService {
    private static HotPlaceService instance = new HotPlaceServiceImpl();
    private HotPlaceDao hotPlaceDao;
    private HotPlaceServiceImpl() {
        hotPlaceDao = HotPlaceDaoImpl.getInstance();
    }

    public static HotPlaceService getInstance() {
        return instance;
    }

    @Override
    public void addHotPlace(HotPlaceDto hotPlaceDto) throws Exception {
        hotPlaceDao.addHotPlace(hotPlaceDto);
    }

    @Override
    public List<HotPlaceDto> getHotPlaceList(Map<String, String> map) throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        String key = map.get("key");
        param.put("key", key.isEmpty() ? "" : key);
        param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
        int pageNo = Integer.parseInt(map.get("pageNo"));
        int start = pageNo * SizeConstant.LIST_SIZE - SizeConstant.LIST_SIZE;
        param.put("start", start);
        param.put("listSize", SizeConstant.LIST_SIZE);
        return hotPlaceDao.getHotPlaceList(param);
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
        int totalCount = hotPlaceDao.getTotalHotPlaceCount(param);
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
    public HotPlaceDto getHotPlace(int hotPlaceId) throws Exception {
        return hotPlaceDao.getHotPlace(hotPlaceId);
    }

    @Override
    public void updateHit(int hotPlaceId) throws Exception {
        hotPlaceDao.updateHit(hotPlaceId);
    }

    @Override
    public void modifyHotPlace(HotPlaceDto hotPlaceDto) throws Exception {
        hotPlaceDao.modifyHotPlace(hotPlaceDto);
    }

    @Override
    public void deleteHotPlace(int hotPlaceId) throws Exception {
        hotPlaceDao.deleteHotPlace(hotPlaceId);
    }
}
