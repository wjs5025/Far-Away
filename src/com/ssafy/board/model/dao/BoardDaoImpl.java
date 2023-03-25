package com.ssafy.board.model.dao;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDaoImpl implements BoardDao {
    private static BoardDaoImpl instance = new BoardDaoImpl();
    private static DBUtil dbUtil;

    private BoardDaoImpl() {
        dbUtil = DBUtil.getInstance();
    }

    public static BoardDaoImpl getInstance() {
        return instance;
    }

    @Override
    public void addBoard(BoardDto boardDto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("insert into board (user_id, title, content, category \n")
                    .append("values (?, ?, ?, ?) \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, boardDto.getUserId());
            preparedStatement.setString(2, boardDto.getTitle());
            preparedStatement.setString(3, boardDto.getContent());
            preparedStatement.setString(4, boardDto.getCategory());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public List<BoardDto> getBoardList(Map<String, Object> param) throws SQLException {
        List<BoardDto> boardDtoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select board_id, user_id, title, content, category, hit, register_time \n")
                    .append("from board \n");
            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    sql.append("where title like concat('%', ?, '%') \n");
                } else {
                    sql.append("where ").append(key).append(" = ? \n");
                }
            }
            sql.append("and category = ? \n")
                    .append("order by board_id desc").append("limit ?, ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());

            int idx = 0;
            if (!key.isEmpty() && !word.isEmpty()) {
                preparedStatement.setString(++idx, word);
            }
            preparedStatement.setString(++idx, (String) param.get("category"));
            preparedStatement.setInt(++idx, (Integer) param.get("start"));
            preparedStatement.setInt(++idx, (Integer) param.get("listSize"));
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setBoardId(resultSet.getInt("board_id"));
                boardDto.setUserId(resultSet.getString("user_id"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setCategory(resultSet.getString("category"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegisterTime(resultSet.getString("register_time"));
                boardDtoList.add(boardDto);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return boardDtoList;
    }

    @Override
    public int getTotalBoardCount(Map<String, Object> param) throws SQLException {
        int cnt = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select count(board_id) \n")
                    .append("from board \n");
            String key = (String) param.get("key");
            String word = (String) param.get("word");
            if (!key.isEmpty() && !word.isEmpty()) {
                if ("title".equals(key)) {
                    sql.append("where title like concat('%', ?, '%') \n");
                } else {
                    sql.append("where ").append(key).append(" = ? \n");
                }
            }
            sql.append("and category = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());

            int idx = 0;
            if (!key.isEmpty() && !word.isEmpty()) {
                preparedStatement.setString(++idx, word);
            }
            preparedStatement.setString(++idx, (String) param.get("category"));
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                cnt = resultSet.getInt(1);
            }
        } finally {
            dbUtil.close(connection, preparedStatement, resultSet);
        }
        return cnt;
    }

    @Override
    public BoardDto getBoard(int boardId) throws SQLException {
        BoardDto boardDto = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select article_no, user_id, subject, content, category, hit, register_time \n");
            sql.append("from board \n");
            sql.append("where board_id = ?");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, boardId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                boardDto = new BoardDto();
                boardDto.setBoardId(resultSet.getInt("board_id"));
                boardDto.setUserId(resultSet.getString("user_id"));
                boardDto.setTitle(resultSet.getString("title"));
                boardDto.setContent(resultSet.getString("content"));
                boardDto.setCategory(resultSet.getString("category"));
                boardDto.setHit(resultSet.getInt("hit"));
                boardDto.setRegisterTime(resultSet.getString("register_time"));
            }
        } finally {
            dbUtil.close(resultSet, preparedStatement, connection);
        }
        return boardDto;
    }

    @Override
    public void updateHit(int boardId) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("update board \n")
                    .append("set hit = hit + 1 \n")
                    .append("where board_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, boardId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public void modifyBoard(BoardDto boardDto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("update board  \n")
                    .append("set title = ?, content = ?, category = ? \n")
                    .append("where board_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, boardDto.getTitle());
            preparedStatement.setString(2, boardDto.getContent());
            preparedStatement.setString(3, boardDto.getCategory());
            preparedStatement.setInt(4, boardDto.getBoardId());
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }

    @Override
    public void deleteBoard(int boardId) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = dbUtil.getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("delete from board \n")
                    .append("where board_id = ? \n");
            preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setInt(1, boardId);
            preparedStatement.executeUpdate();
        } finally {
            dbUtil.close(connection, preparedStatement);
        }
    }
}
