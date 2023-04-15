package com.ssafy.hotplace.model.dao;

import com.ssafy.hotplace.model.dto.HotPlaceDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("insert into hotplaces (user_id, title, visited_date, type, content, latitude, longitude, image) \n");
            sql.append("values (?, ?, ?, ?, ?, ?, ?, ?) \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, hotPlaceDto.getUserId());
            preparedStatement.setString(2, hotPlaceDto.getTitle());
            preparedStatement.setString(3, hotPlaceDto.getVisitedDate());
            preparedStatement.setString(4, hotPlaceDto.getType());
            preparedStatement.setString(5, hotPlaceDto.getContent());
            preparedStatement.setDouble(6, hotPlaceDto.getLatitude());
            preparedStatement.setDouble(7, hotPlaceDto.getLongitude());
            preparedStatement.setString(8, hotPlaceDto.getImage());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public List<HotPlaceDto> getHotPlaceList(Map<String, Object> param) throws SQLException {
        List<HotPlaceDto> hotPlaceDtoList = new ArrayList<>();
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select * from hotplaces \n");

            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    key = (String) param.get("key");
                }
            }
            if (!key.isEmpty()) {
                sql.append("where type = ? \n");
                preparedStatement.setString(1, key);
            }
            sql.append("order by hotplace_id desc \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                HotPlaceDto dto = new HotPlaceDto();
                dto.setHotPlaceId(resultSet.getInt("hotplace_id"));
                dto.setUserId(resultSet.getString("user_id"));
                dto.setTitle(resultSet.getString("title"));
                dto.setVisitedDate(resultSet.getString("visited_date"));
                dto.setType(resultSet.getString("title"));
                dto.setContent(resultSet.getString("content"));
                dto.setLatitude(resultSet.getDouble("latitude"));
                dto.setLongitude(resultSet.getDouble("longitude"));
                dto.setImage(resultSet.getString("image"));
                hotPlaceDtoList.add(dto);
            }
        } finally {
            dbUtil.close(preparedStatement, connection, resultSet);
        }
        return hotPlaceDtoList;
    }

    @Override
    public int getTotalHotPlaceCount(Map<String, Object> param) throws SQLException {
        int cnt = 0;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select count(*) from hotplaces \n");

            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    key = (String) param.get("key");
                }
            }
            if (!key.isEmpty()) {
                sql.append("where type = ? \n");
                preparedStatement.setString(1, key);
            }
            sql.append("order by hotplace_id desc \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                cnt = resultSet.getInt(1);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return cnt;
    }

    @Override
    public HotPlaceDto getHotPlace(int hotPlaceId) throws SQLException {
        HotPlaceDto dto = null;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select * from hotplaces \n");
            sql.append("where hotplace_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, hotPlaceId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                dto = new HotPlaceDto();
                dto.setHotPlaceId(resultSet.getInt("hotplace_id"));
                dto.setUserId(resultSet.getString("user_id"));
                dto.setTitle(resultSet.getString("title"));
                dto.setVisitedDate(resultSet.getString("visited_date"));
                dto.setType(resultSet.getString("title"));
                dto.setContent(resultSet.getString("content"));
                dto.setLatitude(resultSet.getDouble("latitude"));
                dto.setLongitude(resultSet.getDouble("longitude"));
                dto.setImage(resultSet.getString("image"));
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return dto;
    }

    @Override
    public void updateHit(int hotPlaceId) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("update hotplaces \n");
            sql.append("set hit = hit + 1 \n");
            sql.append("where hotplace_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, hotPlaceId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public void modifyHotPlace(HotPlaceDto hotPlaceDto) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("update hotplaces \n ");
            sql.append("set title = ?, visited_date = ?, type = ?, content = ?, latitude = ?, longitude = ?, image = ? \n");
            sql.append("where hotplace_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, hotPlaceDto.getTitle());
            preparedStatement.setString(2, hotPlaceDto.getVisitedDate());
            preparedStatement.setString(3, hotPlaceDto.getType());
            preparedStatement.setString(4, hotPlaceDto.getContent());
            preparedStatement.setDouble(5, hotPlaceDto.getLatitude());
            preparedStatement.setDouble(6, hotPlaceDto.getLongitude());
            preparedStatement.setString(7, hotPlaceDto.getImage());
            preparedStatement.setInt(8, hotPlaceDto.getHotPlaceId());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(preparedStatement, connection);
        }
    }

    @Override
    public void deleteHotPlace(int hotPlaceId) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("delete from hotplaces \n");
            sql.append("where hotplace_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, hotPlaceId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }
}
