package test;

import com.ssafy.plan.model.dto.PlanDto;
import com.ssafy.plan.model.service.PlanService;
import com.ssafy.plan.model.service.PlanServiceImpl;

public class PlanTest {
    public static void main(String[] args) {
        PlanService planService = PlanServiceImpl.getInstance();
        PlanDto planDto = new PlanDto();

        /* 여행 경로 등록 테스트 */
        planDto.setUserId("test");
        planDto.setTitle("여의도 들렸다 현충원 방문");
        planDto.setContent("여의도 데이트 후 현충원에 방문!");
        planDto.setDepartureTime("2023.04.14");
        planDto.setArrivalTime("2023.04.14");
        planDto.setTripCourse("(37.52756879, 126.9173277),(37.51383435, 126.92158881),(37.52115011, 126.91849999),(37.50135617, 126.97325112)");

        try {
            planService.addPlan(planDto);
            System.out.println("등록 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 여행경로 조회 테스트 */
        try {
            System.out.println(planService.getPlan(3));
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 여행경로 수정 테스트 */
        planDto.setPlanId(1);
        planDto.setTitle("여의도 갔다가 현충원 방문은 제가 원조입니다.");
        try {
            planService.modifyPlan(planDto);
            System.out.println("수정 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        /* 여행경로 삭제 테스트 */
        try {
            int planId = 4;
            planService.deletePlan(planId);
            System.out.println("삭제 완료!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
