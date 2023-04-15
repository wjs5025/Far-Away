package test;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.BoardServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardTest {
    public static void main(String[] args) {
        BoardService boardService = BoardServiceImpl.getInstance();
        String userId = "test";
        String title = "공지 게시판 테스트";
        String content = "공지 게시판 내용";
        String category = "공지사항";

        BoardDto boardDto = new BoardDto();
        boardDto.setTitle(title);
        boardDto.setUserId(userId);
        boardDto.setContent(content);
        boardDto.setCategory(category);

        /* 게시글 등록 테스트 */
        try {
            boardService.addBoard(boardDto);
            System.out.println("게시글 등록 성공!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 게시글 전체 조회 테스트 */
        Map<String, String> map = new HashMap<>();
        category = "공지사항";
        String pageNo = "1";
        String key = "";
        String word = "";
        map.put("category", category == null ? "" : category);
        map.put("pageNo", pageNo == null ? "" : pageNo);
        map.put("key", key == null ? "" : key);
        map.put("word", word == null ? "" : word);

        List<BoardDto> boardDtoList = new ArrayList<>();
        try {
            boardDtoList = boardService.getBoardList(map);
            System.out.println("전체 조회 성공!");
            for (BoardDto dto : boardDtoList) {
                System.out.println(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 게시글 상세 조회 테스트 */
        try {
            boardDto = boardService.getBoard(1);
            System.out.println("상세 조회 성공!");
            System.out.println(boardDto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 게시글 수정 테스트 */
        boardDto = new BoardDto();
        boardDto.setBoardId(1);
        boardDto.setUserId(userId);
        boardDto.setCategory("공지사항");
        boardDto.setTitle("공지 게시판 테스트 수정");
        boardDto.setContent("공지 게시판 내용 수정");
        try {
            boardService.modifyBoard(boardDto);
            System.out.println("수정 성공!");
            System.out.println(boardService.getBoard(1));
        } catch (Exception e) {
            e.printStackTrace();
        }

        /* 게시글 삭제 테스트 */
        try {
            boardService.deleteBoard(3);
            System.out.println("게시글 삭제 성공!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
