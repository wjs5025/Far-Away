package com.ssafy.attraction.info.model.dao;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AttractionInfoDaoImpl implements AttractionInfoDao {
    private static AttractionInfoDaoImpl instance = new AttractionInfoDaoImpl();
    private DBUtil dbUtil;

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private List<AttractionInfoDto> attractionInfoList = null;

    private AttractionInfoDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static AttractionInfoDaoImpl getInstance() {
        return instance;
    }

    @Override
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> param) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select * \n");
            sql.append("from attraction_info \n");
            String sidoCode = param.get("sido-code");
            String gugunCode = param.get("gugun-code");
            String contentTypeId = param.get("content-type-id");
            if (!sidoCode.isEmpty() | !gugunCode.isEmpty() | !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? or gugun_code = ? or content_type_id = ? \n");
                preparedStatement.setString(1, sidoCode);
                preparedStatement.setString(2, gugunCode);
                preparedStatement.setString(3, contentTypeId);
            }
            preparedStatement = connection.prepareStatement(sql.toString());
        } finally {
            dbUtil.close();
        }
        return null;
    }
}
