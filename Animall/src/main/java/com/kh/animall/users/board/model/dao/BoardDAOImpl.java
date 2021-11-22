package com.kh.animall.users.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.board.model.vo.Board;
import com.kh.animall.users.board.model.vo.BoardImg;
import com.kh.animall.users.board.model.vo.BoardReply;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	@Override
	public int insertBoardImg(List<BoardImg> list) {
		return sqlSession.insert("boardMapper.insertBoardImg", list);
	}

	@Override
	public List<Board> getList(Map<String,Object> page) {
		return sqlSession.selectList("boardMapper.getList", page);
	}

	@Override
	public Board getOneBoard(int bno) {
		return sqlSession.selectOne("boardMapper.getOneBoard", bno);
	}

	@Override
	public List<BoardReply> getReplyList(int bno) {
		return sqlSession.selectList("boardMapper.getReplyList", bno);
	}

	@Override
	public List<BoardImg> getImgList(int bno) {
		return sqlSession.selectList("boardMapper.getImgList", bno);
	}

	@Override
	public int insertReply(BoardReply boardReply) {
		return sqlSession.insert("boardMapper.insertReply", boardReply);
	}

	@Override
	public int checkLike(Map<String, Object> likeData) {
		return sqlSession.selectOne("boardMapper.checkLike", likeData);
	}

	@Override
	public int deleteLike(Map<String, Object> likeData) {
		return sqlSession.delete("boardMapper.deleteLike", likeData);
		
	}

	@Override
	public int insertLike(Map<String, Object> likeData) {
		return sqlSession.insert("boardMapper.insertLike", likeData);
	}

	@Override
	public int countLike(int bno) {
		return sqlSession.selectOne("boardMapper.countLike", bno);
	}

	@Override
	public int update(Board board) {		
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	@Override
	public int delete(int bno) {
		return sqlSession.delete("boardMapper.deleteBoard", bno);
	}
	
    // 게시글 삭제시 boardImgs 테이블에 isdelete Y로 업데이트 (실제 지우는 건 아님)
	@Override
	public int deleteBoardImg(int bno) {
		return sqlSession.update("boardMapper.deleteBoardImg", bno);
    }
	
	@Override
	public int replyDelete(int rno) {
		return sqlSession.delete("boardMapper.replyDelete", rno);
	}

	@Override
	public BoardReply getOneReply(int rno) {
		return sqlSession.selectOne("boardMapper.getOneReply", rno);
	}

	
	
}
