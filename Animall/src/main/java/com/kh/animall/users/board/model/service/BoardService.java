package com.kh.animall.users.board.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.board.model.vo.Board;
import com.kh.animall.users.board.model.vo.BoardReply;

public interface BoardService {

	Map<String, Object> insert(Board board, List<MultipartFile> file, HttpServletRequest req, HttpSession session);

	List<Board> getList(int index, HttpSession session);

	Map<String, Object> getDetail(int bno, HttpSession session);

	Map<String, Object> insertReply(BoardReply boardReply, HttpSession session);

	Map<String, Object> blike(int bno, HttpSession session);

	Map<String, Object> update(Board board, HttpSession session);

	Map<String, Object> getUpdateForm(int bno, HttpSession session);

	Map<String, Object> delete(int bno, HttpSession session);

	Map<String, Object> replyDelete(int bno, HttpSession session);

	
}
