package com.ssafy.attraction.region.model.dao;

import com.ssafy.attraction.region.model.dto.GugunDto;
import com.ssafy.attraction.region.model.dto.SidoDto;

import java.sql.SQLException;
import java.util.List;

public interface RegionDao {
    List<SidoDto> getSidoList() throws SQLException;
    List<GugunDto> getGugunList(String sidoCode) throws SQLException;
}
