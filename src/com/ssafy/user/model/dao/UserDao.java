package com.ssafy.user.model.dao;

import com.ssafy.user.model.dto.UserDto;

import java.sql.SQLException;

public interface UserDao {
    int join(UserDto userDto) throws SQLException;
    UserDto login(String userId, String userPwd) throws SQLException;
}
