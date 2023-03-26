package com.ssafy.attraction.info.model.service;

import com.ssafy.attraction.info.model.dao.AttractionInfoDao;
import com.ssafy.attraction.info.model.dao.AttractionInfoDaoImpl;
import com.ssafy.attraction.info.model.dto.AttractionInfoDto;

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
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> param) throws Exception {
        return attractionInfoDao.getAttractionInfoList(param);
    }
}
