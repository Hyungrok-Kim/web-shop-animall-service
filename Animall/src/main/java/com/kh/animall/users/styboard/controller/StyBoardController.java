package com.kh.animall.users.styboard.controller;

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

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.styboard.model.service.StyBoardService;
import com.kh.animall.users.styboard.model.vo.StyBoard;

@Controller
@RequestMapping("/styBoard")
public class StyBoardController {

	@Autowired
	StyBoardService styBoardService;

	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		List<StyBoard> styBoardList = styBoardService.getList(1, "", session);
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("styBoardList", styBoardList);
		model.addAttribute("mtype", member.getMtype());
		return "users/styboard/styboard";
	}

	@ResponseBody
	@PostMapping("/insert")
	public Map<String, Object> insert(StyBoard styboard, List<MultipartFile> file, HttpServletRequest req,
			HttpSession session) {
		return styBoardService.insert(styboard, file, req, session);
	}

	// 더보기 ajax
	@ResponseBody
	@GetMapping("/getList")
	public List<StyBoard> list(int index, String searchKeyword, HttpSession session) {
		List<StyBoard> styBoardList = styBoardService.getList(index, searchKeyword, session);
		return styBoardList;
	}

	@ResponseBody
	@GetMapping("/getDetail")
	public Map<String, Object> getDetail(int bno, HttpSession session) {
		return styBoardService.getDetail(bno, session);
	}

	@ResponseBody
	@GetMapping("/getInfo")
	public Map<String, Object> getInfo(HttpSession session) {
		return styBoardService.getInfo(session);
	}

	// 좋아요
	@ResponseBody
	@PostMapping("/slike")
	public Map<String, Object> slike(int bno, HttpSession session) {
		return styBoardService.slike(bno, session);
	}

	@ResponseBody
	@PostMapping("/delete")
	public Map<String, Object> delete(int bno, HttpSession session) {
		return styBoardService.delete(bno, session);
	}

	// 게시글 수정 페이지 데이터
	@ResponseBody
	@GetMapping("/getUpdateForm")
	public Map<String, Object> getUpdateForm(int bno, HttpSession session) {
		return styBoardService.getUpdateForm(bno, session);
	}

	// 게시글 수정
	@ResponseBody
	@PostMapping("/update")
	public Map<String, Object> update(StyBoard styboard, HttpSession session) {
		return styBoardService.update(styboard, session);
	}

}
