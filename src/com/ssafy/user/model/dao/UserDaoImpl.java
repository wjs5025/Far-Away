package com.ssafy.user.model.dao;

import com.ssafy.user.model.dto.UserDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    private static UserDaoImpl instance = new UserDaoImpl();
    private DBUtil dbUtil;
    private UserDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static UserDaoImpl getInstance() {
        return instance;
    }

    @Override
    public int join(UserDto userDto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result = 0;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("insert into users (user_id, user_name, user_password, email_id, email_domain) \n");
            sql.append("values (?, ?, ?, ?, ?)");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userDto.getUserId());
            preparedStatement.setString(2, userDto.getUserName());
            preparedStatement.setString(3, userDto.getUserPwd());
            preparedStatement.setString(4, userDto.getEmailId());
            preparedStatement.setString(5, userDto.getEmailDomain());
            result = preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
        return result;
    }

    @Override
    public UserDto login(String userId, String userPwd) throws SQLException {
        UserDto userDto = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select user_id, user_name \n")
                    .append("from users \n")
                    .append("where user_id = ? and user_password = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, userPwd);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userDto = new UserDto();
                userDto.setUserId(resultSet.getString(1));
                userDto.setUserName(resultSet.getString(2));
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return userDto;
    }
}
