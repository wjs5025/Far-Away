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
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private StringBuilder sql = null;

    private UserDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static UserDaoImpl getInstance() {
        return instance;
    }

    @Override
    public int regist(UserDto userDto) throws SQLException {
        int result = 0;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("insert into users (user_id, user_name, user_password, salt, email_id, email_domain) \n");
            sql.append("values (?, ?, ?, ?, ?, ?)");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userDto.getUserId());
            preparedStatement.setString(2, userDto.getUserName());
            preparedStatement.setString(3, userDto.getUserPwd());
            preparedStatement.setString(4, userDto.getSalt());
            preparedStatement.setString(5, userDto.getEmailId());
            preparedStatement.setString(6, userDto.getEmailDomain());
            result = preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
        return result;
    }

    @Override
    public UserDto login(String userId, String userPwd) throws SQLException {
        UserDto userDto = null;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select user_id, user_name, user_password, email_id, email_domain \n");
            sql.append("from users \n");
            sql.append("where user_id = ? and user_password = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, userPwd);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userDto = new UserDto();
                userDto.setUserId(resultSet.getString(1));
                userDto.setUserName(resultSet.getString(2));
                userDto.setUserPwd(resultSet.getString(3));
                userDto.setEmailId(resultSet.getString(4));
                userDto.setEmailDomain(resultSet.getString(5));
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return userDto;
    }

    @Override
    public UserDto getUser(String userId) throws SQLException {
        UserDto userDto = null;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select user_id, user_name, user_password, email_id, email_domain, join_date \n");
            sql.append("from users \n");
            sql.append("where user_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userDto = new UserDto();
                userDto.setUserId(resultSet.getString("user_id"));
                userDto.setUserName(resultSet.getString("user_name"));
                userDto.setUserPwd(resultSet.getString("user_password"));
                userDto.setEmailId(resultSet.getString("email-id"));
                userDto.setEmailDomain(resultSet.getString("email-domain"));
                userDto.setJoinDate(resultSet.getString("join_date"));
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return userDto;
    }

    @Override
    public String getUserSalt(String userId) throws SQLException {
        String salt = null;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select salt \n");
            sql.append("from users \n");
            sql.append("where user_id = ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                salt = resultSet.getString("salt");
            }
        } finally {
            dbUtil.close(resultSet, connection, preparedStatement);
        }
        return salt;
    }

    @Override
    public void modifyUser(UserDto userDto) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("update users \n");
            sql.append("set user_name = ?, user_password = ?, email_id = ?, email_domain = ? \n");
            sql.append("where user_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userDto.getUserName());
            preparedStatement.setString(2, userDto.getUserPwd());
            preparedStatement.setString(3, userDto.getEmailId());
            preparedStatement.setString(4, userDto.getEmailDomain());
            preparedStatement.setString(5, userDto.getUserId());
            System.out.println(preparedStatement.executeUpdate());
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public void deleteUser(String userId) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("delete from users \n");
            sql.append("where user_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public String findUserPwd(UserDto userDto) throws SQLException {
        String userPwd = "";
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select user_password \n");
            sql.append("from users \n");
            sql.append("where user_id = ? and user_name = ? and email_id = ? and email_domain = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userDto.getUserId());
            preparedStatement.setString(2, userDto.getUserName());
            preparedStatement.setString(3, userDto.getEmailId());
            preparedStatement.setString(4, userDto.getEmailDomain());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userPwd = resultSet.getString(1);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return userPwd;
    }

    @Override
    public String findUserId(UserDto userDto) throws SQLException {
        String userId = "";
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select user_id \n");
            sql.append("from users \n");
            sql.append("where user_name = ? and email_id = ? and email_domain = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, userDto.getUserId());
            preparedStatement.setString(2, userDto.getEmailId());
            preparedStatement.setString(3, userDto.getEmailDomain());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getString(1);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return userId;
    }
}
