package com.ssafy.board.model.service;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.util.PageNavigation;

import java.util.List;
import java.util.Map;

public interface BoardService {
    void addBoard(BoardDto boardDto) throws Exception;
    List<BoardDto> getBoardList(Map<String, String> map) throws Exception;
    PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
    BoardDto getBoard(int boardId) throws Exception;
    void updateHit(int boardId) throws Exception;
    void modifyBoard(BoardDto boardDto) throws Exception;
    void deleteBoard(int boardId) throws Exception;
}
