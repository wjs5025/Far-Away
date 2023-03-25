package com.ssafy.attraction.info.model.dao;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AttractionDaoImpl implements AttractionDao {
    private static AttractionDaoImpl instance = new AttractionDaoImpl();
    private DBUtil dbUtil;

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private List<AttractionInfoDto> attractionInfoList = null;

    private AttractionDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static AttractionDaoImpl getInstance() {
        return instance;
    }

    @Override
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, Object> param) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select * \n");
            sql.append("from attraction_info \n");
            String sidoCode = (String) param.get("sido-code");
            String gugunCode = (String) param.get("gugun-code");
            String contentTypeId = (String) param.get("content-type-id");
            if (!sidoCode.isEmpty() | !gugunCode.isEmpty() | !contentTypeId.isEmpty()) {
                sql.append("where sido_code = ? or gugun_code = ? or content_type_id = ? \n");
            }
            preparedStatement = connection.prepareStatement(sql.toString());
        } finally {
            dbUtil.close();
        }
        return null;
    }
}
