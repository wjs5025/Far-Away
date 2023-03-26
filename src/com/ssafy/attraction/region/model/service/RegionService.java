package com.ssafy.attraction.region.model.service;

import com.ssafy.attraction.region.model.dto.GugunDto;
import com.ssafy.attraction.region.model.dto.SidoDto;

import java.util.List;

public interface RegionService {
    List<SidoDto> getSidoList() throws Exception;
    List<GugunDto> getGugunList(String sidoCode) throws Exception;
}
