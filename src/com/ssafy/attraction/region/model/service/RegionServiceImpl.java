package com.ssafy.attraction.region.model.service;

import com.ssafy.attraction.region.model.dao.RegionDao;
import com.ssafy.attraction.region.model.dao.RegionDaoImpl;
import com.ssafy.attraction.region.model.dto.GugunDto;
import com.ssafy.attraction.region.model.dto.SidoDto;

import java.util.List;

public class RegionServiceImpl implements RegionService {
    private static RegionServiceImpl instance = new RegionServiceImpl();
    private RegionDao regionDao;
    private RegionServiceImpl() {
        regionDao = RegionDaoImpl.getInstance();
    }

    public static RegionServiceImpl getInstance() {
        return instance;
    }

    @Override
    public List<SidoDto> getSidoList() throws Exception {
        return regionDao.getSidoList();
    }

    @Override
    public List<GugunDto> getGugunList(String sidoCode) throws Exception {
        return regionDao.getGugunList(sidoCode);
    }
}
