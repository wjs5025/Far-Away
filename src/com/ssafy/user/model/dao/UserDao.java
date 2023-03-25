package com.ssafy.user.model.dao;

import com.ssafy.user.model.dto.UserDto;

import java.sql.SQLException;

public interface UserDao {
    int join(UserDto userDto) throws SQLException;
    UserDto login(String userId, String userPwd) throws SQLException;
    UserDto getUser(String userId) throws SQLException;
    void modifyUser(UserDto userDto) throws SQLException;
    void deleteUser(String userId) throws SQLException;
    String findUserPwd(UserDto userDto) throws SQLException;
    String findUserId(UserDto userDto) throws SQLException;
}
