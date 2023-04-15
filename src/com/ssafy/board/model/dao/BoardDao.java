package com.ssafy.board.model.dao;

import com.ssafy.board.model.dto.BoardDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface BoardDao {
    void addBoard(BoardDto boardDto) throws SQLException;
    List<BoardDto> getBoardList(Map<String, Object> param) throws SQLException;
    int getTotalBoardCount(Map<String, Object> param) throws SQLException;
    BoardDto getBoard(int boardId) throws SQLException;
    void updateHit(int boardId) throws SQLException;
    void modifyBoard(BoardDto boardDto) throws SQLException;
    void deleteBoard(int boardId) throws SQLException;
}
