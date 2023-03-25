package com.ssafy.attraction.info.model.dao;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface AttractionDao {
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, Object> param) throws SQLException;
}
