package com.kh.animall.users.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.animall.users.board.model.vo.Board;
import com.kh.animall.users.board.model.vo.BoardImg;
import com.kh.animall.users.board.model.vo.BoardReply;

public interface BoardDAO {

	int insertBoard(Board board);

	int insertBoardImg(List<BoardImg> boardImgList);

	List<Board> getList(Map<String, Object> page);

	Board getOneBoard(int bno);

	List<BoardReply> getReplyList(int bno);

	List<BoardImg> getImgList(int bno);

	int insertReply(BoardReply boardReply);

	int checkLike(Map<String, Object> likeData);

	int deleteLike(Map<String, Object> likeData);

	int insertLike(Map<String, Object> likeData);

	int countLike(int bno);

	int update(Board board);

	int delete(int bno);
	
	int deleteBoardImg(int bno);

	BoardReply getOneReply(int rno);

	int replyDelete(int rno);

}
