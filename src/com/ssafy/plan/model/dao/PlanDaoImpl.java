package com.ssafy.plan.model.dao;

import com.ssafy.plan.model.dto.PlanDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PlanDaoImpl implements PlanDao {
    private static PlanDaoImpl instance = new PlanDaoImpl();
    private static DBUtil dbUtil;

    private PlanDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private StringBuilder sql = null;

    public static PlanDaoImpl getInstance() {
        return instance;
    }

    @Override
    public void addPlan(PlanDto planDto) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("insert into plans (title, user_id, departure_time, arrival_time, content, trip_course) \n");
            sql.append("values (?, ?, ?, ?, ?, ?)");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, planDto.getTitle());
            preparedStatement.setString(2, planDto.getUserId());
            preparedStatement.setString(3, planDto.getDepartureTime());
            preparedStatement.setString(4, planDto.getArrivalTime());
            preparedStatement.setString(5, planDto.getContent());
            preparedStatement.setString(6, planDto.getTripCourse());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }

    }

    @Override
    public List<PlanDto> getPlanList(Map<String, Object> param) throws SQLException {
        List<PlanDto> planDtoList = new ArrayList<>();
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select plan_id, user_id, title, content, hit, departure_time, arrival_time, register_time \n");
            sql.append("from plans \n");
            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    sql.append("where title like concat('%', ?, '%') \n");
                } else {
                    sql.append("where ").append(key).append(" = ? \n");
                }
            }
            sql.append("order by plan_id desc \n");
            sql.append("limit ?, ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            int idx = 0;
            if (!key.isEmpty() && !word.isEmpty())
                preparedStatement.setString(++idx, word);
            preparedStatement.setInt(++idx, (Integer) param.get("start"));
            preparedStatement.setInt(++idx, (Integer) param.get("listSize"));
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PlanDto planDto = new PlanDto();
                planDto.setPlanId(resultSet.getInt("plan_id"));
                planDto.setUserId(resultSet.getString("user_id"));
                planDto.setTitle(resultSet.getString("title"));
                planDto.setContent(resultSet.getString("content"));
                planDto.setHit(resultSet.getInt("hit"));
                planDto.setDepartureTime(resultSet.getString("departure_time"));
                planDto.setArrivalTime(resultSet.getString("arrival_time"));
                planDto.setRegisterTime(resultSet.getString("register_time"));
                planDtoList.add(planDto);
            }
        } finally {
            dbUtil.close(resultSet, preparedStatement, connection);
        }
        return planDtoList;
    }

    @Override
    public int getTotalPlanCount(Map<String, Object> param) throws SQLException {
        int cnt = 0;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select count(plan_id) \n");
            sql.append("from plans \n");
            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    sql.append("where title like concat('%', ?, '%') \n");
                } else {
                    sql.append("where ").append(key).append(" = ? \n");
                }
            }
            sql.append("order by plan_id desc \n");
            sql.append("limit ?, ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            int idx = 0;
            if (!key.isEmpty() && !word.isEmpty())
                preparedStatement.setString(++idx, word);
            preparedStatement.setInt(++idx, (Integer) param.get("start"));
            preparedStatement.setInt(++idx, (Integer) param.get("listSize"));
            resultSet = preparedStatement.executeQuery();
            cnt = resultSet.getInt(1);
        } finally {
            dbUtil.close(resultSet, preparedStatement, connection);
        }
        return cnt;
    }

    @Override
    public PlanDto getPlan(int planId) throws SQLException {
        PlanDto planDto = null;
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("select plan_id, user_id, title, content, hit, departure_time, arrival_time, register_time, trip_course \n");
            sql.append("from plans \n");
            sql.append("where article_no = ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, planId);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                planDto = new PlanDto();
                planDto.setPlanId(resultSet.getInt("plan_id"));
                planDto.setUserId(resultSet.getString("user_id"));
                planDto.setTitle(resultSet.getString("title"));
                planDto.setContent(resultSet.getString("content"));
                planDto.setHit(resultSet.getInt("hit"));
                planDto.setDepartureTime(resultSet.getString("departure_time"));
                planDto.setArrivalTime(resultSet.getString("arrival_time"));
                planDto.setRegisterTime(resultSet.getString("register_time"));
                planDto.setTripCourse(resultSet.getString("trip_course"));
            }
        } finally {
            dbUtil.close(resultSet, preparedStatement, connection);
        }
        return planDto;
    }

    @Override
    public void updateHit(int planId) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("update plans \n");
            sql.append("set hit = hit + 1 \n");
            sql.append("where plan_id = ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, planId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(preparedStatement, connection);
        }
    }

    @Override
    public void modifyPlan(PlanDto planDto) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("update plan \n");
            sql.append("set title = ?, content = ?, departure_time = ?, register_time = ?, trip_course = ? \n");
            sql.append("where plan_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, planDto.getTitle());
            preparedStatement.setString(2, planDto.getContent());
            preparedStatement.setString(3, planDto.getDepartureTime());
            preparedStatement.setString(4, planDto.getRegisterTime());
            preparedStatement.setString(5, planDto.getTripCourse());
            preparedStatement.setInt(6, planDto.getPlanId());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public void deletePlan(int planId) throws SQLException {
        try {
            connection = dbUtil.getConnection();
            sql = new StringBuilder();
            sql.append("delete from plans \n");
            sql.append("where plan_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, planId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }
}
