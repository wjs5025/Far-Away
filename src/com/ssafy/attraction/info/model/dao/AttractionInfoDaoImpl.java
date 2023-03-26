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
    private List<AttractionInfoDto> attractionInfoList = null;

    private AttractionInfoDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static AttractionInfoDaoImpl getInstance() {
        return instance;
    }

    @Override
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> param) throws SQLException {
        List<AttractionInfoDto> attractionInfoList = new ArrayList<>();
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select content_id, first_image,  title, addr1 \n");
            sql.append("from attraction_info \n");
            String sidoCode = param.get("sido_code");
            String gugunCode = param.get("gugun_code");
            String contentTypeId = param.get("content_type_id");
            System.out.println("======검색 키워드 확인======");
            System.out.println(contentTypeId);
            System.out.println(sidoCode);
            System.out.println(gugunCode);
            System.out.println("======확인 완료======");
            boolean empty = (sidoCode.isEmpty() && gugunCode.isEmpty() && contentTypeId.isEmpty());
            if (!empty) {
                sql.append("where sido_code = ? or gugun_code = ? or content_type_id = ? \n");
            }
            sql.append("limit 10 \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            if(!empty) {
                preparedStatement.setString(1, sidoCode);
                preparedStatement.setString(2, gugunCode);
                preparedStatement.setString(3, contentTypeId);
            }
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                AttractionInfoDto attractionInfoDto = new AttractionInfoDto();
                attractionInfoDto.setContentId(resultSet.getString("content_id"));
                attractionInfoDto.setFirstImage(resultSet.getString("first_image"));
                attractionInfoDto.setTitle(resultSet.getString("title"));
                attractionInfoDto.setAddr1(resultSet.getString("addr1"));
                attractionInfoList.add(attractionInfoDto);
            }
        } finally {
            dbUtil.close();
        }
        System.out.println("데이터 총 길이: " + attractionInfoList.size());
        return attractionInfoList;
    }
}
