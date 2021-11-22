package com.kh.animall.users.styboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.animall.users.styboard.model.vo.StyBoard;
import com.kh.animall.users.styboard.model.vo.StyBoardImg;

public interface StyBoardDAO {		

	int insertStyBoard(StyBoard styboard);

	int insertStyBoardImg(List<StyBoardImg> styBoardImgList);
	
	List<StyBoard> getList(Map<String, Object> page);

	StyBoard getOneBoard(int bno);

	List<StyBoardImg> getImgList(int bno);

	int countLike(int bno);

	int checkLike(Map<String, Object> likeData);

	int deleteLike(Map<String, Object> likeData);

	int insertLike(Map<String, Object> likeData);

	Map<String, Object> getInfo(int mno);

	int getStynoByMno(int mno);

	int delete(int bno);

	int deleteBoardImg(int bno);

	int update(StyBoard styboard);
	
}
