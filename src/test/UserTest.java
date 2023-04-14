package test;

import com.ssafy.user.model.dao.UserDao;
import com.ssafy.user.model.dao.UserDaoImpl;
import com.ssafy.user.model.dto.UserDto;

import java.sql.SQLException;

public class UserTest {
    public static void main(String[] args) {
        // 회원가입 테스트
        UserDao userDao = UserDaoImpl.getInstance();

        UserDto userDto = new UserDto();
        userDto.setUserId("ssafy");
        userDto.setUserPwd("1234");
        userDto.setEmailId("ssafy");
        userDto.setEmailDomain("ssafy.com");

        try {
            userDao.regist(userDto);
            System.out.println("회원가입 완료!");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
