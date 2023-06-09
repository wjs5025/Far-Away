package com.ssafy.board.model.service;

import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dao.BoardDaoImpl;
import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.util.PageNavigation;
import com.ssafy.util.SizeConstant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardServiceImpl implements BoardService {
    private static BoardServiceImpl instance = new BoardServiceImpl();
    private BoardDao boardDao;

    Map<String, Object> param;
    private BoardServiceImpl() {
        boardDao = BoardDaoImpl.getInstance();
    }

    public static BoardServiceImpl getInstance() {
        return instance;
    }

    @Override
    public void addBoard(BoardDto boardDto) throws Exception {
        boardDao.addBoard(boardDto);
    }

    @Override
    public List<BoardDto> getBoardList(Map<String, String> map) throws Exception {
        param = new HashMap<>();
        String key = map.get("key");
//		if("userid".equals(key))
//			key = "user-id";
        param.put("key", key.isEmpty() ? "" : key);
        param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
        int pageNo = Integer.parseInt(map.get("pageNo"));
        int start = pageNo * SizeConstant.LIST_SIZE - SizeConstant.LIST_SIZE;
        param.put("start", start);
        param.put("listSize", SizeConstant.LIST_SIZE);
        param.put("category", map.get("category"));

        return boardDao.getBoardList(param);
    }

    @Override
    public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
        PageNavigation pageNavigation = new PageNavigation();

        int naviSize = SizeConstant.NAVIGATION_SIZE;
        int sizePerPage = SizeConstant.LIST_SIZE;
        int currentPage = Integer.parseInt(map.get("pageNo"));

        pageNavigation.setCurrentPage(currentPage);
        pageNavigation.setNaviSize(naviSize);
        param = new HashMap<>();
        String key = map.get("key");
        param.put("key", key.isEmpty() ? "" : key);
        param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
        param.put("category", map.get("category"));
        int totalCount = boardDao.getTotalBoardCount(param);
        pageNavigation.setTotalCount(totalCount);
        int totalPageCount = (totalCount - 1) / sizePerPage + 1;
        pageNavigation.setTotalPageCount(totalPageCount);
        boolean startRange = currentPage <= naviSize;
        pageNavigation.setStartRange(startRange);
        boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
        pageNavigation.setEndRange(endRange);
        pageNavigation.makeNavigator();

        return pageNavigation;
    }

    @Override
    public BoardDto getBoard(int boardId) throws Exception {
        return boardDao.getBoard(boardId);
    }

    @Override
    public void updateHit(int boardId) throws Exception {
        boardDao.updateHit(boardId);
    }

    @Override
    public void modifyBoard(BoardDto boardDto) throws Exception {
        boardDao.modifyBoard(boardDto);
    }

    @Override
    public void deleteBoard(int boardId) throws Exception {
        boardDao.deleteBoard(boardId);
    }
}
