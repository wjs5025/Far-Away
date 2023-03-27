package com.ssafy.attraction.info.model.dao;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AttractionInfoDaoImpl implements AttractionInfoDao {
    private static AttractionInfoDaoImpl instance = new AttractionInfoDaoImpl();
    private DBUtil dbUtil;

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private StringBuilder sql = null;
    private List<AttractionInfoDto> attractionInfoList = null;


    private AttractionInfoDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static AttractionInfoDaoImpl getInstance() {
        return instance;
    }

    @Override
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, Object> param) throws SQLException {
        List<AttractionInfoDto> attractionInfoList = new ArrayList<>();
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select content_id, first_image,  title, addr1, latitude, longitude \n");
            sql.append("from attraction_info \n");
            String sidoCode = (String) param.get("sido_code");
            String gugunCode = (String) param.get("gugun_code");
            String contentTypeId = (String) param.get("content_type_id");

            if (!sidoCode.isEmpty() && gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? \n");
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and gugun_code = ? \n");
            } else if (!sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and content_type_id = ? \n");
            } else if (sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where content_type_id = ? \n");
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and gugun_code = ? and content_type_id = ? \n");
            }
            sql.append("limit ?, ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            System.out.println(sql);
            int idx = 0;
            if (!sidoCode.isEmpty() && gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, gugunCode);
            } else if (!sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, contentTypeId);
            } else if (sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, contentTypeId);
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, gugunCode);
                preparedStatement.setString(++idx, contentTypeId);
            }
            preparedStatement.setInt(++idx, (Integer) param.get("start"));
            preparedStatement.setInt(++idx, (Integer) param.get("list_size"));
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                AttractionInfoDto attractionInfoDto = new AttractionInfoDto();
                attractionInfoDto.setContentId(resultSet.getString("content_id"));
                attractionInfoDto.setFirstImage(resultSet.getString("first_image"));
                attractionInfoDto.setTitle(resultSet.getString("title"));
                attractionInfoDto.setAddr1(resultSet.getString("addr1"));
                attractionInfoDto.setLatitude(resultSet.getString("latitude"));
                attractionInfoDto.setLongitude(resultSet.getString("longitude"));
                attractionInfoList.add(attractionInfoDto);
            }
        } finally {
            dbUtil.close(preparedStatement, resultSet, connection);
        }
        return attractionInfoList;
    }

    @Override
    public int getTotalAttractionInfoCount(Map<String, Object> param) throws SQLException {
        int cnt = 0;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select count(content_id) \n");
            sql.append("from attraction_info \n");
            String sidoCode = (String) param.get("sido_code");
            String gugunCode = (String) param.get("gugun_code");
            String contentTypeId = (String) param.get("content_type_id");

            if (!sidoCode.isEmpty() && gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? \n");
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and gugun_code = ? \n");
            } else if (!sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and content_type_id = ? \n");
            } else if (sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where content_type_id = ? \n");
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? and gugun_code = ? and content_type_id = ? \n");
            }
            preparedStatement = connection.prepareStatement(sql.toString());
            int idx = 0;
            if (!sidoCode.isEmpty() && gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, gugunCode);
            } else if (!sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, contentTypeId);
            } else if (sidoCode.isEmpty() && gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, contentTypeId);
            } else if (!sidoCode.isEmpty() && !gugunCode.isEmpty() && !contentTypeId.isEmpty()) {
                preparedStatement.setString(++idx, sidoCode);
                preparedStatement.setString(++idx, gugunCode);
                preparedStatement.setString(++idx, contentTypeId);
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                cnt = resultSet.getInt(1);
            }
        } finally {
            dbUtil.close(resultSet, preparedStatement, connection);
        }
        return cnt;
    }
}
