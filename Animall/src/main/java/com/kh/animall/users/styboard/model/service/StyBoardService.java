package com.kh.animall.users.styboard.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.styboard.model.vo.StyBoard;

public interface StyBoardService {

	Map<String, Object> insert(StyBoard styboard, List<MultipartFile> file, HttpServletRequest req, HttpSession session);

	List<StyBoard> getList(int index, String searchKeyword, HttpSession session);

	Map<String, Object> getDetail(int bno, HttpSession session);
	
	Map<String, Object> slike(int bno, HttpSession session);

	Map<String, Object> getInfo(HttpSession session);

	Map<String, Object> delete(int bno, HttpSession session);

	Map<String, Object> getUpdateForm(int bno, HttpSession session);

	Map<String, Object> update(StyBoard styboard, HttpSession session);

	
}
