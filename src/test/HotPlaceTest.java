package test;

import com.ssafy.hotplace.model.dto.HotPlaceDto;
import com.ssafy.hotplace.model.service.HotPlaceService;
import com.ssafy.hotplace.model.service.HotPlaceServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HotPlaceTest {
    public static void main(String[] args) {
        HotPlaceService hotPlaceService = HotPlaceServiceImpl.getInstance();

        String userId = "test";
        String title = "핫플레이스 테스트";
        String visitedDate = "2023.04.15";
        String type = "임시";
        String content = "핫플레이스 내용";
        double latitude = 37.52756879;
        double longitude = 126.9173277;
        String image = "이미지 경로";

        /* 핫플레이스 등록 테스트 */
        HotPlaceDto dto = new HotPlaceDto();
        dto.setUserId(userId);
        dto.setTitle(title);
        dto.setVisitedDate(visitedDate);
        dto.setType(type);
        dto.setContent(content);
        dto.setLatitude(latitude);
        dto.setLongitude(longitude);
        dto.setImage(image);

        try {
            hotPlaceService.addHotPlace(dto);
            System.out.println("등록 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 핫플레이스 전체 조회 테스트 */
        List<HotPlaceDto> dtos = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        String pageNo = "1";
        String key = "";
        String word = "";
        map.put("pageNo", pageNo == null ? "" : pageNo);
        map.put("key", key == null ? "" : key);
        map.put("word", word == null ? "" : word);
        try {
            dtos = hotPlaceService.getHotPlaceList(map);
            System.out.println("전체 조회 성공!");
            for (HotPlaceDto hotPlaceDto : dtos) {
                System.out.println(hotPlaceDto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        /* 핫플레이스 상세 조회 테스트 */
        try {
            dto = hotPlaceService.getHotPlace(5);
            System.out.println("상세 조회 성공!");
            System.out.println(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 핫플레이스 수정 테스트 */
        dto.setHotPlaceId(2);
        dto.setTitle("핫플레이스 수정 테스트");
        dto.setVisitedDate("2003.04.12");
        dto.setType("핫플레이스 수정 테스트");
        dto.setContent("핫플레이스 내용 수정 테스트");
        try {
            hotPlaceService.modifyHotPlace(dto);
            System.out.println("수정 완료!");
            System.out.println(hotPlaceService.getHotPlace(dto.getHotPlaceId()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        /* 핫플레이스 삭제 테스트 */
        try {
            hotPlaceService.deleteHotPlace(4);
            System.out.println("삭제 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
