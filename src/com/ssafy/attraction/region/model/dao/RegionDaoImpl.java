package com.ssafy.attraction.region.model.dao;

import com.ssafy.attraction.region.model.dto.GugunDto;
import com.ssafy.attraction.region.model.dto.SidoDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RegionDaoImpl implements RegionDao {
    private static RegionDaoImpl instance = new RegionDaoImpl();
    private DBUtil dbUtil;
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private StringBuilder sql = null;
    private List<SidoDto> sidoList = null;
    private List<GugunDto> gugunList = null;

    private RegionDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static RegionDaoImpl getInstance() {
        return instance;
    }

    @Override
    public List<SidoDto> getSidoList() throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select * \n");
            sql.append("from sido \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            resultSet = preparedStatement.executeQuery();
            sidoList = new ArrayList<>();
            while (resultSet.next()) {
                SidoDto sidoDto = new SidoDto();
                sidoDto.setSidoCode(resultSet.getString(1));
                sidoDto.setSidoName(resultSet.getString(2));
                sidoList.add(sidoDto);
            }
        } finally {
            dbUtil.close(connection, resultSet, preparedStatement);
        }
        return sidoList;
    }

    @Override
    public List<GugunDto> getGugunList(String sidoCode) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select gugun_code, gugun_name \n");
            sql.append("from gugun \n");
            sql.append("where sido_code = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, sidoCode);
            resultSet = preparedStatement.executeQuery();

            gugunList = new ArrayList<>();
            while(resultSet.next()) {
                GugunDto gugunDto = new GugunDto();
                gugunDto.setGugunCode(resultSet.getString(1));
                gugunDto.setGugunName(resultSet.getString(2));
                gugunList.add(gugunDto);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return gugunList;
    }
}
