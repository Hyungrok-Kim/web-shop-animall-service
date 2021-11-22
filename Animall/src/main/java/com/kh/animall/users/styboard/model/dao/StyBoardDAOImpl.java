package com.kh.animall.users.styboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.animall.users.styboard.model.vo.StyBoard;
import com.kh.animall.users.styboard.model.vo.StyBoardImg;

@Repository
public class StyBoardDAOImpl implements StyBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertStyBoard(StyBoard styboard) {
		return sqlSession.insert("styboardMapper.insertStyBoard", styboard);
	}

	@Override
	public int insertStyBoardImg(List<StyBoardImg> list) {
		return sqlSession.insert("styboardMapper.insertStyBoardImg", list);
	}

	@Override
	public List<StyBoard> getList(Map<String, Object> page) {
		return sqlSession.selectList("styboardMapper.getList", page);
	}

	@Override
	public StyBoard getOneBoard(int bno) {
		return sqlSession.selectOne("styboardMapper.getOneBoard", bno);
	}

	@Override
	public List<StyBoardImg> getImgList(int bno) {
		return sqlSession.selectList("styboardMapper.getImgList", bno);
	}

	@Override
	public int countLike(int bno) {
		return sqlSession.selectOne("styboardMapper.countLike", bno);
	}

	@Override
	public int checkLike(Map<String, Object> likeData) {
		return sqlSession.selectOne("styboardMapper.checkLike", likeData);
	}

	@Override
	public int deleteLike(Map<String, Object> likeData) {
		return sqlSession.delete("styboardMapper.deleteLike", likeData);
	}

	@Override
	public int insertLike(Map<String, Object> likeData) {
		return sqlSession.insert("styboardMapper.insertLike", likeData);
	}

	@Override
	public Map<String, Object> getInfo(int mno) {
		return sqlSession.selectOne("styboardMapper.getInfo", mno);
	}

	@Override
	public int getStynoByMno(int mno) {
		return sqlSession.selectOne("styboardMapper.getStynoByMno", mno);
	}

	@Override
	public int delete(int bno) {
		return sqlSession.delete("styboardMapper.delete", bno);
	}

	// 게시글 삭제시 boardImgs 테이블에 isdelete Y로 업데이트 (실제 지우는 건 아님)
	@Override
	public int deleteBoardImg(int bno) {
		return sqlSession.update("styboardMapper.deleteBoardImg", bno);
	}

	@Override
	public int update(StyBoard styboard) {
		return sqlSession.update("styboardMapper.updateBoard", styboard);
	}
	
	

}
