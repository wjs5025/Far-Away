package com.ssafy.hotplace.model.dao;

import com.ssafy.hotplace.model.dto.HotPlaceDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface HotPlaceDao {
    void addHotPlace(HotPlaceDto hotPlaceDto) throws SQLException;
    List<HotPlaceDto> getHotPlaceList(Map<String, Object> param) throws SQLException;
    int getTotalHotPlaceCount(Map<String, Object> param) throws SQLException;
    HotPlaceDto getHotPlace(int hotPlaceId) throws SQLException;
    void updateHit(int hotPlaceId) throws SQLException;
    void modifyHotPlace(HotPlaceDto hotPlaceDto) throws SQLException;
    void deleteHotPlace(int hotPlaceId) throws SQLException;
}
