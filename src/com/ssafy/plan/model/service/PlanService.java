package com.ssafy.plan.model.service;

import com.ssafy.plan.model.dto.PlanDto;

import java.util.List;
import java.util.Map;

public interface PlanService {
    void addPlan(PlanDto planDto) throws Exception;
    List<PlanDto> getPlanList(Map<String, Object> param) throws Exception;
    int getTotalPlanCount(Map<String, Object> param) throws Exception;
    PlanDto getPlan(int planId) throws Exception;
    void updateHit(int planId) throws Exception;
    void modifyPlan(PlanDto planDto) throws Exception;
    void deletePlan(int planId) throws Exception;
}
