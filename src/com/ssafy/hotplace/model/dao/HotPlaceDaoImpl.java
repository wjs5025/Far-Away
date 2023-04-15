package com.ssafy.hotplace.model.dao;

import com.ssafy.hotplace.model.dto.HotPlaceDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class HotPlaceDaoImpl implements HotPlaceDao {
    private static HotPlaceDaoImpl instance = new HotPlaceDaoImpl();
    private DBUtil dbUtil;
    private HotPlaceDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private StringBuilder sql = null;

    public static HotPlaceDaoImpl getInstance() {
        return instance;
    }

    @Override
    public void addHotPlace(HotPlaceDto hotPlaceDto) throws SQLException {

    }

    @Override
    public List<HotPlaceDto> getHotPlaceList(Map<String, Object> param) throws SQLException {
        return null;
    }

    @Override
    public int getTotalHotPlaceCount(Map<String, Object> param) throws SQLException {
        return 0;
    }

    @Override
    public HotPlaceDto getHotPlace(int hotPlaceId) throws SQLException {
        return null;
    }

    @Override
    public void updateHit(int hotPlaceId) throws SQLException {

    }

    @Override
    public void modifyHotPlace(HotPlaceDto hotPlaceDto) throws SQLException {

    }

    @Override
    public void deleteHotPlace(int hotPlaceId) throws SQLException {

    }
}
