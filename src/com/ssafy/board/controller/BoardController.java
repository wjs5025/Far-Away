package com.ssafy.board.controller;

import com.ssafy.board.model.dao.BoardDaoImpl;
import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.BoardServiceImpl;
import com.ssafy.user.model.dto.UserDto;
import com.ssafy.util.PageNavigation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/board")
public class BoardController extends HttpServlet {
    private BoardService boardService;

    public void init() {
        boardService = BoardServiceImpl.getInstance();
    }

    private void redirect(HttpServletRequest req, HttpServletResponse resp, String path) throws IOException {
        resp.sendRedirect(req.getContextPath() + path);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "mv-add":
                if (isLogined(req, resp)) {
                    redirect(req, resp, "/Board/board_write.jsp");
                } else {
                    redirect(req, resp, "/User/user_login.jsp");
                }
                break;
            case "add":
                add(req, resp);
                break;
            case "get":
                get(req, resp);
                break;
            case "get-list":
                getList(req, resp);
                break;
            case "mv-modify":
                mvModify(req, resp);
                break;
            case "modify":
                modify(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            default:
                break;

        }


    }

    private void mvModify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int boardId = Integer.parseInt(req.getParameter("boardId"));

        try {
            BoardDto boardDto = boardService.getBoard(boardId);

            if (boardDto == null) {
                throw new Exception();
            }
            if (boardDto.getCategory().equals("notice")) {
                boardDto.setCategory("공지사항");
            } else if (boardDto.getCategory().equals("share")) {
                boardDto.setCategory("공유게시판");
            }
            req.setAttribute("boardDto", boardDto);
            forward(req, resp, "/Board/board_modify.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "게시글 조회에 실패했습니다. 잘못된 게시글 번호입니다.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private boolean isLogined(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            return false;
        }
        return true;
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        doGet(req, resp);
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = ((UserDto) session.getAttribute("user")).getUserId();
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String category = req.getParameter("category");


        BoardDto boardDto = new BoardDto();

        boardDto.setUserId(userId);
        boardDto.setContent(content);
        boardDto.setCategory(category);

        try {
//            for (int i = 0; i < 50; i++) {
//                boardDto.setTitle(title + ".." + i);
//                boardService.addBoard(boardDto);
//            }
            redirect(req, resp, "/board?action=get-list&category=" + category + "&pageNo=1&key=&word=");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "게시글 작성에 실패했습니다. 잠시 후 다시 시도하세요.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void get(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int boardId = Integer.parseInt(req.getParameter("boardId"));
        try {
            BoardDto boardDto = boardService.getBoard(boardId);

            if (boardDto == null) {
                throw new Exception();
            }
            boardService.updateHit(boardId);
            if (boardDto.getCategory().equals("notice")) {
                boardDto.setCategory("공지사항");
            } else if (boardDto.getCategory().equals("share")) {
                boardDto.setCategory("공유게시판");
            }
            req.setAttribute("boardDto", boardDto);
            System.out.println(boardDto.getUserId());
            System.out.println(req.getSession().getAttribute("user"));
            forward(req, resp, "/Board/board_detail.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "게시글 조회에 실패했습니다. 잘못된 게시글 번호입니다.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void getList(HttpServletRequest req, HttpServletResponse resp) {
        Map<String, String> map = new HashMap<>();
        String category = req.getParameter("category");
        String pageNo = req.getParameter("pageNo");
        String key = req.getParameter("key");
        String word = req.getParameter("word");

        map.put("category", category == null ? "" : category);
        map.put("pageNo", pageNo == null ? "" : pageNo);
        map.put("key", key == null ? "" : key);
        map.put("word", word == null ? "" : word);

        try {
            List<BoardDto> boardList = boardService.getBoardList(map);
            req.setAttribute("list", boardList);

            PageNavigation pageNavigation = boardService.makePageNavigation(map);
            req.setAttribute("navigation", pageNavigation);

            forward(req, resp, "/Board/" + category + "_list.jsp?pageNo=1&key=" + key + "&word=" + word);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int boardId = Integer.parseInt(req.getParameter("boardId"));
        String userId = ((UserDto) session.getAttribute("user")).getUserId();
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String category = req.getParameter("category");

        BoardDto boardDto = new BoardDto();

        boardDto.setBoardId(boardId);
        boardDto.setUserId(userId);
        boardDto.setTitle(title);
        boardDto.setContent(content);
        boardDto.setCategory(category);

        try {
            boardService.modifyBoard(boardDto);
            redirect(req, resp, "/board?action=get-list&category=" + category + "&pageNo=1");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "게시글 수정에 실패했습니다. 잠시 후 다시 시도하세요.");
            forward(req, resp, "/error/error.jsp");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int boardId = Integer.parseInt(req.getParameter("boardId"));
        String category = req.getParameter("category");

        try {
            boardService.deleteBoard(boardId);
            redirect(req, resp, "/board?action=get-list&category=" + category + "&pageNo=1");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "게시글 삭제에 실패했습니다.");
            forward(req, resp, "/error/error.jsp");
        }
    }


}
