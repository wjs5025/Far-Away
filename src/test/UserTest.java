package test;

import com.ssafy.user.model.dto.UserDto;
import com.ssafy.user.model.service.UserService;
import com.ssafy.user.model.service.UserServiceImpl;
import com.ssafy.util.Encrypt;

public class UserTest {
    public static void main(String[] args) {
        /* 회원 가입 테스트 */
        UserService userService = UserServiceImpl.getInstance();

        UserDto userDto = new UserDto();
        userDto.setUserId("ssafy");
        userDto.setUserName("최영환");
        userDto.setUserPwd("1234");
        userDto.setEmailId("ssafy");
        userDto.setEmailDomain("ssafy.com");

        try {
            userService.regist(userDto);
            System.out.println("회원가입 완료!");
        } catch (Exception e) {
            System.out.println("회원가입 실패!");
            e.printStackTrace();
        }
        /* 회원가입 테스트 종료 */

        /* 로그인 테스트 시작 */
        Encrypt encrypt = new Encrypt();
        String inputId = "ssafy";
        String inputPwd = "1234";
        try {
            userService.login(inputId, inputPwd);
            System.out.println("로그인 성공!");
        } catch (Exception e) {
            System.out.println("로그인 실패!");
            e.printStackTrace();
        }
        /* 로그인 테스트 종료 */

        /* 회원 정보 조회 테스트 시작 */
        inputId = "ssafy";
        try {
            System.out.println("회원 정보 조회 성공!");
            System.out.println(userService.getUser(inputId));
        } catch (Exception e) {
            System.out.println("회원 정보 조회 실패!");
            e.printStackTrace();
        }

        /* 회원 정보 조회 테스트 종료 */

        /* 회원 정보 수정 테스트 시작 */
        userDto.setUserName("수정테스트");
        try {
            userService.modifyUser(userDto);
            System.out.println(userService.getUser(userDto.getUserId()));
            System.out.println("회원 정보 수정 성공!");
        } catch (Exception e) {
            System.out.println("회원 정보 수정 실패!");
        }
        /* 회원 정보 수정 테스트 종료 */

        /* 회원 탈퇴 테스트 시작 */
        try {
            System.out.println("회원 탈퇴 성공!");
            userService.deleteUser(inputId);
        } catch (Exception e) {
            System.out.println("회원 탈퇴 실패!");
            e.printStackTrace();
        }
        /* 회원 탈퇴 테스트 종료 */
    }
}

