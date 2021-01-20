package com.bootstrap.tutorial.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bootstrap.tutorial.board.model.service.BoardService;
import com.bootstrap.tutorial.board.model.vo.Board;
import com.bootstrap.tutorial.board.model.vo.PageInfo;
import com.bootstrap.tutorial.board.model.vo.Pagination;

@Controller
@RequestMapping("/board") // 클래스에 @RequestMapping을 붙여줌으로 인해 공통 value 이용 가능
public class BoardController {
	
	@Autowired
    private BoardService service;

	@Autowired		  // spring-security.xml에 등록되어 있음.				
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 1. 게시판 홈(목록) 이동 메소드
	 * @return
	 */
	@RequestMapping
	public String Board(Model model, 
						@RequestParam(value="currentPage", // 태그의 name값
									  required = false,	   // 파라미터 필수 입력 여부
									  defaultValue = "1"   // null값 → 1 [ required=true일 시, 400에러 ]
									 )int currentPage) {
		// 게시글 총 갯수
		int listCount = service.getListCount();
		
		// 확인용
		System.out.println("총 게시글 수  : " + listCount);
		
		// 클릭한 페이지, 총 게시글 수 전달
		PageInfo paging = Pagination.getPageInfo(currentPage, listCount);
		
		// 게시글 목록
		ArrayList<Board> boardList = service.getBoardList(paging);
		
		// JSP로 전송
		model.addAttribute("boardList", boardList);
		model.addAttribute("paging", paging);
		
		return "board/board_home";
	}
	
	/**
	 * 2. 게시판 글쓰기 이동 메소드
	 * @return
	 */
	@RequestMapping(value = "/write")
	public String BoardWrite() {
		return "board/board_write";
	}
	
	/**
	 * 3. 게시판 뷰 이동 메소드
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String BoardView(Model model,
							int bNo, 
							String msg,
							@RequestParam(value="currentPage", 
										  required=false, 
										  defaultValue="1"
										  )int currentPage) {
		// 게시글 1개 조회
		Board board = service.selectBoard(bNo);
		
		// 조회수 증가
		int count = service.countUp(bNo);
		
		// TODO
		// currentPage 업데이트 시킬 방법 알아보기!!
		
		if(board != null && count == 1) {
			model.addAttribute("board", board);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("msg", msg);			
			return "board/board_view";
		}else {
			// TODO 나중에 에러 페이지!!
			return "redirect:/board";
		}
	}
	
 	/**
 	 * 4. 게시글 작성 메소드
 	 * @param u
 	 * @param model
 	 * @return
 	 */
 	@RequestMapping("/write/complete")
 	public String InsertBoard(Board board) {
 		
 		// 확인용
 		System.out.println(board);
 		
 		// BCryptPasswordEncoder클래스의 encode 메소드를 통한 암호화 처리
 		board.setbPasswordEnc(bcryptPasswordEncoder.encode(board.getbPassword()));
 		
 		int result = service.InsertBoard(board);
 		
 		if(result == 1) {
 	 		return "redirect:/board";
 		}else {
 			// TODO 나중에 에러 페이지!!
 			return "redirect:/write";
 		}
 	}
 	
 	/**
 	 * 5. 게시글 삭제 AJAX
 	 * @param bNo
 	 * @param pwdInput
 	 * @return
 	 */
 	@ResponseBody // AJAX
 	@RequestMapping("/delete")
 	public String deleteBoard(String bNo, String pwdInput) {
 		System.out.println(bNo);
 		System.out.println(pwdInput);
 		// 게시글 조회
 		Board b = service.selectBoard(Integer.parseInt(bNo));
 		
 		// 비밀번호 비교
 		if(bcryptPasswordEncoder.matches(pwdInput, b.getbPasswordEnc())) {
 			int del = service.deleteBoard(b.getbNo());
 			if(del == 1) {
 		 		return "success";
 			}else {
 				return "fail";
 			}
 		}else {
 			return "no";
 		}
 	}
 	
 	/**
 	 * 6. 게시글 수정
 	 * @param bNo
 	 * @return
 	 * @throws IOException 
 	 */
 	@RequestMapping("/update")
 	public String updateBoard(RedirectAttributes redirectAttributes, Model model, String bNo, String pwdInput) throws IOException {
 		
 		// 게시글 조회
 		Board b = service.selectBoard(Integer.parseInt(bNo));
 		System.out.println(b);
 		
 		// 비밀번호 비교
 		if(bcryptPasswordEncoder.matches(pwdInput, b.getbPasswordEnc())) {
			model.addAttribute("board", b);
			return "board/board_update";
 		}else {
 			redirectAttributes.addAttribute("bNo", b.getbNo());
 			redirectAttributes.addAttribute("msg", "비밀번호가 다릅니다.");
            return "redirect:/board/view";
 		}
 		
 		
 	}
}
