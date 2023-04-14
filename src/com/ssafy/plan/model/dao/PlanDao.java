package com.ssafy.plan.model.dao;

import com.ssafy.plan.model.dto.PlanDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface PlanDao {
    void addPlan(PlanDto planDto) throws SQLException;
    List<PlanDto> getPlanList(Map<String, Object> param) throws SQLException;
    int getTotalPlanCount(Map<String, Object> param) throws SQLException;
    PlanDto getPlan(int planId) throws SQLException;
    void updateHit(int planId) throws SQLException;
    void modifyPlan(PlanDto planDto) throws SQLException;
    void deletePlan(int planId) throws SQLException;
}
