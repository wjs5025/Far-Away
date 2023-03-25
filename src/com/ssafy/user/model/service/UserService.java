package com.ssafy.user.model.service;

import com.ssafy.user.model.dto.UserDto;


public interface UserService {
    int join(UserDto userDto) throws Exception;
    UserDto login(String userId, String userPwd) throws Exception;
    UserDto getUser(String userId) throws Exception;
    void modifyUser(UserDto userDto) throws Exception;
    void deleteUser(String userId) throws Exception;
    String findUserPwd(UserDto userDto) throws Exception;
    String findUserId(UserDto userDto) throws Exception;
}
