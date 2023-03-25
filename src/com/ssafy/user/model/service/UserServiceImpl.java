package com.ssafy.user.model.service;

import com.ssafy.user.model.dao.UserDao;
import com.ssafy.user.model.dao.UserDaoImpl;
import com.ssafy.user.model.dto.UserDto;

public class UserServiceImpl implements UserService {
    private static UserServiceImpl instance = new UserServiceImpl();
    private UserDao userDao;
    private UserServiceImpl() {
        userDao = UserDaoImpl.getInstance();
    }

    @Override
    public int join(UserDto userDto) throws Exception {
        return userDao.join(userDto);
    }

    @Override
    public UserDto login(String userId, String userPwd) throws Exception {
        return userDao.login(userId, userPwd);
    }

    @Override
    public UserDto getUser(String userId) throws Exception {
        return userDao.getUser(userId);
    }

    @Override
    public void modifyUser(UserDto userDto) throws Exception {
        userDao.modifyUser(userDto);
    }

    @Override
    public void deleteUser(String userId) throws Exception {
        userDao.deleteUser(userId);
    }

    @Override
    public String findUserPwd(UserDto userDto) throws Exception {
        return null;
    }

    @Override
    public String findUserId(UserDto userDto) throws Exception {
        return null;
    }
}
