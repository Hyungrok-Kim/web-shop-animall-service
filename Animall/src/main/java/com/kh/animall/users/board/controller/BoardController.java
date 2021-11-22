package com.kh.animall.users.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.board.model.service.BoardService;
import com.kh.animall.users.board.model.vo.Board;
import com.kh.animall.users.board.model.vo.BoardReply;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		List<Board> boardList = boardService.getList(1, session); // 게시판 1페이지 가져옴
		model.addAttribute("boardList", boardList);
		return "users/board/board";
	}

	@ResponseBody
	@PostMapping("/insert")
	public Map<String, Object> insert(Board board, List<MultipartFile> file, HttpServletRequest req,
			HttpSession session) {
		return boardService.insert(board, file, req, session);
	}

	// 더보기 ajax
	@ResponseBody
	@GetMapping("/getList")
	public List<Board> list(int index, HttpSession session) {
		List<Board> boardList = boardService.getList(index, session);
		return boardList;
	}

	@ResponseBody
	@GetMapping("/getDetail")
	public Map<String, Object> getDetail(int bno, HttpSession session) {
		return boardService.getDetail(bno, session);
	}

	// 댓글
	@ResponseBody
	@GetMapping("/insertReply")
	public Map<String, Object> insertReply(BoardReply boardReply, HttpSession session) {
		return boardService.insertReply(boardReply, session);
	}

	// 좋아요
	@ResponseBody
	@PostMapping("/blike")
	public Map<String, Object> blike(int bno, HttpSession session) {
		return boardService.blike(bno, session);
	}

	// 게시글 수정 페이지 데이터
	@ResponseBody
	@GetMapping("/getUpdateForm")
	public Map<String, Object> getUpdateForm(int bno, HttpSession session) {
		return boardService.getUpdateForm(bno, session);
	}

	// 게시글 수정
	@ResponseBody
	@PostMapping("/update")
	public Map<String, Object> update(Board board, HttpSession session) {
		return boardService.update(board, session);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public Map<String, Object> delete(int bno, HttpSession session) {
		return boardService.delete(bno, session);
	}
	
	@ResponseBody
	@PostMapping("/replyDelete")
	public Map<String, Object> replyDelete(int rno, HttpSession session) {
		return boardService.replyDelete(rno, session);
	}
}
